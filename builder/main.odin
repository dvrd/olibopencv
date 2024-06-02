package olibopencv_builder

import "cmd"
import "core:fmt"
import "core:log"
import "core:os"
import "core:path/filepath"
import "core:strings"

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

extra_linker_flags :: proc(with_raylib_dll := true) -> string {
	flags := make([dynamic]string)
	opencv_library(&flags, {.Cflags, .Library})
	append(&flags, "-lstdc++")
	append(&flags, "-Wl,-rpath", filepath.join({ODIN_ROOT, "vendor", "raylib", "macos-arm64"}))

	return fmt.tprintf("-extra-linker-flags:\"%s\"", strings.join(flags[:], " "))
}

clean_files :: proc() {
	remove_dir("target")
	for file in OBJECT_FILES {
		os.remove(filepath.join({BINDINGS_PATH, file}))
	}
	os.remove(DYLIB_PATH)
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
	case "clean":
		clean_files()
	case:
		log.error("Invalid command")
		os.exit(1)
	}
}
