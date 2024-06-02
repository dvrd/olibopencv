package olibopencv_builder

import "core:log"
import "core:os"

read_dir :: proc(dir_name: string) -> ([]os.File_Info, bool) {
	log.debug("Reading directory:", dir_name)
	f, errno := os.open(dir_name, os.O_RDONLY)
	if errno != os.ERROR_NONE do return nil, false
	defer os.close(f)

	fis: []os.File_Info
	fis, errno = os.read_dir(f, -1)
	if errno != os.ERROR_NONE do return nil, false

	return fis, true
}

remove_dir :: proc(dir: string) -> bool {
	files := read_dir(dir) or_return

	for file in files {
		if file.is_dir {
			remove_dir(file.fullpath) or_return
			continue
		}

		log.debug("Removing file:", file.fullpath)
		if os.remove(file.fullpath) != os.ERROR_NONE do return false
	}

	log.debug("Removing directory:", dir)
	if os.remove(dir) != os.ERROR_NONE do return false

	return true
}
