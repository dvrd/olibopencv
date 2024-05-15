package imageprocessing

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"

main :: proc() {
	fmt.println(">>> OpenCV Odin Started...")

	img := cv.image_read("assets/log.png", 0)

	fmt.println(">>> OpenCV Odin Ended...")
}
