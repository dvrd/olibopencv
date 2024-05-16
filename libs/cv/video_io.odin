package cv

import "core:c"
import "core:fmt"
import "core:strconv"
import "core:strings"
import "core:sync"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

// VideoCapture is a wrapper around the OpenCV VideoCapture class.
//
// For further details, please see:
// http://docs.opencv.org/master/d8/dfe/classcv_1_1VideoCapture.html
VideoCapture :: distinct rawptr


// VideoWriter is a wrapper around the OpenCV VideoWriter`class.
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d9e/classcv_1_1VideoWriter.html
RawVideoWriter :: distinct rawptr
VideoWriter :: struct {
	p:  RawVideoWriter,
	mu: ^sync.RW_Mutex,
}

Cap_API :: enum {
	ANY           = 0, //!< Auto detect == 0
	VFW           = 200, //!< Video For Windows (obsolete, removed)
	V4L           = 200, //!< V4L/V4L2 capturing support
	V4L2          = V4L, //!< Same as CAP_V4L
	FIREWIRE      = 300, //!< IEEE 1394 drivers
	FIREWARE      = FIREWIRE, //!< Same value as CAP_FIREWIRE
	IEEE1394      = FIREWIRE, //!< Same value as CAP_FIREWIRE
	DC1394        = FIREWIRE, //!< Same value as CAP_FIREWIRE
	CMU1394       = FIREWIRE, //!< Same value as CAP_FIREWIRE
	QT            = 500, //!< QuickTime (obsolete, removed)
	UNICAP        = 600, //!< Unicap drivers (obsolete, removed)
	DSHOW         = 700, //!< DirectShow (via videoInput)
	PVAPI         = 800, //!< PvAPI, Prosilica GigE SDK
	OPENNI        = 900, //!< OpenNI (for Kinect)
	OPENNI_ASUS   = 910, //!< OpenNI (for Asus Xtion)
	ANDROID       = 1000, //!< MediaNDK (API Level 21+) and NDK Camera (API level 24+) for Android
	XIAPI         = 1100, //!< XIMEA Camera API
	AVFOUNDATION  = 1200, //!< AVFoundation framework for iOS (OS X Lion will have the same API)
	GIGANETIX     = 1300, //!< Smartek Giganetix GigEVisionSDK
	MSMF          = 1400, //!< Microsoft Media Foundation (via videoInput). See platform specific notes above.
	WINRT         = 1410, //!< Microsoft Windows Runtime using Media Foundation
	INTELPERC     = 1500, //!< RealSense (former Intel Perceptual Computing SDK)
	REALSENSE     = 1500, //!< Synonym for CAP_INTELPERC
	OPENNI2       = 1600, //!< OpenNI2 (for Kinect)
	OPENNI2_ASUS  = 1610, //!< OpenNI2 (for Asus Xtion and Occipital Structure sensors)
	OPENNI2_ASTRA = 1620, //!< OpenNI2 (for Orbbec Astra)
	GPHOTO2       = 1700, //!< gPhoto2 connection
	GSTREAMER     = 1800, //!< GStreamer
	FFMPEG        = 1900, //!< Open and record video file or stream using the FFMPEG library
	IMAGES        = 2000, //!< OpenCV Image Sequence (e.g. img_%02d.jpg)
	ARAVIS        = 2100, //!< Aravis SDK
	OPENCV_MJPEG  = 2200, //!< Built-in OpenCV MotionJPEG codec
	INTEL_MFX     = 2300, //!< Intel MediaSDK
	XINE          = 2400, //!< XINE engine (Linux)
	UEYE          = 2500, //!< uEye Camera API
	OBSENSOR      = 2600, //!< For Orbbec 3D-Sensor device/module (Astra+, Femto, Astra2, Gemini2, Gemini2L, Gemini2XL, Femto Mega) attention: Astra2, Gemini2, and Gemini2L cameras currently only support Windows and Linux kernel versions no higher than 4.15, and higher versions of Linux kernel may have exceptions.
}

