package imgproc

import "core:c"
import "core:fmt"
import "core:os"
import "libs:cv"
import rl "vendor:raylib"

img_to_texture :: proc(m: cv.Mat) -> rl.Texture2D {
	img := rl.Image {
		width   = cast(c.int)cv.cols(m),
		height  = cast(c.int)cv.rows(m),
		mipmaps = 1,
	}

	fmt.println("CONVERTING IMAGE OF TYPE: ", cv.mat_type(m))
	#partial switch cv.mat_type(m) {
	case .CV_8UC1:
		img.data = cv.data_ptr(m)
		img.format = .UNCOMPRESSED_GRAYSCALE
	case .CV_8UC3:
		img.data = cv.data_ptr(cv.cvt_color(m, .BGRToRGB))
		img.format = .UNCOMPRESSED_R8G8B8
	case .CV_8UC4:
		img.data = cv.data_ptr(cv.cvt_color(m, .BGRAToRGBA))
		img.format = .UNCOMPRESSED_R8G8B8A8
	}

	return rl.LoadTextureFromImage(img)
}
