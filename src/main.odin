package imageprocessing

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"

main :: proc() {
	fmt.println(">>> OpenCV Odin Started...")

	window := cv.named_window("test")
	img := cv.imread("assets/logo.png")
	cv.imshow(window, img)
	if cv.wait_key() == -1 {
		fmt.eprintln("Invalid for imshow")
		os.exit(1)
	}

	fmt.println(">>> OpenCV Odin Ended...")
}