// Cap_Props are the properties used for VideoCapture operations.
Cap_Props :: enum {
	PosMsec           = 0, // PosMsec contains current position of the video file in milliseconds.
	PosFrames         = 1, // PosFrames 0-based index of the frame to be decoded/captured next.
	PosAVIRatio       = 2, // PosAVIRatio relative position of the video file: 0=start of the film, 1=end of the film.
	FrameWidth        = 3, // FrameWidth is width of the frames in the video stream.
	FrameHeight       = 4, // FrameHeight controls height of frames in the video stream.
	FPS               = 5, // FPS controls capture frame rate.
	FOURCC            = 6, // FOURCC contains the 4-character code of codec. see VideoWriter::fourcc for details.
	FrameCount        = 7, // FrameCount contains number of frames in the video file.
	Format            = 8, // Format format of the Mat objects returned by ::retrieve().
	Mode              = 9, // Mode contains backend-specific value indicating the current capture mode.
	Brightness        = 10, // Brightness is brightness of the image (only for those cameras that support).
	Contrast          = 11, // Contrast is contrast of the image (only for cameras that support it).
	Saturation        = 12, // Saturation saturation of the image (only for cameras that support).
	Hue               = 13, // Hue hue of the image (only for cameras that support).
	Gain              = 14, // Gain is the gain of the capture image. (only for those cameras that support).
	Exposure          = 15, // Exposure is the exposure of the capture image. (only for those cameras that support).
	ConvertRGB        = 16, // ConvertRGB is a boolean flags indicating whether images should be converted to RGB.
	WhiteBalanceBlueU = 17, // WhiteBalanceBlueU is currently unsupported.
	Rectification     = 18, // Rectification is the rectification flag for stereo cameras. Note: only supported by DC1394 v 2.x backend currently.
	Monochrome        = 19, // Monochrome indicates whether images should be converted to monochrome.
	Sharpness         = 20, // Sharpness controls image capture sharpness.
	AutoExposure      = 21, // AutoExposure controls the DC1394 exposure control done by camera, user can adjust reference level using this feature.
	Gamma             = 22, // Gamma controls video capture gamma.
	Temperature       = 23, // Temperature controls video capture temperature.
	Trigger           = 24, // Trigger controls video capture trigger.
	TriggerDelay      = 25, // TriggerDelay controls video capture trigger delay.
	WhiteBalanceRedV  = 26, // WhiteBalanceRedV controls video capture setting for white balance.
	Zoom              = 27, // Zoom controls video capture zoom.
	Focus             = 28, // Focus controls video capture focus.
	GUID              = 29, // GUID controls video capture GUID.
	ISOSpeed          = 30, // ISOSpeed controls video capture ISO speed.
	Backlight         = 32, // Backlight controls video capture backlight.
	Pan               = 33, // Pan controls video capture pan.
	Tilt              = 34, // Tilt controls video capture tilt.
	Roll              = 35, // Roll controls video capture roll.
	Iris              = 36, // Iris controls video capture iris.
	Settings          = 37, // Settings is the pop up video/camera filter dialog. Note: only supported by DSHOW backend currently. The property value is ignored.
	BufferSize        = 38, // BufferSize controls video capture buffer size.
	AutoFocus         = 39, // AutoFocus controls video capture auto focus..
	SarNumerator      = 40, // SarNumerator controls the sample aspect ratio: num/den (num)
	SarDenominator    = 41, // SarDenominator controls the sample aspect ratio: num/den (den)
	Backend           = 42, // Backend is the current api backend (VideoCaptureAPI). Read-only property.
	Channel           = 43, // Channel controls the video input or channel number (only for those cameras that support).
	AutoWB            = 44, // AutoWB controls the auto white-balance.
	WBTemperature     = 45, // WBTemperature controls the white-balance color temperature
	CodecPixelFormat  = 46, // CodecPixelFormat shows the the codec's pixel format (4-character code). Read-only property. Subset of AV_PIX_FMT_* or -1 if unknown.
	Bitrate           = 47, // Bitrate displays the video bitrate in kbits/s. Read-only property.
}

