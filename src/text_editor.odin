package imgproc

import "core:c"
import "core:fmt"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

ListNode :: struct {
	char: byte,
	next: ^ListNode,
	prev: ^ListNode,
}

TextLine :: struct {
	head:   ^ListNode,
	tail:   ^ListNode,
	cursor: ^ListNode,
	size:   int,
}

new_text_line :: proc() -> (tl: ^TextLine) {
	tl = new(TextLine)
	tl.head = new(ListNode)
	tl.tail = new(ListNode)
	tl.head.next = tl.tail
	tl.tail.prev = tl.head
	tl.cursor = tl.tail
	return
}

delete_text_line :: proc(using tl: ^TextLine) {
	if (head.next != tail) {
		node := head.next
		to_remove: ^ListNode
		for node != tail {
			to_remove = node
			node = node.next
			free(to_remove)
		}
	}

	free(head)
	free(tail)
	free(tl)
}

tl_insert_char_at_cursor :: proc(using tl: ^TextLine, char: byte) {
	prev := cursor.prev
	node := new(ListNode)
	node.char = char
	node.prev = prev
	prev.next = node
	node.next = cursor
	cursor.prev = node
	size += 1
}

tl_delete_char_after_cursor :: proc(using tl: ^TextLine) {
	if cursor != tail && cursor.next != tail {
		next_next := cursor.next.next
		next := cursor.next
		cursor.next = next_next
		next_next.prev = cursor
		free(next)
		size -= 1
	} else if size == 1 {
		node := head.next
		head.next = tail
		tail.prev = head
		cursor = tail
		size = 0
		free(node)
	}
}

tl_delete_char_at_cursor :: proc(using tl: ^TextLine) {
	if cursor.prev != head {
		prev := cursor.prev
		prev_prev := cursor.prev.prev
		cursor.prev = prev_prev
		prev_prev.next = cursor
		free(prev)
		size -= 1
	} else if size == 1 {
		node := head.next
		head.next = tail
		tail.prev = head
		cursor = tail
		size = 0
		free(node)
	}
}

tl_move_cursor_left :: proc(using tl: ^TextLine) {
	if cursor.prev != head {
		cursor = cursor.prev
	}
}

tl_move_cursor_right :: proc(using tl: ^TextLine) {
	if cursor != tail {
		cursor = cursor.next
	}
}

to_string :: proc(using tl: ^TextLine) -> string {
	if head.next != tail {
		sb := strings.builder_make()
		node := head.next
		for node != tail {
			strings.write_byte(&sb, node.char)
			node = node.next
		}
		return strings.to_string(sb)
	}

	return ""
}

cursor_index :: proc(using tl: ^TextLine) -> int {
	index := 0
	node := head
	for node.next != cursor {
		node = node.next
		index += 1
	}
	return index
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

add_char_to_current_line :: proc(using p: ^Page, char: byte) {
	if ln_idx > -1 {
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
	for len(lines) != 0 {
		delete_text_line(pop(&lines))
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

delete_char_after_cursor :: proc(using p: ^Page) {
	if ln_idx > -1 {
		if lines[ln_idx].size == 0 {
			delete_current_line(p)
			return
		}
		tl_delete_char_after_cursor(lines[ln_idx])
	}
}

delete_char_at_cursor :: proc(using p: ^Page) {
	if ln_idx > -1 {
		if lines[ln_idx].size == 0 {
			delete_current_line(p)
			return
		}
		tl_delete_char_at_cursor(lines[ln_idx])
	}
}

get_cursor_xy :: proc(using p: ^Page) -> (x, y: int) {
	if ln_idx > -1 {
		text := to_string(lines[ln_idx])
		c_text := strings.clone_to_cstring(text[:cursor_index(lines[ln_idx])])
		return cast(int)rl.MeasureText(c_text, 20), ln_idx * 20
	}
	return
}
