package olibopencv_builder

import "cmd"
import "core:log"
import "core:os"
import "core:path/filepath"
import "core:strings"

build_app :: proc(is_debug := true) {
	if !os.exists(PLAYGROUND_TARGET) do build_playground()
	if !os.exists("target") do os.make_directory("target")
	if is_debug && !os.exists("target/debug") do os.make_directory("target/debug")
	if !is_debug && !os.exists("target/release") do os.make_directory("target/release")


	args := make([dynamic]string)

	if !os.exists("target") {
		os.make_directory("target")
	}

	append(&args, "odin", "build")
	append(&args, APP_SRC)
	append(&args, "-collection:" + LIBS_PATH + "=" + LIBS_PATH)
	if is_debug {
		append(&args, "-debug")
		append(&args, "-out:" + APP_TARGET_DEBUG)
	} else {
		append(&args, "-o:speed")
		append(&args, "-out:" + APP_TARGET_RELEASE)
	}
	log.debug("Building app")
	log.debug(strings.join(args[:], " "))
	err := cmd.launch(args[:])
	if err != .ERROR_NONE {
		log.error("Failed compilation of src due to:", os.get_last_error_string())
		os.exit(1)
	}
	log.debug("Successfully compiled", APP_TARGET_RELEASE)
}

run_app :: proc() {
	if !os.exists(APP_TARGET_DEBUG) do build_app()

	err := cmd.launch({APP_TARGET_DEBUG})
	if err != .ERROR_NONE {
		log.error("Failed compilation of src due to:", os.get_last_error_string())
		os.exit(1)
	}
}
