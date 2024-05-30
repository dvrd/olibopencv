package olibopencv_builder

import "cmd"
import "core:log"
import "core:os"
import "core:path/filepath"

build_app :: proc(is_debug := true) {
	if !os.exists(PLAYGROUND_TARGET) do build_playground()

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
	if !os.exists(APP_TARGET_DEBUG) do build_app()

	err := cmd.launch({APP_TARGET_DEBUG})
	if err != .ERROR_NONE {
		log.error("Failed compilation of src due to:", os.get_last_error_string())
		os.exit(1)
	}
}
