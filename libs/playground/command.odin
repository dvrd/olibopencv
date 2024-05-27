package imgproc

import "core:fmt"
import "core:path/filepath"
import "core:strconv"
import "core:strings"
import "libs:cv"
import rl "vendor:raylib"

process_command :: proc(using app: ^State) {
	using app.editor

	tks := parse_list(editor.current_page)
	defer delete(tks)
	fmt.println(tks)
	tk, ok := pop_front_safe(&tks)
	defer delete(tk)
	loop: for ok {
		defer delete(tk)
		switch tk {
		case "exit":
			rl.CloseWindow()
			break
		case "load":
			file_name, ok := pop_front_safe(&tks)
			if !ok do break loop
			file_path := filepath.join({"assets", file_name})
			defer delete(file_path)
			image.data = cv.imread(file_path)
			if cv.is_empty(image.data) do break loop
			image.texture = img_to_texture(image.data)
			rl.SetWindowSize(image.texture.width, app.image.texture.height + app.editor.height)
		case "grayscale":
			image.data = cv.cvt_color(image.data, .RGBAToGray)
			image.texture = img_to_texture(image.data)
		case "clip":
			range, ok := pop_front_safe(&tks)
			if !ok do break loop
		case "pixel":
			xs, xok := pop_front_safe(&tks)
			if !xok do break loop
			ys, yok := pop_front_safe(&tks)
			if !yok do break loop
			pixel := cv.at(image.data, strconv.atoi(xs), strconv.atoi(ys))
			fmt.println(pixel)
		case:
			fmt.println("Unknown commands")
		}
		tk, ok = pop_front_safe(&tks)
	}
}

parse_list :: proc(using p: ^Page) -> [dynamic]string {
	parts := make([dynamic]string)
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	for line in lines {
		if line.cursor == 0 do continue

		for char in line.data {
			if char == ' ' {
				append(&parts, strings.to_string(sb))
				strings.builder_reset(&sb)
			} else {
				strings.write_byte(&sb, char)
			}
		}
		append(&parts, strings.to_string(sb))
		strings.builder_reset(&sb)
	}

	return parts
}
