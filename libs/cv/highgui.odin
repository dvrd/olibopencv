package cv

import "core:c"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.a"
}

@(default_calling_convention = "c")
foreign cv {
	@(link_name = "Window_New")
	named_window :: proc(winname: cstring, flags: c.int) ---
	@(link_name = "Window_Close")
	destroy_window :: proc(winname: cstring) ---
	@(link_name = "Window_IMShow")
	imshow :: proc(winname: cstring, mat: Mat) ---
	@(link_name = "Window_GetProperty")
	get_window_property :: proc(winname: cstring, flag: c.int) -> c.double ---
	@(link_name = "Window_SetProperty")
	set_window_property :: proc(winname: cstring, flag: c.int, value: c.double) ---
	@(link_name = "Window_SetTitle")
	set_window_title :: proc(winname, title: cstring) ---
	@(link_name = "Window_WaitKey")
	waitkey :: proc(delay: c.int = 0) -> c.int ---
	@(link_name = "Window_Move")
	move_window :: proc(winname: cstring, x, y: c.int) ---
	@(link_name = "Window_Resize")
	resize_window :: proc(winname: cstring, width, height: c.int) ---
	@(link_name = "Window_SelectROI")
	select_ROI :: proc(winname: cstring, img: Mat) -> Rect ---
	@(link_name = "Window_SelectROIs")
	select_ROIs :: proc(winname: cstring, img: Mat) -> Rects ---
	@(link_name = "Trackbar_Create")
	create_trackbar :: proc(winname, trackname: cstring, max: c.int) ---
	@(link_name = "Trackbar_CreateWithValue")
	create_trackbar_with_value :: proc(winname, trackname: cstring, value: ^c.int, max: c.int) ---
	@(link_name = "Trackbar_GetPos")
	get_trackbar_pos :: proc(winname, trackname: cstring) -> c.int ---
	@(link_name = "Trackbar_SetPos")
	set_trackbar_pos :: proc(winname, trackname: cstring, pos: c.int) ---
	@(link_name = "Trackbar_SetMin")
	set_trackbar_min :: proc(winname, trackname: cstring, pos: c.int) ---
	@(link_name = "Trackbar_SetMax")
	set_trackbar_max :: proc(winname, trackname: cstring, pos: c.int) ---
}
