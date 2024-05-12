#include "cv.h"
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

Mat new_mat() { return new cv::Mat(); }

Mat image_read(const char *file, int flags) {
  cv::Mat image = cv::imread(file, flags);
  return new cv::Mat(image);
}

bool mat_isempty(Mat mat) {
  cv::Mat *m = static_cast<cv::Mat *>(mat);
  return m->empty();
}

void named_window(const char *name) {
  // std::string win_name{name};
  // cv::namedWindow(win_name);
  cv::namedWindow(name);
}

void image_show(const char *name, Mat img) {
  cv::Mat *image = static_cast<cv::Mat *>(img);
  std::string win_name{name};
  // cv::imshow(win_name, *image);
  cv::imshow(name, *image);
}

int wait_key(int delay) { return cv::waitKey(delay); }

void destroy_window(const char *name) {
  // const std::string win_name{name};
  // cv::destroyWindow(win_name);
  cv::destroyWindow(name);
}

bool image_write(const char *filename, Mat img) {
  cv::Mat *image = static_cast<cv::Mat *>(img);
  return cv::imwrite(filename, *image);
}

void free_mem(void *data) { free(data); }

VideoCapture new_videocapture() { return new cv::VideoCapture(); }

bool videocapture_open(VideoCapture cap, int device_id, int api_id) {
  cv::VideoCapture *capture = static_cast<cv::VideoCapture *>(cap);
  return capture->open(device_id, api_id);
}

void videocapture_release(VideoCapture cap) {
  cv::VideoCapture *capture = static_cast<cv::VideoCapture *>(cap);
  capture->release();
}

bool videocapture_isopened(VideoCapture cap) {
  cv::VideoCapture *capture = static_cast<cv::VideoCapture *>(cap);
  return capture->isOpened();
}

bool videocapture_read(VideoCapture cap, Mat frame) {
  cv::Mat *image = static_cast<cv::Mat *>(frame);
  cv::VideoCapture *capture = static_cast<cv::VideoCapture *>(cap);
  return capture->read(*image);
}
