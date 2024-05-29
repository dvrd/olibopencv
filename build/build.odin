package olibopencv_builder

import "cmd"
import "core:fmt"
import "core:log"
import "core:os"
import "core:path/filepath"
import "core:strings"

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

LinkOption :: enum {
	Cflags,
	Library,
}

LinkOptions :: bit_set[LinkOption]

opencv_library :: proc(args: ^[dynamic]string, options: LinkOptions) {
	when ODIN_OS == .Darwin && ODIN_ARCH == .arm64 {
		if .Cflags in options {
			include_path := filepath.join({BINDINGS_PATH, "macos-arm64", "include"})
			append(args, strings.join({"-I", include_path}, ""))
		}

		if .Library in options {
			libraries_path := filepath.join({BINDINGS_PATH, "macos-arm64", "lib"})
			append(args, strings.join({"-L", libraries_path}, ""))
			append(args, ..OPENCV_LIBRARIES)
		}
	} else {
		log.error("Arch (" + ODIN_ARCH + ") || OS (" + ODIN_OS + ") not supported")
		os.exit(1)
	}
}

platform_c_compiler :: proc(args: ^[dynamic]string) {
	when ODIN_OS == .Darwin {
		append(args, "clang")
	} else {
		log.error("OS (" + ODIN_OS + ") not supported")
		os.exit(1)
	}
}

compile_object :: proc(
	info: os.File_Info,
	in_err: os.Errno,
	user_data: rawptr,
) -> (
	err: os.Errno,
	skip_dir: bool,
) {
	if info.is_dir && info.name == "macos-arm64" do return os.ERROR_NONE, true

	args := make([dynamic]string)
	defer delete(args)

	platform_c_compiler(&args)

	if filepath.ext(info.name) == ".cpp" {
		log.debug("Compiling" + FG_YELLOW, info.name, END + "to object")

		out_file := strings.join({filepath.short_stem(info.name), ".o"}, "")
		append(&args, "-o", filepath.join({BINDINGS_PATH, out_file}))
		append(&args, "-c", filepath.join({BINDINGS_PATH, info.name}))
		append(&args, ..CFLAGS)
		append(&args, "-fpic")
		opencv_library(&args, {.Cflags})

		err := cmd.launch(args[:])
		if err != .ERROR_NONE {
			log.error("Failed compilation of", info.name, "due to:", os.get_last_error_string())
			return os.Errno(err), false
		}
	}

	return os.ERROR_NONE, false
}

compile_objects :: proc() {
	err := filepath.walk(BINDINGS_PATH, compile_object, nil)
	if err != os.ERROR_NONE do os.exit(1)
}

collect_object_files :: proc(
	info: os.File_Info,
	in_err: os.Errno,
	user_data: rawptr,
) -> (
	err: os.Errno,
	skip_dir: bool,
) {
	if info.name == "macos-arm64" do return os.ERROR_NONE, true

	if filepath.ext(info.name) == ".o" {
		args := (cast(^[dynamic]string)user_data)
		append(args, info.fullpath)
	}

	return os.ERROR_NONE, false
}

build_dll :: proc() {
	args := make([dynamic]string)

	platform_c_compiler(&args)
	append(&args, "-dynamiclib")
	append(&args, "-o", DYLIB_PATH)

	filepath.walk(BINDINGS_PATH, collect_object_files, &args)
	append(&args, "-lstdc++")
	opencv_library(&args, {.Cflags, .Library})

	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error("Failed compilation of " + DYLIB_PATH + " due to:", os.get_last_error_string())
		os.exit(1)
	}
}

extra_linker_flags :: proc(with_raylib_dll := true) -> string {
	flags := make([dynamic]string)
	opencv_library(&flags, {.Cflags, .Library})
	append(&flags, "-lstdc++")
	append(&flags, "-Wl,-rpath", filepath.join({ODIN_ROOT, "vendor", "raylib", "macos-arm64"}))

	return fmt.tprintf("-extra-linker-flags:\"%s\"", strings.join(flags[:], " "))
}

build_playground :: proc() {
	args := make([dynamic]string)

	append(&args, "odin", "build")
	append(&args, PLAYGROUND_SRC)
	append(&args, "-collection:" + LIBS_PATH + "=" + LIBS_PATH)
	append(&args, "-debug")
	append(&args, "-build-mode:dll")
	append(&args, "-define:RAYLIB_SHARED=true")
	append(&args, extra_linker_flags())
	append(&args, "-out:" + PLAYGROUND_TARGET)
	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error(
			"Failed compilation of " + PLAYGROUND_SRC + " due to:",
			os.get_last_error_string(),
		)
		os.exit(1)
	}
}

build_app :: proc(is_debug := true) {
	args := make([dynamic]string)

	if !os.exists("target") {
		os.make_directory("target")
	}

	append(&args, "odin", "build")
	append(&args, APP_SRC)
	append(&args, "-collection:" + LIBS_PATH + "=" + LIBS_PATH)
	if is_debug {
		append(&args, "-debug")
		if !os.exists(filepath.dir(APP_TARGET_DEBUG)) {
			os.make_directory(filepath.dir(APP_TARGET_DEBUG))
		}
		append(&args, "-out:" + APP_TARGET_DEBUG)
	} else {
		append(&args, "-o:speed")
		if !os.exists(filepath.dir(APP_TARGET_RELEASE)) {
			os.make_directory(filepath.dir(APP_TARGET_RELEASE))
		}
		append(&args, "-out:" + APP_TARGET_RELEASE)
	}
	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error("Failed compilation of src due to:", os.get_last_error_string())
		os.exit(1)
	}
}

run_app :: proc() {
	err := cmd.launch({APP_TARGET_DEBUG})
	if err != .ERROR_NONE {
		log.error("Failed compilation of src due to:", os.get_last_error_string())
		os.exit(1)
	}
}

test_bindings :: proc() {
	args := make([dynamic]string)
	append(&args, "odin", "test")
	append(&args, BINDINGS_TESTS_PATH)
	append(&args, extra_linker_flags(with_raylib_dll = false))
	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error("Failed test run of bindings due to:", os.get_last_error_string())
		os.exit(1)
	}
}

main :: proc() {
	context.logger = log.create_console_logger(opt = log.Options{.Level, .Terminal_Color})

	switch os.args[1] {
	case "objects":
		compile_objects()
	case "shared":
		build_dll()
	case "playground":
		build_playground()
	case "app":
		build_app()
	case "release":
		build_app(is_debug = false)
	case "test":
		test_bindings()
	case "run":
		run_app()
	}
}
