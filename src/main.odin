package imgproc

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"
import rl "vendor:raylib"

State :: struct {
	window:     cv.Size,
	image:      rl.Texture2D,
	image_area: struct {
		width:  c.int,
		height: c.int,
	},
	editor:     struct {
		current_page:       ^Page,
		width:              c.int,
		height:             c.int,
		blink_after_frames: int,
		blink_time:         int,
		is_blinking:        bool,
		frame_count:        int,
	},
}

main :: proc() {
	state := State {
		window = {1280, 720},
		image_area = {width = 1280, height = 720 * 3 / 4},
		editor = {
			current_page = new_page(),
			width = 1280,
			height = 720 * 1 / 4,
			blink_after_frames = 30,
			blink_time = 30,
			is_blinking = false,
			frame_count = 0,
		},
	}
	rl.SetConfigFlags({.WINDOW_RESIZABLE | .VSYNC_HINT})
	rl.InitWindow(cast(c.int)state.window.width, cast(c.int)state.window.height, "Computer Vision")
	defer rl.CloseWindow()
	rl.SetTargetFPS(120)

	for !rl.WindowShouldClose() {
		update(&state)
		render(&state)
	}
}
