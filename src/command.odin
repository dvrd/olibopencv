package imgproc

import "core:fmt"
import "core:path/filepath"
import "core:strings"
import "libs:cv"
import rl "vendor:raylib"

process_command :: proc(using app: ^State) {
	using app.editor

	tks := parse_list(editor.current_page)

	switch tks[0] {
	case "load":
		mat := cv.imread(filepath.join({"assets", tks[1]}))
		defer cv.delete_mat(mat)
		image = img_to_texture(mat)
		rl.SetWindowSize(image.width, app.image.height + app.editor.height)
	case:
		fmt.println("Unknown commands")
	}

	fmt.println(tks)
}

parse_list :: proc(using p: ^Page) -> []string {
	parts := make([dynamic]string)
	sb := strings.builder_make()
	for line in lines {
		if line.head == line.tail do continue

		node := line.head.next
		for node != line.tail {
			if node.char == ' ' {
				append(&parts, strings.clone(strings.to_string(sb)))
				strings.builder_reset(&sb)
			} else if node.char != ';' {
				strings.write_byte(&sb, node.char)
			}
			node = node.next
		}
		append(&parts, strings.clone(strings.to_string(sb)))
		strings.builder_reset(&sb)
	}
	return parts[:]
}
