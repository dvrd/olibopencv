alias r := run
alias b := build

cv_lib_src := "libs/cv"
cv_lib_bindings := "libs/cv/bindings"
linker_flags := "\"`pkg-config --cflags --libs opencv4` -lstdc++\""

default:
  @just --list

clear:
  rm -f {{cv_lib_src}}/*.a {{cv_lib_src}}/*.dylib {{cv_lib_bindings}}/*.o odin-vision main

object:
  @for file in `ls {{cv_lib_bindings}}`; do \
    if [[ $file == *.cpp ]]; then \
      out=${file%.*}.o; \
      echo "Compiling {{cv_lib_bindings}}/$out"; \
      clang -o {{cv_lib_bindings}}/$out -c {{cv_lib_bindings}}/$file -Wall -fpic `pkg-config --cflags opencv4`; \
    fi; \
  done; \
  echo "Done" \

static: object
  ar rcs {{cv_lib_src}}/libcv.a {{cv_lib_bindings}}/*.o

shared: object
  clang -dynamiclib -o {{cv_lib_src}}/libcv.dylib {{cv_lib_bindings}}/*.o `pkg-config --cflags --libs opencv4` -lstdc++

build_c: shared
  clang -Wall -I{{cv_lib_src}} -o main src/main.c -L{{cv_lib_src}} -lcv `pkg-config --cflags --libs opencv4` -lstdc++

build:
  @if [[ ! -f {{cv_lib_src}}/libcv.dylib ]]; then \
    just shared; \
  fi; \
  octo build release

test:
  @if [[ ! -f {{cv_lib_src}}/libcv.dylib ]]; then \
    just shared; \
  fi; \
  odin test libs/cv/tests -extra-linker-flags:{{linker_flags}}; \
  rm tests

run: build
  @octo run release

