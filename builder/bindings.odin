package olibopencv_builder

import "cmd"
import "core:log"
import "core:os"
import "core:path/filepath"
import "core:strings"

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

OBJECT_FILES :: []string {
	"core.o",
	"cv.o",
	"highgui.o",
	"imgcodecs.o",
	"imgproc.o",
	"video.o",
	"videoio.o",
}

build_dll :: proc() {
	loop: for file in OBJECT_FILES {
		if !os.exists(filepath.join({BINDINGS_PATH, file})) {
			compile_objects()
			break loop
		}
	}

	args := make([dynamic]string)

	platform_c_compiler(&args)
	append(&args, "-dynamiclib")
	append(&args, "-o", DYLIB_PATH)

	for file in OBJECT_FILES {
		file_path := filepath.join({BINDINGS_PATH, file})
		append(&args, file_path)
	}

	append(&args, "-lstdc++")
	opencv_library(&args, {.Cflags, .Library})

	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error("Failed compilation of " + DYLIB_PATH + " due to:", os.get_last_error_string())
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
