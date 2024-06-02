package olibopencv_builder

import "cmd"
import "core:log"
import "core:os"

build_playground :: proc() {
	if !os.exists(DYLIB_PATH) do build_dll()
	if !os.exists("target") do os.make_directory("target")
	if !os.exists("target/playground") do os.make_directory("target/playground")

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
