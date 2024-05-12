package imageprocessing

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"

demo_read_image :: proc() {
	using cv

	image_path :: "opencv-odin/c_wrapper/4838856.png"
	image := image_read(image_path, cast(c.int)(ImageReadModes.IMREAD_COLOR))
	defer free_mem(image)

	if mat_isempty(image) {
		fmt.eprintfln("Error: can't find or open an image: %s", image_path)
		os.exit(1)
	}

	window_name :: "The Image"
	named_window(window_name)
	defer destroy_window(window_name)

	image_show(window_name, image)
	wait_key(0)
}

demo_read_camera :: proc() {
	// https://docs.opencv.org/4.x/d8/dfe/class1_1VideoCapture.html
	using cv

	frame := new_mat()
	defer free_mem(frame)

	capture := new_videocapture()
	defer {
		videocapture_release(capture)
		free_mem(capture)
	}

	device_id: c.int = 0
	api_id: c.int = cast(c.int)VideoCaptureAPIs.CAP_ANY

	videocapture_open(capture, device_id, api_id)

	window_name :: "Camera Video"
	named_window(window_name)
	defer destroy_window(window_name)

	if !videocapture_isopened(capture) {
		fmt.eprintfln(
			"Error: can't open camera stream for device_id=%d and api_id=%d",
			device_id,
			api_id,
		)
		os.exit(1)
	}

	fmt.println(">>> Reading frames...")
	for {
		videocapture_read(capture, frame)
		if mat_isempty(frame) {
			fmt.eprintln("Error: empty frame... exiting")
			break
		}
		image_show(window_name, frame)
		c := wait_key(25)
		if c == 27 { 	// ESC key pressed
			break
		}
	}

}

main :: proc() {
	fmt.println(">>> OpenCV Odin Started...")
	// demo_read_image()
	demo_read_camera()

	fmt.println(">>> OpenCV Odin Ended...")
}
