package imgproc

import "core:c"
import "core:fmt"
import "core:math/linalg"
import "libs:cv"
import rl "vendor:raylib"

SCREEN :: cv.CSize{1280, 180}

EditMode :: enum {
	Normal,
	Insert,
}

State :: struct {
	image:  struct {
		texture: rl.Texture2D,
		data:    cv.Mat,
	},
	editor: struct {
		current_page:       ^Page,
		width:              c.int,
		height:             c.int,
		blink_after_frames: int,
		blink_time:         int,
		is_blinking:        bool,
		frame_count:        int,
		mode:               EditMode,
	},
}

application_state: ^State

@(export)
app_update :: proc() -> bool {
	update(application_state)
	render(application_state)
	return !rl.WindowShouldClose()
}

@(export)
app_init_window :: proc() {
	rl.InitWindow(SCREEN.width, SCREEN.height, "Computer Vision")
	rl.SetExitKey(.KEY_NULL)
	rl.SetTargetFPS(60)
}

@(export)
app_init :: proc() {
	application_state = new(State)

	application_state^ = State {
		editor = {
			current_page = new_page(),
			width = 1280,
			height = 180,
			blink_after_frames = 30,
			blink_time = 30,
			is_blinking = false,
			frame_count = 0,
			mode = .Normal,
		},
	}

	app_hot_reloaded(application_state)
}

@(export)
app_shutdown :: proc() {
	delete_page(application_state.editor.current_page)
	free(application_state)
}

@(export)
app_shutdown_window :: proc() {
	rl.CloseWindow()
}

@(export)
app_state :: proc() -> rawptr {
	return application_state
}

@(export)
app_state_size :: proc() -> int {
	return size_of(State)
}

@(export)
app_hot_reloaded :: proc(app: rawptr) {
	application_state = (^State)(app)
}

@(export)
app_force_reload :: proc() -> bool {
	return rl.IsKeyPressed(.F5)
}

@(export)
app_force_restart :: proc() -> bool {
	return rl.IsKeyPressed(.F6)
}
