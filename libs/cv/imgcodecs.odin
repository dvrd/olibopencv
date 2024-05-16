package cv

import "core:c"
import "core:strings"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

@(default_calling_convention = "c")
foreign cv {
	Image_IMRead :: proc(filename: cstring, flags: IMReadFlag) -> Mat ---
	Image_IMWrite :: proc(filename: cstring, img: Mat) -> c.bool ---
	Image_IMWrite_WithParams :: proc(filename: cstring, img: Mat, params: IntVector) -> c.bool ---
	Image_IMEncode :: proc(fileExt: cstring, img: Mat, vector: rawptr) ---

	Image_IMEncode_WithParams :: proc(fileExt: cstring, img: Mat, params: IntVector, vector: rawptr) ---
	Image_IMDecode :: proc(buf: ByteArray, flags: c.int) -> Mat ---
	Image_IMDecodeIntoMat :: proc(buf: ByteArray, flags: c.int, dest: Mat) ---
}

// IMReadFlag is one of the valid flags to use for the IMRead function.
IMReadFlag :: enum {
	// IMReadUnchanged return the loaded image as is (with alpha channel,
	// otherwise it gets cropped).
	Unchanged         = -1,

	// IMReadGrayScale always convert image to the single channel
	// grayscale image.
	GrayScale         = 0,

	// IMReadColor always converts image to the 3 channel BGR color image.
	Color             = 1,

	// IMReadAnyDepth returns 16-bit/32-bit image when the input has the corresponding
	// depth, otherwise convert it to 8-bit.
	AnyDepth          = 2,

	// IMReadAnyColor the image is read in any possible color format.
	AnyColor          = 4,

	// IMReadLoadGDAL uses the gdal driver for loading the image.
	LoadGDAL          = 8,

	// IMReadReducedGrayscale2 always converts image to the single channel grayscale image
	// and the image size reduced 1/2.
	ReducedGrayscale2 = 16,

	// IMReadReducedColor2 always converts image to the 3 channel BGR color image and the
	// image size reduced 1/2.
	ReducedColor2     = 17,

	// IMReadReducedGrayscale4 always converts image to the single channel grayscale image and
	// the image size reduced 1/4.
	ReducedGrayscale4 = 32,

	// IMReadReducedColor4 always converts image to the 3 channel BGR color image and
	// the image size reduced 1/4.
	ReducedColor4     = 33,

	// IMReadReducedGrayscale8 always convert image to the single channel grayscale image and
	// the image size reduced 1/8.
	ReducedGrayscale8 = 64,

	// IMReadReducedColor8 always convert image to the 3 channel BGR color image and the
	// image size reduced 1/8.
	ReducedColor8     = 65,

	// IMReadIgnoreOrientation do not rotate the image according to EXIF's orientation flag.
	IgnoreOrientation = 128,
}

IMWriteFlag :: enum {
	//IMWriteJpegQuality is the quality from 0 to 100 for JPEG (the higher is the better). Default value is 95.
	JpegQuality            = 1,

	// JpegProgressive enables JPEG progressive feature, 0 or 1, default is False.
	JpegProgressive        = 2,

	// JpegOptimize enables JPEG optimization, 0 or 1, default is False.
	JpegOptimize           = 3,

	// JpegRstInterval is the JPEG restart interval, 0 - 65535, default is 0 - no restart.
	JpegRstInterval        = 4,

	// JpegLumaQuality separates luma quality level, 0 - 100, default is 0 - don't use.
	JpegLumaQuality        = 5,

	// JpegChromaQuality separates chroma quality level, 0 - 100, default is 0 - don't use.
	JpegChromaQuality      = 6,

	// PngCompression is the compression level from 0 to 9 for PNG. A
	// higher value means a smaller size and longer compression time.
	// If specified, strategy is changed to IMWRITE_PNG_STRATEGY_DEFAULT (Z_DEFAULT_STRATEGY).
	// Default value is 1 (best speed setting).
	PngCompression         = 16,

	// PngStrategy is one of cv::IMWritePNGFlags, default is IMWRITE_PNG_STRATEGY_RLE.
	PngStrategy            = 17,

	// PngBilevel is the binary level PNG, 0 or 1, default is 0.
	PngBilevel             = 18,

	// PxmBinary for PPM, PGM, or PBM can be a binary format flag, 0 or 1. Default value is 1.
	PxmBinary              = 32,

	// WebpQuality is the quality from 1 to 100 for WEBP (the higher is
	// the better). By default (without any parameter) and for quality above
	// 100 the lossless compression is used.
	WebpQuality            = 64,

	// PamTupletype sets the TUPLETYPE field to the corresponding string
	// value that is defined for the format.
	PamTupletype           = 128,

	// PngStrategyDefault is the value to use for normal data.
	PngStrategyDefault     = 0,

	// PngStrategyFiltered is the value to use for data produced by a
	// filter (or predictor). Filtered data consists mostly of small values
	// with a somewhat random distribution. In this case, the compression
	// algorithm is tuned to compress them better.
	PngStrategyFiltered    = 1,

	// PngStrategyHuffmanOnly forces Huffman encoding only (no string match).
	PngStrategyHuffmanOnly = 2,

	// PngStrategyRle is the value to use to limit match distances to
	// one (run-length encoding).
	PngStrategyRle         = 3,

	// PngStrategyFixed is the value to prevent the use of dynamic
	// Huffman codes, allowing for a simpler decoder for special applications.
	PngStrategyFixed       = 4,
}

