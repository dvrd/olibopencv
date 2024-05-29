# olibopencv

**olibopencv** is an implementation of OpenCV in Odin. It applies the same
patterns as [gocv](https://github.com/hybridgroup/gocv)

My project is having a playground for OpenCV along with the library but it's just a work in process

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
* OpenCV 4 (Already included in the project for macos-arm64)

Copy the `cv` directory into your project
```bash
mv libs/cv path/to/your/project
```
### Build library

```bash
# First compile the build tool
odin build build -out:cv

# Then you can execute any of the options
./cv objects
./cv shared
./cv playground
./cv app
./cv run
```

