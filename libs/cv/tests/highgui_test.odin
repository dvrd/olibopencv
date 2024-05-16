package cv_tests

import cv ".."
import "core:testing"

// @(test)
test_window :: proc(t: ^testing.T) {
	using testing

	window := cv.named_window("test")

	expect(t, window != nil, "Unable to create Window")
	expect(t, window.name == "test", "Invalid Window name")
	val := cv.wait_key(1)
	expect(t, val == -1, "Invalid WaitKey")
	expect(t, window.open, "Window should have been open")

	cv.set_window_property(window, .WindowPropertyFullscreen, cv.WindowFullscreen)

	prop := cv.get_window_property(window, .WindowPropertyFullscreen)
	expect(t, prop == cv.WindowFullscreen, "Window property should have been fullscreen")

	cv.set_window_title(window, "My new title")
	cv.move_window(window, 100, 100)
	cv.resize_window(window, 100, 100)

	cv.close_window(window)
	expect(t, !window.open, "Window should have been closed")
}

// @(test)
test_imshow :: proc(t: ^testing.T) {
	using testing

	window := cv.named_window("test")
	expect(t, window != nil, "Unable to create Window")

	img := cv.image_read("assets/logo.png", .IMREAD_COLOR)
	expect(t, !cv.mat_empty(img), "Invalid Mat in imshow")
	defer cv.delete_mat(img)

	// TODO: some way to determine if the call succeeded
	cv.imshow(window, img)

	val := cv.wait_key(1)
	expect(t, val == -1, "Invalid for imshow")
	cv.close_window(window)
	expect(t, !window.open, "IMShow window should have been closed")
}

// @(test)
test_trackbar :: proc(t: ^testing.T) {
	using testing

	window := cv.named_window("trackbar")
	defer cv.close_window(window)

	tracker := cv.create_trackbar(window, "trackme", 100)
	expect(t, cv.get_trackbar_pos(tracker) == 0, "Trackbar pos should have been 0")

	cv.set_trackbar_min(tracker, 10)
	cv.set_trackbar_max(tracker, 150)
	cv.set_trackbar_pos(tracker, 50)

	expect(t, cv.get_trackbar_pos(tracker) == 50, "Trackbar pos should have been 50")
}
