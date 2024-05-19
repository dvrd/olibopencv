package cv

import "core:c"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

// ColorConversionCode is a color conversion code used on Mat.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga4e0972be5de079fed4e3a10e24ef5ef0
ColorConversionCode :: enum {
	BGRToBGRA       = 0, // ColorBGRToBGRA adds alpha channel to BGR image.
	RGBToRGBA       = BGRToBGRA, // ColorRGBToRGBA adds alpha channel to RGB image.
	BGRAToBGR       = 1, // ColorBGRAToBGR removes alpha channel from BGR image.
	RGBAToRGB       = BGRAToBGR, // ColorRGBAToRGB removes alpha channel from RGB image.
	BGRToRGBA       = 2, // ColorBGRToRGBA converts from BGR to RGB with alpha channel.
	RGBToBGRA       = BGRToRGBA, // ColorRGBToBGRA converts from RGB to BGR with alpha channel.
	RGBAToBGR       = 3, // ColorRGBAToBGR converts from RGB with alpha to BGR color space.
	BGRAToRGB       = RGBAToBGR, // ColorBGRAToRGB converts from BRG with alpha to RGB color space.
	BGRToRGB        = 4, // ColorBGRToRGB converts from BGR to RGB without alpha channel.
	RGBToBGR        = BGRToRGB, // ColorRGBToBGR converts from RGB to BGR without alpha channel.
	BGRAToRGBA      = 5, // ColorBGRAToRGBA converts from BGR with alpha channel to RGB with alpha channel.
	RGBAToBGRA      = BGRAToRGBA, // ColorRGBAToBGRA converts from RGB with alpha channel to BGR with alpha channel.
	BGRToGray       = 6, // ColorBGRToGray converts from BGR to grayscale.
	RGBToGray       = 7, // ColorRGBToGray converts from RGB to grayscale.
	GrayToBGR       = 8, // ColorGrayToBGR converts from grayscale to BGR.
	GrayToRGB       = GrayToBGR, // ColorGrayToRGB converts from grayscale to RGB.
	GrayToBGRA      = 9, // ColorGrayToBGRA converts from grayscale to BGR with alpha channel.
	GrayToRGBA      = GrayToBGRA, // ColorGrayToRGBA converts from grayscale to RGB with alpha channel.
	BGRAToGray      = 10, // ColorBGRAToGray converts from BGR with alpha channel to grayscale.
	RGBAToGray      = 11, // ColorRGBAToGray converts from RGB with alpha channel to grayscale.
	BGRToBGR565     = 12, // ColorBGRToBGR565 converts from BGR to BGR565 (16-bit images).
	RGBToBGR565     = 13, // ColorRGBToBGR565 converts from RGB to BGR565 (16-bit images).
	BGR565ToBGR     = 14, // ColorBGR565ToBGR converts from BGR565 (16-bit images) to BGR.
	BGR565ToRGB     = 15, // ColorBGR565ToRGB converts from BGR565 (16-bit images) to RGB.
	BGRAToBGR565    = 16, // ColorBGRAToBGR565 converts from BGRA (with alpha channel) to BGR565 (16-bit images).
	RGBAToBGR565    = 17, // ColorRGBAToBGR565 converts from RGBA (with alpha channel) to BGR565 (16-bit images).
	BGR565ToBGRA    = 18, // ColorBGR565ToBGRA converts from BGR565 (16-bit images) to BGRA (with alpha channel).
	BGR565ToRGBA    = 19, // ColorBGR565ToRGBA converts from BGR565 (16-bit images) to RGBA (with alpha channel).
	GrayToBGR565    = 20, // ColorGrayToBGR565 converts from grayscale to BGR565 (16-bit images).
	BGR565ToGray    = 21, // ColorBGR565ToGray converts from BGR565 (16-bit images) to grayscale.
	BGRToBGR555     = 22, // ColorBGRToBGR555 converts from BGR to BGR555 (16-bit images).
	RGBToBGR555     = 23, // ColorRGBToBGR555 converts from RGB to BGR555 (16-bit images).
	BGR555ToBGR     = 24, // ColorBGR555ToBGR converts from BGR555 (16-bit images) to BGR.
	BGR555ToRGB     = 25, // ColorBGR555ToRGB converts from BGR555 (16-bit images) to RGB.
	BGRAToBGR555    = 26, // ColorBGRAToBGR555 converts from BGRA (with alpha channel) to BGR555 (16-bit images).
	RGBAToBGR555    = 27, // ColorRGBAToBGR555 converts from RGBA (with alpha channel) to BGR555 (16-bit images).
	BGR555ToBGRA    = 28, // ColorBGR555ToBGRA converts from BGR555 (16-bit images) to BGRA (with alpha channel).
	BGR555ToRGBA    = 29, // ColorBGR555ToRGBA converts from BGR555 (16-bit images) to RGBA (with alpha channel).
	GrayToBGR555    = 30, // ColorGrayToBGR555 converts from grayscale to BGR555 (16-bit images).
	BGR555ToGRAY    = 31, // ColorBGR555ToGRAY converts from BGR555 (16-bit images) to grayscale.
	BGRToXYZ        = 32, // ColorBGRToXYZ converts from BGR to CIE XYZ.
	RGBToXYZ        = 33, // ColorRGBToXYZ converts from RGB to CIE XYZ.
	XYZToBGR        = 34, // ColorXYZToBGR converts from CIE XYZ to BGR.
	XYZToRGB        = 35, // ColorXYZToRGB converts from CIE XYZ to RGB.
	BGRToYCrCb      = 36, // ColorBGRToYCrCb converts from BGR to luma-chroma (aka YCC).
	RGBToYCrCb      = 37, // ColorRGBToYCrCb converts from RGB to luma-chroma (aka YCC).
	YCrCbToBGR      = 38, // ColorYCrCbToBGR converts from luma-chroma (aka YCC) to BGR.
	YCrCbToRGB      = 39, // ColorYCrCbToRGB converts from luma-chroma (aka YCC) to RGB.
	BGRToHSV        = 40, // ColorBGRToHSV converts from BGR to HSV (hue saturation value).
	RGBToHSV        = 41, // ColorRGBToHSV converts from RGB to HSV (hue saturation value).
	BGRToLab        = 44, // ColorBGRToLab converts from BGR to CIE Lab.
	RGBToLab        = 45, // ColorRGBToLab converts from RGB to CIE Lab.
	BGRToLuv        = 50, // ColorBGRToLuv converts from BGR to CIE Luv.
	RGBToLuv        = 51, // ColorRGBToLuv converts from RGB to CIE Luv.
	BGRToHLS        = 52, // ColorBGRToHLS converts from BGR to HLS (hue lightness saturation).
	RGBToHLS        = 53, // ColorRGBToHLS converts from RGB to HLS (hue lightness saturation).
	HSVToBGR        = 54, // ColorHSVToBGR converts from HSV (hue saturation value) to BGR.
	HSVToRGB        = 55, // ColorHSVToRGB converts from HSV (hue saturation value) to RGB.
	LabToBGR        = 56, // ColorLabToBGR converts from CIE Lab to BGR.
	LabToRGB        = 57, // ColorLabToRGB converts from CIE Lab to RGB.
	LuvToBGR        = 58, // ColorLuvToBGR converts from CIE Luv to BGR.
	LuvToRGB        = 59, // ColorLuvToRGB converts from CIE Luv to RGB.
	HLSToBGR        = 60, // ColorHLSToBGR converts from HLS (hue lightness saturation) to BGR.
	HLSToRGB        = 61, // ColorHLSToRGB converts from HLS (hue lightness saturation) to RGB.
	BGRToHSVFull    = 66, // ColorBGRToHSVFull converts from BGR to HSV (hue saturation value) full.
	RGBToHSVFull    = 67, // ColorRGBToHSVFull converts from RGB to HSV (hue saturation value) full.
	BGRToHLSFull    = 68, // ColorBGRToHLSFull converts from BGR to HLS (hue lightness saturation) full.
	RGBToHLSFull    = 69, // ColorRGBToHLSFull converts from RGB to HLS (hue lightness saturation) full.
	HSVToBGRFull    = 70, // ColorHSVToBGRFull converts from HSV (hue saturation value) to BGR full.
	HSVToRGBFull    = 71, // ColorHSVToRGBFull converts from HSV (hue saturation value) to RGB full.
	HLSToBGRFull    = 72, // ColorHLSToBGRFull converts from HLS (hue lightness saturation) to BGR full.
	HLSToRGBFull    = 73, // ColorHLSToRGBFull converts from HLS (hue lightness saturation) to RGB full.
	LBGRToLab       = 74, // ColorLBGRToLab converts from LBGR to CIE Lab.
	LRGBToLab       = 75, // ColorLRGBToLab converts from LRGB to CIE Lab.
	LBGRToLuv       = 76, // ColorLBGRToLuv converts from LBGR to CIE Luv.
	LRGBToLuv       = 77, // ColorLRGBToLuv converts from LRGB to CIE Luv.
	LabToLBGR       = 78, // ColorLabToLBGR converts from CIE Lab to LBGR.
	LabToLRGB       = 79, // ColorLabToLRGB converts from CIE Lab to LRGB.
	LuvToLBGR       = 80, // ColorLuvToLBGR converts from CIE Luv to LBGR.
	LuvToLRGB       = 81, // ColorLuvToLRGB converts from CIE Luv to LRGB.
	BGRToYUV        = 82, // ColorBGRToYUV converts from BGR to YUV.
	RGBToYUV        = 83, // ColorRGBToYUV converts from RGB to YUV.
	YUVToBGR        = 84, // ColorYUVToBGR converts from YUV to BGR.
	YUVToRGB        = 85, // ColorYUVToRGB converts from YUV to RGB.
	YUVToRGBNV12    = 90, // ColorYUVToRGBNV12 converts from YUV 4:2:0 to RGB NV12.
	YUVToBGRNV12    = 91, // ColorYUVToBGRNV12 converts from YUV 4:2:0 to BGR NV12.
	YUVToRGBNV21    = 92, // ColorYUVToRGBNV21 converts from YUV 4:2:0 to RGB NV21.
	YUVToBGRNV21    = 93, // ColorYUVToBGRNV21 converts from YUV 4:2:0 to BGR NV21.
	YUVToRGBANV12   = 94, // ColorYUVToRGBANV12 converts from YUV 4:2:0 to RGBA NV12.
	YUVToBGRANV12   = 95, // ColorYUVToBGRANV12 converts from YUV 4:2:0 to BGRA NV12.
	YUVToRGBANV21   = 96, // ColorYUVToRGBANV21 converts from YUV 4:2:0 to RGBA NV21.
	YUVToBGRANV21   = 97, // ColorYUVToBGRANV21 converts from YUV 4:2:0 to BGRA NV21.
	YUVToRGBYV12    = 98,
	YUVToBGRYV12    = 99,
	YUVToRGBIYUV    = 100,
	YUVToBGRIYUV    = 101,
	YUVToRGBAYV12   = 102,
	YUVToBGRAYV12   = 103,
	YUVToRGBAIYUV   = 104,
	YUVToBGRAIYUV   = 105,
	YUVToGRAY420    = 106,
	// YUV 4:2:2 family to RGB
	YUVToRGBUYVY    = 107,
	YUVToBGRUYVY    = 108,
	YUVToRGBAUYVY   = 111,
	YUVToBGRAUYVY   = 112,
	YUVToRGBYUY2    = 115,
	YUVToBGRYUY2    = 116,
	YUVToRGBYVYU    = 117,
	YUVToBGRYVYU    = 118,
	YUVToRGBAYUY2   = 119,
	YUVToBGRAYUY2   = 120,
	YUVToRGBAYVYU   = 121,
	YUVToBGRAYVYU   = 122,
	YUVToGRAYUYVY   = 123,
	YUVToGRAYYUY2   = 124,
	// alpha premultiplication
	RGBATomRGBA     = 125,
	mRGBAToRGBA     = 126,
	// RGB to YUV 4:2:0 family
	RGBToYUVI420    = 127,
	BGRToYUVI420    = 128,
	RGBAToYUVI420   = 129,
	BGRAToYUVI420   = 130,
	RGBToYUVYV12    = 131,
	BGRToYUVYV12    = 132,
	RGBAToYUVYV12   = 133,
	BGRAToYUVYV12   = 134,
	// Demosaicing
	BayerBGToBGR    = 46,
	BayerGBToBGR    = 47,
	BayerRGToBGR    = 48,
	BayerGRToBGR    = 49,
	BayerBGToRGB    = BayerRGToBGR,
	BayerGBToRGB    = BayerGRToBGR,
	BayerRGToRGB    = BayerBGToBGR,
	BayerGRToRGB    = BayerGBToBGR,
	BayerBGToGRAY   = 86,
	BayerGBToGRAY   = 87,
	BayerRGToGRAY   = 88,
	BayerGRToGRAY   = 89,
	// Demosaicing using Variable Number of Gradients
	BayerBGToBGRVNG = 62,
	BayerGBToBGRVNG = 63,
	BayerRGToBGRVNG = 64,
	BayerGRToBGRVNG = 65,
	BayerBGToRGBVNG = BayerRGToBGRVNG,
	BayerGBToRGBVNG = BayerGRToBGRVNG,
	BayerRGToRGBVNG = BayerBGToBGRVNG,
	BayerGRToRGBVNG = BayerGBToBGRVNG,
	// Edge-Aware Demosaicing
	BayerBGToBGREA  = 135,
	BayerGBToBGREA  = 136,
	BayerRGToBGREA  = 137,
	BayerGRToBGREA  = 138,
	BayerBGToRGBEA  = BayerRGToBGREA,
	BayerGBToRGBEA  = BayerGRToBGREA,
	BayerRGToRGBEA  = BayerBGToBGREA,
	BayerGRToRGBEA  = BayerGBToBGREA,
	// Demosaicing with alpha channel
	BayerBGToBGRA   = 139,
	BayerGBToBGRA   = 140,
	BayerRGToBGRA   = 141,
	BayerGRToBGRA   = 142,
	BayerBGToRGBA   = BayerRGToBGRA,
	BayerGBToRGBA   = BayerGRToBGRA,
	BayerRGToRGBA   = BayerBGToBGRA,
	BayerGRToRGBA   = BayerGBToBGRA,
	COLORCVTMAX     = 143,
}

