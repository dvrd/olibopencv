#include "../libs/cv/cv.h"
#include <stdio.h>
// #include <opencv2/highgui.hpp>

// int mat_size = sizeof(cv::Mat);

int main() {
  printf("%s", ">>> C-Wrapper Started...\n");
  // std::cout << ">>> " << mat_size << " bytes\n";
  // Read the image file
  Mat image = image_read("logo.png", IMREAD_COLOR);

  // Check for failure
  if (mat_isempty(image)) {
    printf("{%s}", ">>> Could not open or find the image\n");
    return -1;
  }

  const char *windowName = "The Image"; // Name of the window

  named_window(windowName); // Create a window

  image_show(windowName, image); // Show our image inside the created window.

  wait_key(0); // Wait for any keystroke in the window

  destroy_window(windowName); // destroy the created window

  free_mem(image);

  printf("%s", ">>> C-Wrapper Ended...\n");

  return 0;
}
