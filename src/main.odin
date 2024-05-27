package imgproc

import "core:c"
import "core:c/libc"
import "core:fmt"
import "core:log"
import "core:mem"
import "core:os"
import "libs:cv"
import rl "vendor:raylib"

main :: proc() {
	context.logger = log.create_console_logger()
	default_allocator := context.allocator
	tracking_allocator: mem.Tracking_Allocator
	mem.tracking_allocator_init(&tracking_allocator, default_allocator)
	context.allocator = mem.tracking_allocator(&tracking_allocator)

	version := 0
	api, ok := load_api(version)
	if !ok {
		fmt.println("Failed to load Playground API")
		return
	}

	version += 1
	api.init_window()
	api.init()

	old_apis := make([dynamic]AppAPI, default_allocator)

	new_api: AppAPI
	window_open := true
	for window_open {
		window_open = api.update()
		force_reload := api.force_reload()
		force_restart := api.force_restart()
		reload := force_reload || force_restart
		app_dll_mod, app_dll_mod_err := os.last_write_time_by_name(BIN_PATH)

		if app_dll_mod_err == os.ERROR_NONE && api.modification_time != app_dll_mod {
			reload = true
		}

		if reload {
			new_api, ok = load_api(version)

			if ok {
				if api.state_size() != new_api.state_size() || force_restart {
					api.shutdown()
					reset_tracking_allocator(&tracking_allocator)

					for &g in old_apis {
						unload_api(&g)
					}

					clear(&old_apis)
					unload_api(&api)
					api = new_api
					api.init()
				} else {
					append(&old_apis, api)
					app_state := api.state()
					api = new_api
					api.hot_reloaded(app_state)
				}

				version += 1
			}
		}

		if len(tracking_allocator.bad_free_array) > 0 {
			for b in tracking_allocator.bad_free_array {
				log.errorf("Bad free at: %v", b.location)
			}

			libc.getchar()
			panic("Bad free detected")
		}
	}

	api.shutdown()
	if reset_tracking_allocator(&tracking_allocator) {
		libc.getchar()
	}

	for &g in old_apis {
		unload_api(&g)
	}

	delete(old_apis)

	api.shutdown_window()
	unload_api(&api)
	mem.tracking_allocator_destroy(&tracking_allocator)
}

reset_tracking_allocator :: proc(a: ^mem.Tracking_Allocator) -> bool {
	err := false

	for _, value in a.allocation_map {
		fmt.printf("%v: Leaked %v bytes\n", value.location, value.size)
		err = true
	}

	mem.tracking_allocator_clear(a)
	return err
}
