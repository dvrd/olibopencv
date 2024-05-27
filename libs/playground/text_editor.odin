package imgproc

import "core:c"
import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

TextLine :: struct {
	cursor: int,
	data:   [32]byte,
}

new_text_line :: proc() -> (tl: ^TextLine) {
	tl = new(TextLine)
	tl.cursor = 0
	return
}

delete_text_line :: proc(using tl: ^TextLine) {
	free(tl)
}

tl_insert_char_at_cursor :: proc(using tl: ^TextLine, char: byte) {
	data[cursor] = char
	cursor += 1
}

tl_delete_char_before_cursor :: proc(using tl: ^TextLine) {
	prev := cursor - 1
	if prev >= 0 {
		data[prev] = 0
		cursor -= 1
	}
}

tl_move_cursor_left :: proc(using tl: ^TextLine) {
	prev := cursor - 1
	if prev >= 0 {
		cursor = prev
	}
}

tl_move_cursor_right :: proc(using tl: ^TextLine) {
	next := cursor + 1
	if next <= len(tl.data) && data[next - 1] != 0 {
		cursor = next
	}
}

to_string :: proc(using tl: ^TextLine) -> string {
	if cursor == 0 && data[cursor] == 0 do return ""

	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	for char in tl.data {
		strings.write_byte(&sb, char)
	}
	return strings.clone(strings.to_string(sb))
}

Page :: struct {
	ln_idx: int,
	lines:  [dynamic]^TextLine,
}

new_page :: proc() -> (p: ^Page) {
	p = new(Page)
	p.ln_idx = 0
	p.lines = make([dynamic]^TextLine)
	append(&p.lines, new_text_line())

	return
}

delete_page :: proc(p: ^Page) {
	for line in p.lines {
		free(line)
	}
	delete(p.lines)
	free(p)
}

add_char_to_current_line :: proc(using p: ^Page, char: byte) {
	if ln_idx < 0 do return

	if lines[ln_idx].cursor < 32 {
		tl_insert_char_at_cursor(lines[ln_idx], char)
	} else {
		handle_new_line(p)
		tl_insert_char_at_cursor(lines[ln_idx], char)
	}
}

handle_new_line :: proc(using p: ^Page) {
	if ln_idx == len(lines) - 1 {
		append(&lines, new_text_line())
		ln_idx = len(lines) - 1
	} else {
		inject_at(&lines, ln_idx + 1, new_text_line())
		ln_idx += 1
	}
}

delete_current_line :: proc(using p: ^Page) {
	if len(lines) > 1 {
		delete_text_line(lines[ln_idx])
		ordered_remove(&lines, ln_idx)
		if ln_idx == len(lines) do ln_idx -= 1
	}
}

delete_all_lines :: proc(using p: ^Page) {
	line, ok := pop_safe(&lines)
	for ok {
		delete_text_line(line)
		line, ok = pop_safe(&lines)
	}
	append(&lines, new_text_line())
	ln_idx = 0
}

move_cursor_left :: proc(using p: ^Page) {
	if ln_idx > -1 {
		tl_move_cursor_left(lines[ln_idx])
	}
}

move_cursor_right :: proc(using p: ^Page) {
	if ln_idx > -1 {
		tl_move_cursor_right(lines[ln_idx])
	}
}

move_down_line :: proc(using p: ^Page) {
	if ln_idx < len(lines) - 1 {
		ln_idx += 1
	}
}

move_up_line :: proc(using p: ^Page) {
	if ln_idx > 0 {
		ln_idx -= 1
	}
}

delete_char_at_cursor :: proc(using p: ^Page) {
	if ln_idx > -1 {
		if lines[ln_idx].cursor == 0 {
			delete_current_line(p)
			return
		}
		tl_delete_char_before_cursor(lines[ln_idx])
	}
}

get_cursor_xy :: proc(using p: ^Page) -> (x, y: int) {
	if ln_idx > -1 {
		text := to_string(lines[ln_idx])
		defer delete(text)
		c_text := strings.clone_to_cstring(text[:lines[ln_idx].cursor])
		defer delete(c_text)
		return cast(int)rl.MeasureText(c_text, 20), ln_idx * 20
	}
	return
}
