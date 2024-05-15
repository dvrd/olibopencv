package cv

import "core:c"
import "core:strings"

// Window is a wrapper around OpenCV's "HighGUI" named windows.
// While OpenCV was designed for use in full-scale applications and can be used
// within functionally rich UI frameworks (such as Qt*, WinForms*, or Cocoa*)
// or without any UI at all, sometimes there it is required to try functionality
// quickly and visualize the results. This is what the HighGUI module has been designed for.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/dfc/group__highgui.html
Window :: struct {
	name: string,
	open: bool,
}

// WindowFlag value for SetWindowProperty / GetWindowProperty.
WindowFlag :: distinct f64

// WindowNormal indicates a normal window.
WindowNormal: WindowFlag : 0x00000000

// WindowAutosize indicates a window sized based on the contents.
WindowAutosize: WindowFlag : 0x00000001

// WindowFullscreen indicates a full-screen window.
WindowFullscreen: WindowFlag : 1

// WindowFreeRatio indicates allow the user to resize without maintaining aspect ratio.
WindowFreeRatio: WindowFlag : 0x00000100

// WindowKeepRatio indicates always maintain an aspect ratio that matches the contents.
WindowKeepRatio: WindowFlag : 0x00000000

// WindowPropertyFlag flags for SetWindowProperty / GetWindowProperty.
WindowPropertyFlag :: enum {
	// WindowPropertyFullscreen fullscreen property
	// (can be WINDOW_NORMAL or WINDOW_FULLSCREEN).
	WindowPropertyFullscreen,

	// WindowPropertyAutosize is autosize property
	// (can be WINDOW_NORMAL or WINDOW_AUTOSIZE).
	WindowPropertyAutosize,

	// WindowPropertyAspectRatio window's aspect ration
	// (can be set to WINDOW_FREERATIO or WINDOW_KEEPRATIO).
	WindowPropertyAspectRatio,

	// WindowPropertyOpenGL opengl support.
	WindowPropertyOpenGL,

	// WindowPropertyVisible or not.
	WindowPropertyVisible,
}

when ODIN_OS == .Darwin {
	foreign import cv "libcv.a"
}

@(default_calling_convention = "c")
foreign cv {
	Window_New :: proc(winname: cstring, flags: c.int) ---
	Window_Close :: proc(winname: cstring) ---
	Window_IMShow :: proc(winname: cstring, mat: Mat) ---
	Window_GetProperty :: proc(winname: cstring, flag: c.int) -> c.double ---
	Window_SetProperty :: proc(winname: cstring, flag: c.int, value: c.double) ---
	Window_SetTitle :: proc(winname, title: cstring) ---
	Window_WaitKey :: proc(delay: c.int = 0) -> c.int ---
	Window_Move :: proc(winname: cstring, x, y: c.int) ---
	Window_Resize :: proc(winname: cstring, width, height: c.int) ---
	Window_SelectROI :: proc(winname: cstring, img: Mat) -> Rect ---
	Window_SelectROIs :: proc(winname: cstring, img: Mat) -> Rects ---
}

// named_window creates a new named OpenCV window
//
// For further details, please see:
// http://docs.opencv.org/master/d7/dfc/group__highgui.html#ga5afdf8410934fd099df85c75b2e0888b
named_window :: proc(name: string) -> (w: ^Window) {
	c_name := strings.clone_to_cstring(name)
	defer delete(c_name)

	Window_New(c_name, 0)

	w = new(Window)
	w.name = name
	w.open = true

	return
}

// destroy_window closes and deletes a named OpenCV Window.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/dfc/group__highgui.html#ga851ccdd6961022d1d5b4c4f255dbab34
destroy_window :: proc(w: ^Window) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	Window_Close(c_name)
	w.open = false

	return
}

// get_window_property returns properties of a window.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#gaaf9504b8f9cf19024d9d44a14e461656
get_window_property :: proc(w: ^Window, flag: WindowPropertyFlag) -> WindowFlag {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	return cast(WindowFlag)Window_GetProperty(c_name, c.int(flag))
}

// set_window_property changes parameters of a window dynamically.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga66e4a6db4d4e06148bcdfe0d70a5df27
set_window_property :: proc(w: ^Window, flag: WindowPropertyFlag, value: WindowFlag) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	Window_SetProperty(c_name, c.int(flag), c.double(value))
}

// set_window_title updates window title.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga56f8849295fd10d0c319724ddb773d96
set_window_title :: proc(w: ^Window, title: string) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	c_title := strings.clone_to_cstring(title)
	defer delete(c_title)

	Window_SetTitle(c_name, c_title)
}

// imshow displays an image Mat in the specified window.
// This function should be followed by the WaitKey function which displays
// the image for specified milliseconds. Otherwise, it won't display the image.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/dfc/group__highgui.html#ga453d42fe4cb60e5723281a89973ee563
imshow :: proc(w: ^Window, img: Mat) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	Window_IMShow(c_name, img)
}

