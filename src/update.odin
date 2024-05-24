package imgproc

import "core:fmt"
import rl "vendor:raylib"

update :: proc(app: ^State) {
	key := rl.GetCharPressed()

	for key > 0 {
		if key >= 32 && key <= 125 {
			add_char_to_current_line(app.editor.current_page, cast(byte)key)
			app.editor.is_blinking = false
			app.editor.frame_count = 0
		}

		key = rl.GetCharPressed() // Check next character in the queue
	}

	if rl.IsKeyPressed(.RIGHT) {
		move_cursor_right(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.LEFT) {
		move_cursor_left(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.UP) {
		move_up_line(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.DOWN) {
		move_down_line(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.DELETE) {
		delete_char_after_cursor(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.BACKSPACE) {
		delete_char_at_cursor(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	if rl.IsKeyPressed(.ENTER) {
		lines := app.editor.current_page.lines
		last_line := lines[len(app.editor.current_page.lines) - 1]
		if last_line.tail.prev.char == ';' {
			process_command(app)
			delete_all_lines(app.editor.current_page)
		} else {
			handle_new_line(app.editor.current_page)
		}
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}

	app.editor.frame_count += 1
	if !app.editor.is_blinking && app.editor.frame_count > app.editor.blink_after_frames {
		app.editor.is_blinking = true
		app.editor.frame_count = 0
	}

	if app.editor.is_blinking {
		app.editor.frame_count = app.editor.frame_count % (2 * app.editor.blink_time)
	}

	app.image_area.height = rl.GetScreenHeight() * 3 / 4
	app.editor.height = rl.GetScreenHeight() * 1 / 4
}
