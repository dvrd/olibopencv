# olibopencv

**olibopencv** is an implementation of OpenCV in Odin. It applies the same
patterns as [gocv](https://github.com/hybridgroup/gocv)

Currently there are bindings to:
- [x] core
- [x] highgui
- [x] imgcodecs
- [ ] imgproc (partial)
- [x] video
- [x] videoio

### Dev
Dependencies:
* C++ standard library
* OpenCV 4
* `pkg-config`

Copy the `cv` directory into your project
```bash
mv libs/cv path/to/your/project
```
and remember to pass opencv4 and stdc++ libraries when building your app.
This is what works on MacOS with opencv4 installed by homebrew
```bash
  LINKER_FLAGS="\"`pkg-config --cflags --libs opencv4` -lstdc++\""
  odin build src \
      -collection:libs=libs \
      -use-separate-modules \
      -out:odin-vision \
      -extra-linker-flags:${LINKER_FLAGS} \
      -o:speed
```

### Build library

```bash
just static
```
or
```bash
just shared
```

### Run app
To run the app you depend of another personal project (`octo`) but you can
just modify the Justfile with pure odin:
```bash
build:
  @if [[ ! -f {{cv_lib_src}}/libcv.dylib ]]; then \
    just shared; \
  fi; \
  odin build src \
      -collection:libs=libs \
      -use-separate-modules \
      -out:odin-vision \
      -extra-linker-flags:{{linker_flags}} \
      -o:speed
run:
  ./odin-vision
```
and then:
```bash
just run
```

