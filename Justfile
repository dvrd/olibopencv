cv_lib_src := "libs/cv"
linker_flags := "\"`pkg-config --cflags --libs opencv4` -lstdc++\""

clear:
	rm -f {{cv_lib_src}}/libcv.dylib {{cv_lib_src}}/cv.a {{cv_lib_src}}/cv.o odin-vision main

object:
	clang -c {{cv_lib_src}}/cv.cpp -Wall -fpic `pkg-config --cflags opencv4` -lstdc++ -o {{cv_lib_src}}/cv.o

static: object
	ar rcs {{cv_lib_src}}/cv.a {{cv_lib_src}}/cv.o

shared: object
	clang -dynamiclib -o {{cv_lib_src}}/libcv.dylib {{cv_lib_src}}/cv.o `pkg-config --cflags --libs opencv4` -lstdc++

build_c: shared
	clang -Wall -I{{cv_lib_src}} -o main main.c -L{CV_LIB} -lcv `pkg-config --cflags --libs opencv4` -lstdc++

build_odin: shared static
	odin build src \
		-collection:libs=libs \
		-use-separate-modules \
		-out:odin-vision \
		-extra-linker-flags:{{linker_flags}} \
		-o:speed

build target:
	just build_{{target}}

run_c: build_c
	LD_LIBRARY_PATH={{cv_lib_src}}/ ./main

run_odin: build_odin
	./odin-vision

run target:
	just run_{{target}}

