package imgproc

import "core:c"
import "core:log"
import "core:path/filepath"
import "core:slice"
import "core:strconv"
import "core:strings"
import "libs:cv"
import rl "vendor:raylib"

process_command :: proc(using app: ^State) {
	using app.editor

	tks := parse_list(editor.current_page)
	defer {
		for tk in tks do delete(tk)
		delete(tks)
	}


	tk := slice.first(tks)
	switch tk {
	case "exit":
		app.exit = true
	case "load":
		file_name, ok := slice.get(tks, 1)
		if !ok do return
		file_path := filepath.join({"assets", file_name})
		image.data = cv.imread(file_path)
		if cv.is_empty(image.data) do return
		image.texture = img_to_texture(image.data)
		rl.SetWindowSize(image.texture.width, app.image.texture.height + app.editor.height)
		image.src_path = file_path
	case "grayscale":
		image.data = cv.cvt_color(image.data, .RGBAToGray)
		image.texture = img_to_texture(image.data)
	case "clip":
		range, ok := slice.get(tks, 1)
		if !ok do return
	case "pixel":
		xs, ys: string
		ok: bool

		xs, ok = slice.get(tks, 1)
		ys, ok = slice.get(tks, 2)
		if !ok do return

		pixel := cv.at(image.data, strconv.atoi(xs), strconv.atoi(ys))
		log.debugf("at x: %s, y: %s -> %v", xs, ys, pixel)
		tmp := cv.ones(
			cast(int)image.texture.height,
			cast(int)image.texture.width,
			cv.mat_type(image.data),
		)
		cv.mat_mul_uchar(tmp, pixel.(c.uchar))
		image.texture = img_to_texture(tmp)
	case "reload":
		if cv.is_empty(image.data) do image.data = cv.imread(image.src_path)
		if cv.is_empty(image.data) do return
		image.texture = img_to_texture(image.data)
		rl.SetWindowSize(image.texture.width, app.image.texture.height + app.editor.height)
	case:
		log.info("Unknown command", tk)
	}
}

parse_list :: proc(using p: ^Page) -> []string {
	parts := make([dynamic]string)
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	for line in lines {
		if line.cursor == 0 do continue

		char: byte
		for idx in 0 ..< line.cursor {
			char = line.data[idx]
			if char == ' ' {
				append(&parts, strings.clone(strings.to_string(sb)))
				strings.builder_reset(&sb)
			} else {
				strings.write_byte(&sb, char)
			}
		}
		append(&parts, strings.clone(strings.to_string(sb)))
		strings.builder_reset(&sb)
	}

	return parts[:]
}
