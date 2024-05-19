package imageprocessing

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"
import rl "vendor:raylib"

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 640

img_to_texture :: proc(m: cv.Mat) -> rl.Texture2D {
	img := rl.Image{}
	img.width = c.int(cv.cols(m))
	img.height = c.int(cv.rows(m))
	img.mipmaps = 1

	fmt.println("CONVERTING IMAGE OF TYPE: ", cv.mat_type(m))
	#partial switch cv.mat_type(m) {
	case .CV_8UC1:
		img.data = cv.data_ptr(m)
		img.format = .UNCOMPRESSED_GRAYSCALE
	case .CV_8UC3:
		img.data = cv.data_ptr(cv.cvt_color(m, .BGRToRGB))
		img.format = .UNCOMPRESSED_R8G8B8
	case .CV_8UC4:
		img.data = cv.data_ptr(cv.cvt_color(m, .BGRAToRGBA))
		img.format = .UNCOMPRESSED_R8G8B8A8
	}

	return rl.LoadTextureFromImage(img)
}

MAX_INPUT_CHARS :: 9

main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Computer Vision")
	defer rl.CloseWindow()

	name := [MAX_INPUT_CHARS + 1]byte {
		0 ..< MAX_INPUT_CHARS + 1 = 0,
	}
	letterCount := 0
	textBox := rl.Rectangle{SCREEN_WIDTH / 2.0 - 100, 180, 225, 50}
	mouseOnText := false
	framesCounter := 0

	rl.SetTargetFPS(10)

	base := cv.imread("assets/logo.png", .Color)
	texture := img_to_texture(base)
	defer rl.UnloadTexture(texture)

	rl.SetWindowSize(texture.width, texture.height)

	on := true
	for !rl.WindowShouldClose() {
		mouseOnText = rl.CheckCollisionPointRec(rl.GetMousePosition(), textBox)

		if mouseOnText {
			rl.SetMouseCursor(.IBEAM) // Set the window's cursor to the I-Beam
			key := rl.GetCharPressed() // Get char pressed (unicode character) on the queue

			// Check if more characters have been pressed on the same frame
			for key > 0 {
				// NOTE: Only allow keys in range [32..125]
				if ((key >= 32) && (key <= 125) && (letterCount < MAX_INPUT_CHARS)) {
					name[letterCount] = cast(byte)key
					name[letterCount + 1] = 0 // Add null terminator at the end of the string.
					letterCount += 1
				}

				key = rl.GetCharPressed() // Check next character in the queue
			}

			if rl.IsKeyPressed(.BACKSPACE) {
				letterCount -= 1
				if (letterCount < 0) do letterCount = 0
				name[letterCount] = 0
			}
		} else do rl.SetMouseCursor(.DEFAULT)

		framesCounter = mouseOnText ? framesCounter + 1 : 0

		rl.BeginDrawing()
		defer rl.EndDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		rl.DrawTexture(texture, 0, 0, rl.WHITE)
		if rl.IsKeyPressed(.SPACE) {
			fmt.println("PRESSED SPACE")
			if on {
				on = false
				texture = img_to_texture(cv.cvt_color(base, .BGRAToGray))
			} else {
				on = true
				texture = img_to_texture(base)
			}
		}

		rl.DrawText("PLACE MOUSE OVER INPUT BOX!", 240, 140, 20, rl.GRAY)

		rl.DrawRectangleRec(textBox, rl.LIGHTGRAY)
		if (mouseOnText) {
			rl.DrawRectangleLines(
				cast(c.int)textBox.x,
				cast(c.int)textBox.y,
				cast(c.int)textBox.width,
				cast(c.int)textBox.height,
				rl.RED,
			)
		} else {
			rl.DrawRectangleLines(
				cast(c.int)textBox.x,
				cast(c.int)textBox.y,
				cast(c.int)textBox.width,
				cast(c.int)textBox.height,
				rl.DARKGRAY,
			)
		}

		rl.DrawText(
			cast(cstring)&name[0],
			cast(c.int)textBox.x + 5,
			cast(c.int)textBox.y + 8,
			40,
			rl.MAROON,
		)

		rl.DrawText(
			rl.TextFormat("INPUT CHARS: %i/%i", letterCount, MAX_INPUT_CHARS),
			315,
			250,
			20,
			rl.DARKGRAY,
		)

		if mouseOnText {
			if letterCount < MAX_INPUT_CHARS {
				// Draw blinking underscore char
				if (((framesCounter / 20) % 2) == 0) {
					rl.DrawText(
						"_",
						cast(c.int)textBox.x + 8 + rl.MeasureText(cast(cstring)&name[0], 40),
						cast(c.int)textBox.y + 12,
						40,
						rl.MAROON,
					)
				} else {
					rl.DrawText("Press BACKSPACE to delete chars...", 230, 300, 20, rl.GRAY)
				}
			}
		}
	}
}
