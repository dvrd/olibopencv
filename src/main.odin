package imageprocessing

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"

main :: proc() {
	fmt.println(">>> OpenCV Odin Started...")

	window := cv.named_window("test")
	img := cv.image_read("assets/logo.png", .IMREAD_COLOR)
	cv.imshow(window, img)
	if cv.wait_key() == -1 {
		fmt.eprintln("Invalid for imshow")
		os.exit(1)
	}

	fmt.println(">>> OpenCV Odin Ended...")
}
