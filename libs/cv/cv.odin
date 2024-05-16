package cv

import "core:c"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

@(default_calling_convention = "c")
foreign cv {
	free_mem :: proc(data: rawptr) ---
}
