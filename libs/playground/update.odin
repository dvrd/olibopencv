package imgproc

import "core:log"
import rl "vendor:raylib"

handle_navigation :: proc(app: ^State) {
	key := rl.GetKeyPressed()
	#partial switch key {
	case .I:
		app.editor.mode = .Insert
	case .ESCAPE:
		app.editor.mode = .Normal
	}

	if app.editor.mode != .Normal do return

	#partial switch key {
	case .L, .RIGHT:
		move_cursor_right(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	case .H, .LEFT:
		move_cursor_left(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	case .K, .UP:
		move_up_line(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	case .J, .DOWN:
		move_down_line(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}
}

handle_insert :: proc(app: ^State) {
	if app.editor.mode != .Insert do return

	for unicode := rl.GetCharPressed(); unicode > 0; unicode = rl.GetCharPressed() {
		if unicode >= 32 && unicode <= 125 {
			log.debugf("unicode: %c", cast(byte)unicode)
			add_char_to_current_line(app.editor.current_page, cast(byte)unicode)
			app.editor.is_blinking = false
			app.editor.frame_count = 0
		}
	}

	if rl.IsKeyPressed(.BACKSPACE) {
		delete_char_at_cursor(app.editor.current_page)
		app.editor.is_blinking = false
		app.editor.frame_count = 0
	}
}

update :: proc(app: ^State) {
	handle_insert(app)
	handle_navigation(app)

	if rl.IsKeyPressed(.ENTER) {
		process_command(app)
		delete_all_lines(app.editor.current_page)
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
}
