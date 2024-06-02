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
	should_close := false
	for !should_close {
		should_close = api.update()
		force_reload := api.force_reload()
		force_restart := api.force_restart()
		reload := force_reload || force_restart
		app_dll_mod, app_dll_mod_err := os.last_write_time_by_name(BIN_PATH)

		if app_dll_mod_err == os.ERROR_NONE && api.modification_time != app_dll_mod {
			log.debugf("API DLL modified {0}s ago", app_dll_mod - api.modification_time)
			if app_dll_mod_err == os.ERROR_NONE do log.error(os.get_last_error_string())
			reload = true
		}

		if reload {
			new_api, ok = load_api(version)
			log.debug("Reloading API:", ok)
			if ok {
				if api.state_size() != new_api.state_size() || force_restart {
					log.debug("Force restarting")
					api.shutdown()
					reset_tracking_allocator(&tracking_allocator)

					for &old_api in old_apis {
						log.debug("Unloading", old_api)
						unload_api(&old_api)
					}

					clear(&old_apis)
					log.debug("Unloading", api)
					unload_api(&api)
					api = new_api
					api.init()
				} else {
					log.debug("Hot reloading")
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

reset_tracking_allocator :: proc(a: ^mem.Tracking_Allocator) -> (err: bool) {
	for _, value in a.allocation_map {
		log.debugf("%v: Leaked %v bytes", value.location, value.size)
		err = true
	}

	mem.tracking_allocator_clear(a)
	return
}
