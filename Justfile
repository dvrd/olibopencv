alias r := run
alias b := build

cv_lib_src := "libs/cv"
cv_lib_bindigns := "libs/cv/bindings"
linker_flags := "\"`pkg-config --cflags --libs opencv4` -lstdc++\""

default:
  @just --list

clear:
  rm -f {{cv_lib_src}}/*.a {{cv_lib_src}}/*.dylib {{cv_lib_bindigns}}/*.o odin-vision main

object:
  @for file in `ls {{cv_lib_bindigns}}`; do \
    if [[ $file == *.cpp ]]; then \
      out=${file%.*}.o; \
      clang -o {{cv_lib_bindigns}}/$out -c {{cv_lib_bindigns}}/$file -Wall -fpic `pkg-config --cflags opencv4`; \
    fi; \
  done

static: object
  ar rcs {{cv_lib_src}}/libcv.a {{cv_lib_bindigns}}/*.o

shared: object
  clang -dynamiclib -o {{cv_lib_src}}/libcv.dylib {{cv_lib_bindigns}}/*.o `pkg-config --cflags --libs opencv4` -lstdc++

build_c: shared
  clang -Wall -I{{cv_lib_src}} -o main src/main.c -L{{cv_lib_src}} -lcv `pkg-config --cflags --libs opencv4` -lstdc++

build_odin: shared static
	odin build src \
	-collection:libs=libs \
	-use-separate-modules \
	-out:odin-vision \
	-extra-linker-flags:{{linker_flags}} \
	-o:speed

build target:
  @just build_{{target}}

test: static
  odin test libs/cv/tests -extra-linker-flags:{{linker_flags}} \

run_c: build_c
  LD_LIBRARY_PATH={{cv_lib_src}}/ ./main

run_odin: build_odin
  ./odin-vision

run target:
  @just run_{{target}}

