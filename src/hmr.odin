package imgproc

import "core:c/libc"
import "core:dynlib"
import "core:fmt"
import "core:log"
import "core:mem"
import "core:os"
import "core:path/filepath"

when ODIN_OS == .Windows {
	DLL_EXT :: ".dll"
} else when ODIN_OS == .Darwin {
	DLL_EXT :: ".dylib"
} else {
	DLL_EXT :: ".so"
}

PROJ_NAME :: "olibopencv"
LIB_PATH :: "target/playground/"
BIN_PATH :: LIB_PATH + PROJ_NAME + DLL_EXT

AppAPI :: struct {
	api_version:       int,
	lib:               dynlib.Library,
	init_window:       proc(),
	init:              proc(),
	update:            proc() -> bool,
	shutdown:          proc(),
	shutdown_window:   proc(),
	state:             proc() -> rawptr,
	state_size:        proc() -> int,
	hot_reloaded:      proc(mem: rawptr),
	force_reload:      proc() -> bool,
	force_restart:     proc() -> bool,
	modification_time: os.File_Time,
}

copy_dll :: proc(to: string) -> bool {
	exit: i32
	exit = libc.system(fmt.ctprintf("cp " + BIN_PATH + " {0}", to))

	if exit != 0 {
		fmt.printfln("Failed to copy " + PROJ_NAME + DLL_EXT + " to {0}", to)
		return false
	}

	return true
}

load_api :: proc(api_version: int) -> (api: AppAPI, ok: bool) {
	mod_time, mod_time_error := os.last_write_time_by_name(BIN_PATH)
	if mod_time_error != os.ERROR_NONE {
		fmt.printfln(
			"Failed getting last write time of " + BIN_PATH + ", error code: %v",
			os.get_last_error_string(),
		)
		return
	}

	// NOTE: this needs to be a relative path for Linux to work.
	app_dll_name := fmt.tprintf(LIB_PATH + PROJ_NAME + "_{0}" + DLL_EXT, api_version)
	fmt.println("dll name:", app_dll_name)
	copy_dll(app_dll_name) or_return

	_, ok = dynlib.initialize_symbols(&api, app_dll_name, "app_", "lib")
	if !ok {
		fmt.printfln("Failed initializing symbols: {0}", dynlib.last_error())
	}

	api.api_version = api_version
	api.modification_time = mod_time
	ok = true

	return
}

unload_api :: proc(api: ^AppAPI) {
	if api.lib != nil {
		if !dynlib.unload_library(api.lib) {
			fmt.printfln("Failed unloading lib: {0}", dynlib.last_error())
		}
	}

	if os.remove(fmt.tprintf(PROJ_NAME + "_{0}" + DLL_EXT, api.api_version)) != 0 {
		fmt.printfln("Failed to remove " + PROJ_NAME + "_{0}" + DLL_EXT + " copy", api.api_version)
	}
}

// make app use good GPU on laptops etc
@(export)
NvOptimusEnablement: u32 = 1

@(export)
AmdPowerXpressRequestHighPerformance: i32 = 1