// IMRead reads an image from a file into a Mat.
// The flags param is one of the IMReadFlag flags.
// If the image cannot be read (because of missing file, improper permissions,
// unsupported or invalid format), the function returns an empty Mat.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga288b8b3da0892bd651fce07b3bbd3a56
imread :: proc(name: string, flags: IMReadFlag = .Color) -> Mat {
	c_name := strings.clone_to_cstring(name)
	defer delete(c_name)

	return Image_IMRead(c_name, flags)
}

// IMWrite writes a Mat to an image file.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#gabbc7ef1aa2edfaa87772f1202d67e0ce
imwrite :: proc(name: string, img: Mat) -> bool {
	c_name := strings.clone_to_cstring(name)
	defer delete(c_name)

	return cast(bool)Image_IMWrite(c_name, img)
}

// IMWriteWithParams writes a Mat to an image file. With that func you can
// pass compression parameters.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#gabbc7ef1aa2edfaa87772f1202d67e0ce
imwrite_with_params :: proc(name: string, img: Mat, params: []int) -> bool {
	c_name := strings.clone_to_cstring(name)
	defer delete(c_name)

	c_params := make([]c.int, len(params))
	defer delete(c_params)
	for v, i in params {
		c_params[i] = c.int(v)
	}

	params_vector := IntVector{
		cast([^]c.int)&c_params[0],
		cast(c.int)len(c_params),
	}

	return cast(bool)Image_IMWrite_WithParams(c_name, img, params_vector)
}

FileExt :: enum {
	PNG,
	JPEG,
	GIF,
}

ext_mapper :: proc(ext: FileExt) -> cstring {
	switch ext {
	case .PNG:	return ".png"
	case .JPEG:	return ".jpg"
	case .GIF:	return ".gif"
	case:				return "unreachable"
	}
}

// IMEncode encodes an image Mat into a memory buffer.
// This function compresses the image and stores it in the returned memory buffer,
// using the image format passed in in the form of a file extension string.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga461f9ac09887e47797a54567df3b8b63
imencode :: proc(file_ext: FileExt, img: Mat) -> (buf: []byte) {
	c_file_ext := ext_mapper(file_ext)
	defer delete(c_file_ext)

	tmp_buf: ByteArray
	Image_IMEncode(c_file_ext, img, &tmp_buf)
	buf = make([]byte, int(tmp_buf.length))
	buf = tmp_buf.data[:tmp_buf.length]

	return
}

// IMEncodeWithParams encodes an image Mat into a memory buffer.
// This function compresses the image and stores it in the returned memory buffer,
// using the image format passed in in the form of a file extension string.
//
// Usage example:
//
//	buffer, err := gocv.IMEncodeWithParams(gocv.JPEGFileExt, img, []int{gocv.IMWriteJpegQuality, quality})
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga461f9ac09887e47797a54567df3b8b63
imencode_with_params :: proc(file_ext: FileExt, img: Mat, params: []int) -> (buf: []byte) {
	c_file_ext := ext_mapper(file_ext)
	defer delete(c_file_ext)

	c_params := make([]c.int, len(params))
	defer delete(c_params)
	for v, i in params {
		c_params[i] = c.int(v)
	}

	params_vector := IntVector{
		cast([^]c.int)&c_params[0],
		cast(c.int)len(c_params),
	}

	tmp_buf: ByteArray
	Image_IMEncode_WithParams(c_file_ext, img, params_vector, &tmp_buf)
	buf = make([]byte, int(tmp_buf.length))
	buf = tmp_buf.data[:tmp_buf.length]

	return
}

// IMDecode reads an image from a buffer in memory.
// The function IMDecode reads an image from the specified buffer in memory.
// If the buffer is too short or contains invalid data, the function
// returns an empty matrix.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga26a67788faa58ade337f8d28ba0eb19e
imdecode :: proc(buf: []byte, flags: IMReadFlag) -> Mat {
	data := to_byte_array(cast([^]byte)&buf[0], cast(c.int)len(buf))
	return Image_IMDecode(data, c.int(flags))
}

// IMDecodeIntoMat reads an image from a buffer in memory into a matrix.
// The function IMDecodeIntoMat reads an image from the specified buffer in memory.
// If the buffer is too short or contains invalid data, the function
// returns an error
//
// For further details, please see:
// https://docs.opencv.org/4.x/d4/da8/group__imgcodecs.html#ga5a0acefe5cbe0a81e904e452ec7ca733
imdecode_into_mat :: proc(buf: []byte, flags: IMReadFlag, dest: Mat) {
	data := to_byte_array(cast([^]byte)&buf[0], cast(c.int)len(buf))
	Image_IMDecodeIntoMat(data, c.int(flags), dest)
}