@(default_calling_convention = "c")
foreign cv {
	@(link_name = "VideoCapture_New")
	new_videocapture :: proc() -> VideoCapture ---
	@(link_name = "VideoCapture_Close")
	delete_videocapture :: proc(v: VideoCapture) ---

	VideoCapture_Open :: proc(v: VideoCapture, uri: cstring) -> c.bool ---
	VideoCapture_OpenWithAPI :: proc(v: VideoCapture, uri: cstring, apiPreference: Cap_API) -> c.bool ---
	VideoCapture_OpenDevice :: proc(v: VideoCapture, device: c.int) -> c.bool ---
	VideoCapture_OpenDeviceWithAPI :: proc(v: VideoCapture, device: c.int, apiPreference: Cap_API) -> c.bool ---
	VideoCapture_Set :: proc(v: VideoCapture, prop: Cap_Props, param: c.double) ---
	VideoCapture_Get :: proc(v: VideoCapture, prop: Cap_Props) -> c.double ---
	VideoCapture_IsOpened :: proc(v: VideoCapture) -> c.int ---
	VideoCapture_Read :: proc(v: VideoCapture, buf: Mat) -> c.int ---
	VideoCapture_Grab :: proc(v: VideoCapture, skip: c.int) ---
	VideoCapture_Retrieve :: proc(v: VideoCapture, buf: Mat) -> c.int ---

	VideoWriter_New :: proc() -> RawVideoWriter ---
	VideoWriter_Close :: proc(v: VideoCapture) ---

	VideoWriter_Open :: proc(vw: RawVideoWriter, name, codec: cstring, fps: c.double, width, height: c.int, isColor: c.bool) ---
	VideoWriter_IsOpened :: proc(vw: RawVideoWriter) -> c.int ---
	VideoWriter_Write :: proc(vw: RawVideoWriter, img: Mat) ---
}

// videocapture_file opens a VideoCapture from a file and prepares
// to start capturing. It returns error if it fails to open the file stored in uri path.
videocapture_file :: proc(uri: string) -> (vc: VideoCapture, ok: bool) {
	vc = new_videocapture()

	c_uri := strings.clone_to_cstring(uri)
	defer delete(c_uri)

	ok = VideoCapture_Open(vc, c_uri)

	return
}

// videocapture_file__with_api opens a VideoCapture from a file and prepares
// to start capturing. It returns error if it fails to open the file stored in uri path.
videocapture_file_with_api :: proc(
	uri: string,
	apiPreference: Cap_API,
) -> (
	vc: VideoCapture,
	ok: bool,
) {
	vc = new_videocapture()

	c_uri := strings.clone_to_cstring(uri)
	defer delete(c_uri)

	ok = VideoCapture_OpenWithAPI(vc, c_uri, apiPreference)

	return
}

// videocapture_device opens a VideoCapture from a device and prepares
// to start capturing. It returns error if it fails to open the video device.
videocapture_device :: proc(device: int) -> (vc: VideoCapture, ok: bool) {
	vc = new_videocapture()
	ok = VideoCapture_OpenDevice(vc, c.int(device))
	return
}

// videocapture_device_with_api opens a VideoCapture from a device with the api preference.
// It returns error if it fails to open the video device.
videocapture_device_with_api :: proc(
	device: int,
	apiPreference: Cap_API,
) -> (
	vc: VideoCapture,
	ok: bool,
) {
	vc = new_videocapture()
	ok = VideoCapture_OpenDeviceWithAPI(vc, c.int(device), apiPreference)
	return
}

// videocapture_set parameter with property (=key).
videocapture_set :: proc(v: VideoCapture, prop: Cap_Props, param: f64) {
	VideoCapture_Set(v, prop, c.double(param))
}

// videocapture_get parameter with property (=key).
videocapture_get :: proc(v: VideoCapture, prop: Cap_Props) -> f64 {
	return VideoCapture_Get(v, prop)
}

// videocapture_is_opened returns if the VideoCapture has been opened to read from
// a file or capture device.
videocapture_is_opened :: proc(v: VideoCapture) -> bool {
	isOpened := VideoCapture_IsOpened(v)
	return isOpened != 0
}

// videocapture_read reads the next frame from the VideoCapture to the Mat passed in
// as the param. It returns false if the VideoCapture cannot read frame.
videocapture_read :: proc(v: VideoCapture, m: Mat) -> bool {
	return VideoCapture_Read(v, m) != 0
}

// videocapture_grab skips a specific number of frames.
videocapture_grab :: proc(v: VideoCapture, skip: int) {
	VideoCapture_Grab(v, c.int(skip))
}