CLAHE :: distinct rawptr

@(default_calling_convention = "c")
foreign cv {
	ArcLength :: proc(curve: PointVector, is_closed: c.bool) -> c.double ---
	ApproxPolyDP :: proc(curve: PointVector, epsilon: c.double, closed: c.bool) -> PointVector ---
	CvtColor :: proc(src, dst: Mat, code: c.int) ---
	EqualizeHist :: proc(src, dst: Mat) ---
	CalcHist :: proc(mats: Mats, chans: IntVector, mask, hist: Mat, sz: IntVector, rng: FloatVector, acc: c.bool) ---
	CalcBackProject :: proc(mats: Mats, chans: IntVector, hist, backProject: Mat, rng: FloatVector, uniform: c.bool) ---
	CompareHist :: proc(hist1, hist2: Mat, method: c.int) -> c.double ---
	EMD :: proc(sig1, sig2: Mat, distType: c.int) -> c.float ---
	ConvexHull :: proc(points: PointVector, hull: Mat, clockwise, returnPoints: c.bool) ---
	ConvexityDefects :: proc(points: PointVector, hull, result: Mat) ---
	BilateralFilter :: proc(src, dst: Mat, d: c.int, sc, ss: c.double) ---
	Blur :: proc(src, dst: Mat, ps: Size) ---
	BoxFilter :: proc(src, dst: Mat, ddepth: c.int, ps: Size) ---
	SqBoxFilter :: proc(src, dst: Mat, ddepth: c.int, ps: Size) ---
	Dilate :: proc(src, dst, kernel: Mat) ---
	DilateWithParams :: proc(src, dst, kernel: Mat, anchor: Point, iterations, borderType: c.int, borderValue: Scalar) ---
	DistanceTransform :: proc(src, dst, labels: Mat, distanceType, maskSize, labelType: c.int) ---
	Erode :: proc(src, dst, kernel: Mat) ---
	ErodeWithParams :: proc(src, dst, kernel: Mat, anchor: Point, iterations, borderType: c.int) ---
	ErodeWithParamsAndBorderValue :: proc(src, dst, kernel: Mat, anchor: Point, iterations, borderType: c.int, borderValue: Scalar) ---
	MatchTemplate :: proc(image, templ, result: Mat, method: c.int, mask: Mat) ---
	Moments :: proc(src: Mat, binaryImage: c.bool) -> Moment ---
	PyrDown :: proc(src: Mat, dst: Mat, dstsize: Size, borderType: c.int) ---
	PyrUp :: proc(src, dst: Mat, dstsize: Size, borderType: c.int) ---
	BoundingRect :: proc(pts: PointVector) -> Rect ---
	BoxPoints :: proc(rect: RotatedRect, boxPts: Mat) ---
	BoxPoints2f :: proc(rect: RotatedRect2f, boxPts: Mat) ---
	ContourArea :: proc(pts: PointVector) -> c.double ---
	MinAreaRect :: proc(pts: PointVector) -> RotatedRect ---
	MinAreaRect2f :: proc(pts: PointVector) -> RotatedRect2f ---
	FitEllipse :: proc(pts: PointVector) -> RotatedRect ---
	MinEnclosingCircle :: proc(pts: PointVector, center: ^Point2f, radius: ^c.float) ---
	FindContours :: proc(src, hierarchy: Mat, mode, method: c.int) -> PointsVector ---
	PointPolygonTest :: proc(pts: PointVector, pt: Point, measureDist: c.bool) -> c.double ---
	ConnectedComponents :: proc(src, dst: Mat, connectivity, ltype, ccltype: c.int) -> c.int ---
	ConnectedComponentsWithStats :: proc(src: Mat, labels: Mat, stats: Mat, centroids: Mat, connectivity: c.int, ltype: c.int, ccltype: c.int) -> c.int ---
	GaussianBlur :: proc(src: Mat, dst: Mat, ps: Size, sX: c.double, sY: c.double, bt: c.int) ---
	GetGaussianKernel :: proc(ksize: c.int, sigma: c.double, ktype: c.int) -> Mat ---
	Laplacian :: proc(src: Mat, dst: Mat, dDepth: c.int, kSize: c.int, scale: c.double, delta: c.double, borderType: c.int) ---
	Scharr :: proc(src: Mat, dst: Mat, dDepth: c.int, dx: c.int, dy: c.int, scale: c.double, delta: c.double, borderType: c.int) ---
	GetStructuringElement :: proc(shape: c.int, ksize: Size) -> Mat ---
	MorphologyDefaultBorderValue :: proc() -> Scalar ---
	MorphologyEx :: proc(src: Mat, dst: Mat, op: c.int, kernel: Mat) ---
	MorphologyExWithParams :: proc(src: Mat, dst: Mat, op: c.int, kernel: Mat, pt: Point, iterations: c.int, borderType: c.int) ---
	MedianBlur :: proc(src: Mat, dst: Mat, ksize: c.int) ---
	Canny :: proc(src: Mat, edges: Mat, t1: c.double, t2: c.double) ---
	CornerSubPix :: proc(img: Mat, corners: Mat, winSize: Size, zeroZone: Size, criteria: TermCriteria) ---
	GoodFeaturesToTrack :: proc(img: Mat, corners: Mat, maxCorners: c.int, quality: c.double, minDist: c.double) ---
	GrabCut :: proc(img: Mat, mask: Mat, rect: Rect, bgdModel: Mat, fgdModel: Mat, iterCount: c.int, mode: c.int) ---
	HoughCircles :: proc(src: Mat, circles: Mat, method: c.int, dp: c.double, minDist: c.double) ---
	HoughCirclesWithParams :: proc(src: Mat, circles: Mat, method: c.int, dp: c.double, minDist: c.double, param1: c.double, param2: c.double, minRadius: c.int, maxRadius: c.int) ---
	HoughLines :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int) ---
	HoughLinesP :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int) ---
	HoughLinesPWithParams :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int, minLineLength: c.double, maxLineGap: c.double) ---
	HoughLinesPointSet :: proc(points: Mat, lines: Mat, lines_max: c.int, threshold: c.int, min_rho: c.double, max_rho: c.double, rho_step: c.double, min_theta: c.double, max_theta: c.double, theta_step: c.double) ---
	Integral :: proc(src: Mat, sum: Mat, sqsum: Mat, tilted: Mat) ---
	Threshold :: proc(src: Mat, dst: Mat, thresh: c.double, maxvalue: c.double, typ: c.int) -> c.double ---
	AdaptiveThreshold :: proc(src: Mat, dst: Mat, maxValue: c.double, adaptiveTyp: c.int, typ: c.int, blockSize: c.int, c: c.double) ---
	ArrowedLine :: proc(img: Mat, pt1: Point, pt2: Point, color: Scalar, thickness: c.int) ---
	Circle :: proc(img: Mat, center: Point, radius: c.int, color: Scalar, thickness: c.int) ---
	CircleWithParams :: proc(img: Mat, center: Point, radius: c.int, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	Ellipse :: proc(img: Mat, center: Point, axes: Point, angle: c.double, startAngle: c.double, endAngle: c.double, color: Scalar, thickness: c.int) ---
	EllipseWithParams :: proc(img: Mat, center: Point, axes: Point, angle: c.double, startAngle: c.double, endAngle: c.double, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	Line :: proc(img: Mat, pt1: Point, pt2: Point, color: Scalar, thickness: c.int) ---
	Rectangle :: proc(img: Mat, rect: Rect, color: Scalar, thickness: c.int) ---
	RectangleWithParams :: proc(img: Mat, rect: Rect, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	FillPoly :: proc(img: Mat, points: PointsVector, color: Scalar) ---
	FillPolyWithParams :: proc(img: Mat, points: PointsVector, color: Scalar, lineType: c.int, shift: c.int, offset: Point) ---
	Polylines :: proc(img: Mat, points: PointsVector, isClosed: c.bool, color: Scalar, thickness: c.int) ---
	GetTextSize :: proc(text: cstring, fontFace: c.int, fontScale: c.double, thickness: c.int) -> Size ---
	GetTextSizeWithBaseline :: proc(text: cstring, fontFace: c.int, fontScale: c.double, thickness: c.int, baseline: ^c.int) -> Size ---
	PutText :: proc(img: Mat, text: cstring, org: Point, fontFace: c.int, fontScale: c.double, color: Scalar, thickness: c.int) ---
	PutTextWithParams :: proc(img: Mat, text: cstring, org: Point, fontFace: c.int, fontScale: c.double, color: Scalar, thickness: c.int, lineType: c.int, bottomLeftOrigin: c.bool) ---
	Resize :: proc(src: Mat, dst: Mat, sz: Size, fx: c.double, fy: c.double, interp: c.int) ---
	GetRectSubPix :: proc(src: Mat, patchSize: Size, center: Point, dst: Mat) ---
	GetRotationMatrix2D :: proc(center: Point, angle: c.double, scale: c.double) -> Mat ---
	WarpAffine :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: Size) ---
	WarpAffineWithParams :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: Size, flags: c.int, borderMode: c.int, borderValue: Scalar) ---
	WarpPerspective :: proc(src: Mat, dst: Mat, m: Mat, dsize: Size) ---
	WarpPerspectiveWithParams :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: Size, flags: c.int, borderMode: c.int, borderValue: Scalar) ---
	Watershed :: proc(image: Mat, markers: Mat) ---
	ApplyColorMap :: proc(src: Mat, dst: Mat, colormap: c.int) ---
	ApplyCustomColorMap :: proc(src: Mat, dst: Mat, colormap: Mat) ---
	GetPerspectiveTransform :: proc(src: PointVector, dst: PointVector) -> Mat ---
	GetPerspectiveTransform2f :: proc(src: Point2fVector, dst: Point2fVector) -> Mat ---
	GetAffineTransform :: proc(src: PointVector, dst: PointVector) -> Mat ---
	GetAffineTransform2f :: proc(src: Point2fVector, dst: Point2fVector) -> Mat ---
	FindHomography :: proc(src: Mat, dst: Mat, method: c.int, ransacReprojThreshold: c.double, mask: Mat, maxIters: c.int, confidence: c.double) -> Mat ---
	DrawContours :: proc(src: Mat, contours: PointsVector, contourIdx: c.int, color: Scalar, thickness: c.int) ---
	DrawContoursWithParams :: proc(src: Mat, contours: PointsVector, contourIdx: c.int, color: Scalar, thickness: c.int, lineType: c.int, hierarchy: Mat, maxLevel: c.int, offset: Point) ---
	Sobel :: proc(src: Mat, dst: Mat, ddepth: c.int, dx: c.int, dy: c.int, ksize: c.int, scale: c.double, delta: c.double, borderType: c.int) ---
	SpatialGradient :: proc(src: Mat, dx: Mat, dy: Mat, ksize: c.int, borderType: c.int) ---
	Remap :: proc(src: Mat, dst: Mat, map1: Mat, map2: Mat, interpolation: c.int, borderMode: c.int, borderValue: Scalar) ---
	Filter2D :: proc(src: Mat, dst: Mat, ddepth: c.int, kernel: Mat, anchor: Point, delta: c.double, borderType: c.int) ---
	SepFilter2D :: proc(src: Mat, dst: Mat, ddepth: c.int, kernelX: Mat, kernelY: Mat, anchor: Point, delta: c.double, borderType: c.int) ---
	LogPolar :: proc(src: Mat, dst: Mat, center: Point, m: c.double, flags: c.int) ---
	FitLine :: proc(pts: PointVector, line: Mat, distType: c.int, param: c.double, reps: c.double, aeps: c.double) ---
	LinearPolar :: proc(src: Mat, dst: Mat, center: Point, maxRadius: c.double, flags: c.int) ---
	MatchShapes :: proc(contour1: PointVector, contour2: PointVector, method: c.int, parameter: c.double) -> c.double ---
	ClipLine :: proc(imgSize: Size, pt1: Point, pt2: Point) -> c.bool ---
	CLAHE_Create :: proc() -> CLAHE ---
	CLAHE_CreateWithParams :: proc(clipLimit: c.double, tileGridSize: Size) -> CLAHE ---
	CLAHE_Close :: proc(c: CLAHE) ---
	CLAHE_Apply :: proc(c: CLAHE, src, dst: Mat) ---
	InvertAffineTransform :: proc(src: Mat, dst: Mat) ---
	PhaseCorrelate :: proc(src1: Mat, src2: Mat, window: Mat, response: ^c.double) -> Point2f ---
	CreateHanningWindow :: proc(dst: Mat, size: Size, typ: c.int) ---
	Mat_Accumulate :: proc(src: Mat, dst: Mat) ---
	Mat_AccumulateWithMask :: proc(src: Mat, dst: Mat, mask: Mat) ---
	Mat_AccumulateSquare :: proc(src: Mat, dst: Mat) ---
	Mat_AccumulateSquareWithMask :: proc(src: Mat, dst: Mat, mask: Mat) ---
	Mat_AccumulateProduct :: proc(src1: Mat, src2: Mat, dst: Mat) ---
	Mat_AccumulateProductWithMask :: proc(src1: Mat, src2: Mat, dst: Mat, mask: Mat) ---
	Mat_AccumulatedWeighted :: proc(src: Mat, dst: Mat, alpha: c.double) ---
	Mat_AccumulatedWeightedWithMask :: proc(src: Mat, dst: Mat, alpha: c.double, mask: Mat) ---
}

cvt_color :: proc(src: Mat, code: ColorConversionCode) -> (dst: Mat) {
	dst = new_mat()
	CvtColor(src, dst, c.int(code))
	return
}
