package imgproc

import "core:c"
import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

render :: proc(app: ^State) {
	rl.BeginDrawing()
	defer rl.EndDrawing()

	rl.ClearBackground(rl.RAYWHITE)
	rl.DrawTexture(app.image.texture, 0, 0, rl.WHITE)

	draw_page(app)
}

draw_page :: proc(app: ^State) {
	draw_cursor(app)
	draw_line_number(app)
	draw_text(app)
}

draw_line_number :: proc(app: ^State) {
	rl.DrawRectangle(0, app.image.texture.height, 20, app.editor.height, rl.GRAY) // line number area

	buffer := [20]byte{}
	line_number: string
	c_line_number: cstring
	width: c.int
	for i in 0 ..< len(app.editor.current_page.lines) {
		line_number = strconv.itoa(buffer[:], i + 1)
		c_line_number = strings.clone_to_cstring(line_number)
		width = rl.MeasureText(c_line_number, 20)
		rl.DrawText(
			c_line_number,
			15 - width,
			app.image.texture.height + 10 + cast(c.int)i * 20,
			20,
			rl.DARKGRAY,
		)
	}
}

draw_text :: proc(app: ^State) {
	text: string
	c_text: cstring
	for line, i in app.editor.current_page.lines {
		text = to_string(line)
		c_text = strings.clone_to_cstring(text)
		rl.DrawText(
			text = c_text,
			posX = 25,
			posY = app.image.texture.height + 10 + cast(c.int)i * 20,
			fontSize = 20,
			color = rl.BLACK,
		)
	}
}

draw_cursor :: proc(app: ^State) {
	cursor_x, cursor_y := get_cursor_xy(app.editor.current_page)
	if app.editor.is_blinking {
		if app.editor.frame_count < app.editor.blink_time {
			rl.DrawRectangle(
				25 + cast(c.int)cursor_x,
				app.image.texture.height + 10 + cast(c.int)cursor_y,
				12,
				20,
				rl.BLACK,
			)
		}
	} else {
		rl.DrawRectangle(
			25 + cast(c.int)cursor_x,
			app.image.texture.height + 10 + cast(c.int)cursor_y,
			12,
			20,
			rl.BLACK,
		)
	}
}