// wait_key waits for a pressed key.
// This function is the only method in OpenCV's HighGUI that can fetch
// and handle events, so it needs to be called periodically
// for normal event processing
//
// For further details, please see:
// http://docs.opencv.org/master/d7/dfc/group__highgui.html#ga5628525ad33f52eab17feebcfba38bd7
wait_key :: proc(delay := 0) -> int {
	return cast(int)Window_WaitKey(c.int(delay))
}

// move_window moves window to the specified position.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga8d86b207f7211250dbe6e28f76307ffb
move_window :: proc(w: ^Window, x, y: int) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	Window_Move(c_name, c.int(x), c.int(y))
}

// ResizeWindow resizes window to the specified size.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga9e80e080f7ef33f897e415358aee7f7e
resize_window :: proc(w: ^Window, width, height: int) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	Window_Resize(c_name, c.int(width), c.int(height))
}

// select_ROI selects a Region Of Interest (ROI) on the given image.
// It creates a window and allows user to select a ROI using mouse.
//
// Controls:
// use space or enter to finish selection,
// use key c to cancel selection (function will return a zero Rect).
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga8daf4730d3adf7035b6de9be4c469af5
select_ROI :: proc(w: ^Window, img: Mat) -> Rect {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	return Window_SelectROI(c_name, img)
}

// select_ROIs selects multiple Regions Of Interest (ROI) on the given image.
// It creates a window and allows user to select ROIs using mouse.
//
// Controls:
// use space or enter to finish current selection and start a new one
// use esc to terminate multiple ROI selection process
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga0f11fad74a6432b8055fb21621a0f893
select_ROIs :: proc(w: ^Window, img: Mat) -> Rects {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	return Window_SelectROIs(c_name, img)
}

@(default_calling_convention = "c")
foreign cv {
	Trackbar_Create :: proc(winname, trackname: cstring, max: c.int) ---
	Trackbar_CreateWithValue :: proc(winname, trackname: cstring, value: ^c.int, max: c.int) ---
	Trackbar_GetPos :: proc(winname, trackname: cstring) -> c.int ---
	Trackbar_SetPos :: proc(winname, trackname: cstring, pos: c.int) ---
	Trackbar_SetMin :: proc(winname, trackname: cstring, pos: c.int) ---
	Trackbar_SetMax :: proc(winname, trackname: cstring, pos: c.int) ---
}

// Trackbar is a wrapper around OpenCV's "HighGUI" window Trackbars.
Trackbar :: struct {
	name:   string,
	parent: ^Window,
}

// create_trackbar creates a trackbar and attaches it to the specified window.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#gaf78d2155d30b728fc413803745b67a9b
create_trackbar :: proc(w: ^Window, name: string, max: int) -> (t: ^Trackbar) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(name)
	defer delete(t_name)

	Trackbar_Create(c_name, t_name, c.int(max))
	t = new(Trackbar)
	t.name = name
	t.parent = w

	return
}

// create_trackbar_with_value works like CreateTrackbar but also assigns a
// variable value to be a position synchronized with the trackbar.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#gaf78d2155d30b728fc413803745b67a9b
create_trackbar_with_value :: proc(
	w: ^Window,
	name: string,
	value: ^int,
	max: int,
) -> (
	t: ^Trackbar,
) {
	c_name := strings.clone_to_cstring(w.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(name)
	defer delete(t_name)

	Trackbar_CreateWithValue(c_name, t_name, cast(^c.int)value, c.int(max))
	t = new(Trackbar)
	t.name = name
	t.parent = w

	return
}

// get_trackbar_pos returns the trackbar position.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga122632e9e91b9ec06943472c55d9cda8
get_trackbar_pos :: proc(t: ^Trackbar) -> int {
	c_name := strings.clone_to_cstring(t.parent.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(t.name)
	defer delete(t_name)

	return cast(int)Trackbar_GetPos(c_name, t_name)
}

// set_trackbar_pos sets the trackbar position.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga67d73c4c9430f13481fd58410d01bd8d
set_trackbar_pos :: proc(t: ^Trackbar, pos: int) {
	c_name := strings.clone_to_cstring(t.parent.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(t.name)
	defer delete(t_name)

	Trackbar_SetPos(c_name, t_name, c.int(pos))
}

// set_trackbar_min sets the trackbar minimum position.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#gabe26ffe8d2b60cc678895595a581b7aa
set_trackbar_min :: proc(t: ^Trackbar, pos: int) {
	c_name := strings.clone_to_cstring(t.parent.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(t.name)
	defer delete(t_name)

	Trackbar_SetMin(c_name, t_name, c.int(pos))
}

// set_trackbar_max sets the trackbar maximum position.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/dfc/group__highgui.html#ga7e5437ccba37f1154b65210902fc4480
set_trackbar_max :: proc(t: ^Trackbar, pos: int) {
	c_name := strings.clone_to_cstring(t.parent.name)
	defer delete(c_name)

	t_name := strings.clone_to_cstring(t.name)
	defer delete(t_name)

	Trackbar_SetMax(c_name, t_name, c.int(pos))
}