// videocapture_retrieve decodes and returns the grabbed video frame. Should be used after Grab
//
// For further details, please see:
// http://docs.opencv.org/master/d8/dfe/classcv_1_1VideoCapture.html#a9ac7f4b1cdfe624663478568486e6712
videocapture_retrieve :: proc(v: VideoCapture, m: Mat) -> bool {
	return VideoCapture_Retrieve(v, m) != 0
}

// videocapture_codec_string returns a string representation of FourCC bytes, i.e. the name of a codec
videocapture_codec_string :: proc(v: VideoCapture) -> string {
	sb := strings.builder_make()
	defer strings.builder_destroy(&sb)

	hexes := []i64{0xff, 0xff00, 0xff0000, 0xff000000}
	param: i64
	for h, i in hexes {
		param = cast(i64)videocapture_get(v, .FOURCC)
		strings.write_rune(&sb, rune(param & h >> (uint(i * 8))))
	}

	return strings.to_string(sb)
}

// videocapture_to_codec returns an float64 representation of FourCC bytes
videocapture_to_codec :: proc(v: VideoCapture, codec: string) -> f64 {
	if len(codec) != 4 {
		return -1.0
	}
	c1 := codec[0]
	c2 := codec[1]
	c3 := codec[2]
	c4 := codec[3]
	return f64((c1 & 255) + ((c2 & 255) << 8) + ((c3 & 255) << 16) + ((c4 & 255) << 24))
}

new_videowriter :: proc() -> (vw: ^VideoWriter) {
	vw = new(VideoWriter)
	vw.p = VideoWriter_New()
	return
}

// videowriter_file opens a VideoWriter with a specific output file.
// The "codec" param should be the four-letter code for the desired output
// codec, for example "MJPG".
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d9e/classcv_1_1VideoWriter.html#a0901c353cd5ea05bba455317dab81130
videowriter_file :: proc(
	name, codec: string,
	fps: f64,
	width, height: int,
	isColor: bool,
) -> (
	vw: ^VideoWriter,
	ok: bool,
) {
	ok = true

	if fps == 0 || width == 0 || height == 0 {
		fmt.eprintfln(
			"one of the numerical parameters is equal to zero: FPS: %f, width: %d, height: %d",
			fps,
			width,
			height,
		)
		return nil, false
	}

	vw = new_videowriter()

	c_name := strings.clone_to_cstring(name)
	defer delete(c_name)

	c_codec := strings.clone_to_cstring(codec)
	defer delete(c_codec)

	VideoWriter_Open(
		vw.p,
		c_name,
		c_codec,
		c.double(fps),
		c.int(width),
		c.int(height),
		c.bool(isColor),
	)
	return
}

// videowriter_is_opened checks if the VideoWriter is open and ready to be written to.
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d9e/classcv_1_1VideoWriter.html#a9a40803e5f671968ac9efa877c984d75
videowriter_is_opened :: proc(v: ^VideoWriter) -> bool {
	isOpened := VideoWriter_IsOpened(v.p)
	return isOpened != 0
}

// videowriter_write the next video frame from the Mat image to the open VideoWriter.
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d9e/classcv_1_1VideoWriter.html#a3115b679d612a6a0b5864a0c88ed4b39
videowriter_write :: proc(vw: ^VideoWriter, img: Mat) {
	sync.lock(vw.mu)
	defer sync.unlock(vw.mu)
	VideoWriter_Write(vw.p, img)
	return
}

// open_videocapture return VideoCapture specified by device ID if v is a
// number. Return VideoCapture created from video file, URL, or GStreamer
// pipeline if v is a string.
open_videocapture :: proc(src: union {
		int,
		string,
	}) -> (VideoCapture, bool) {
	switch s in src {
	case int:
		return videocapture_device(s)
	case string:
		id, ok := strconv.parse_int(s)
		if ok do return videocapture_device(id)
		return videocapture_file(s)
	case:
		return nil, false
	}
}

open_videocapture_with_api :: proc(src: union {
		int,
		string,
	}, apiPreference: Cap_API) -> (VideoCapture, bool) {
	switch s in src {
	case int:
		return videocapture_device_with_api(s, apiPreference)
	case string:
		id, ok := strconv.parse_int(s)
		if ok do return videocapture_device_with_api(id, apiPreference)
		return videocapture_file_with_api(s, apiPreference)
	case:
		return nil, false
	}
}
