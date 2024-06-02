package olibopencv_builder

BINDINGS_PATH :: "libs/cv/bindings"
BINDINGS_TESTS_PATH :: "libs/cv/tests"
DYLIB_PATH :: "libs/cv/libcv.dylib"

PLAYGROUND_SRC :: "libs/playground"
PLAYGROUND_TARGET :: "target/playground/olibopencv"

APP_SRC :: "src"
APP_TARGET_DEBUG :: "target/debug/olibopencv"
APP_TARGET_RELEASE :: "target/release/olibopencv"
LIBS_PATH :: "libs"

FG_YELLOW :: "\x1B[33m"
END :: "\x1b[0m"

CFLAGS :: []string{"-Wall", "-Wextra"}
OPENCV_LIBRARIES :: []string {
	"-lopencv_gapi",
	"-lopencv_stitching",
	"-lopencv_alphamat",
	"-lopencv_aruco",
	"-lopencv_bgsegm",
	"-lopencv_bioinspired",
	"-lopencv_ccalib",
	"-lopencv_dnn_objdetect",
	"-lopencv_dnn_superres",
	"-lopencv_dpm",
	"-lopencv_face",
	"-lopencv_freetype",
	"-lopencv_fuzzy",
	"-lopencv_hfs",
	"-lopencv_img_hash",
	"-lopencv_intensity_transform",
	"-lopencv_line_descriptor",
	"-lopencv_mcc",
	"-lopencv_quality",
	"-lopencv_rapid",
	"-lopencv_reg",
	"-lopencv_rgbd",
	"-lopencv_saliency",
	"-lopencv_sfm",
	"-lopencv_stereo",
	"-lopencv_structured_light",
	"-lopencv_phase_unwrapping",
	"-lopencv_superres",
	"-lopencv_optflow",
	"-lopencv_surface_matching",
	"-lopencv_tracking",
	"-lopencv_highgui",
	"-lopencv_datasets",
	"-lopencv_text",
	"-lopencv_plot",
	"-lopencv_videostab",
	"-lopencv_videoio",
	"-lopencv_viz",
	"-lopencv_wechat_qrcode",
	"-lopencv_xfeatures2d",
	"-lopencv_shape",
	"-lopencv_ml",
	"-lopencv_ximgproc",
	"-lopencv_video",
	"-lopencv_xobjdetect",
	"-lopencv_objdetect",
	"-lopencv_calib3d",
	"-lopencv_imgcodecs",
	"-lopencv_features2d",
	"-lopencv_dnn",
	"-lopencv_flann",
	"-lopencv_xphoto",
	"-lopencv_photo",
	"-lopencv_imgproc",
	"-lopencv_core",
}
