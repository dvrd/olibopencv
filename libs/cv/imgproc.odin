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

// arc_length calculates a contour perimeter or a curve length.
//
// For further details, please see:
//
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga8d26483c636be6b35c3ec6335798a47c
arc_length :: proc(curve: PointVector, is_closed: bool) -> f64 {
	return cast(f64)ArcLength(curve, c.bool(is_closed))
}

// approx_poly_dp approximates a polygonal curve(s) with the specified precision.
//
// For further details, please see:
//
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga0012a5fdaea70b8a9970165d98722b4c
approx_poly_dp :: proc(curve: PointVector, epsilon: f64, closed: bool) -> PointVector {
	return ApproxPolyDP(curve, c.double(epsilon), c.bool(closed))
}

// convex_hull finds the convex hull of a point set.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga014b28e56cb8854c0de4a211cb2be656
convex_hull :: proc(points: PointVector, hull: Mat, clockwise, returnPoints: bool) {
	ConvexHull(points, hull, c.bool(clockwise), c.bool(returnPoints))
}

// convexity_defects finds the convexity defects of a contour.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gada4437098113fd8683c932e0567f47ba
convexity_defects :: proc(contour: PointVector, hull, result: Mat) {
	ConvexityDefects(contour, hull, result)
}

// cvt_color converts an image from one color space to another.
// It converts the src Mat image to the dst Mat using the
// code param containing the desired ColorConversionCode color space.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga4e0972be5de079fed4e3a10e24ef5ef0
cvt_color :: proc(src: Mat, code: ColorConversionCode) -> (dst: Mat) {
	dst = new_mat()
	CvtColor(src, dst, c.int(code))
	return
}

// equalize_hist normalizes the brightness and increases the contrast of the image.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/dc7/group__imgproc__hist.html#ga7e54091f0c937d49bf84152a16f76d6e
equalize_hist :: proc(src: Mat) -> (dst: Mat) {
	dst = new_mat()
	EqualizeHist(src, dst)
	return
}

// calc_hist Calculates a histogram of a set of images
//
// For futher details, please see:
// https://docs.opencv.org/master/d6/dc7/group__imgproc__hist.html#ga6ca1876785483836f72a77ced8ea759a
calc_hist :: proc(mats: Mats, chans: []int, mask, hist: Mat, sz: []int, rng: []f32, acc: bool) {
	c_chans := IntVector{cast([^]c.int)&chans[0], cast(c.int)len(chans)}
	c_sz := IntVector{cast([^]c.int)&sz[0], cast(c.int)len(sz)}
	c_rng := FloatVector{cast([^]c.float)&rng[0], cast(c.int)len(rng)}
	CalcHist(mats, c_chans, mask, hist, c_sz, c_rng, c.bool(acc))
}

// calc_back_project calculates the back projection of a histogram.
//
// For futher details, please see:
// https://docs.opencv.org/3.4/d6/dc7/group__imgproc__hist.html#ga3a0af640716b456c3d14af8aee12e3ca
calc_back_project :: proc(
	mats: Mats,
	chans: []int,
	hist, backProject: Mat,
	rng: []f32,
	uniform: bool,
) {
	c_chans := IntVector{cast([^]c.int)&chans[0], cast(c.int)len(chans)}
	c_rng := FloatVector{cast([^]c.float)&rng[0], cast(c.int)len(rng)}

	CalcBackProject(mats, c_chans, hist, backProject, c_rng, c.bool(uniform))
}

// HistCompMethod is the method for Histogram comparison
// For more information, see https://docs.opencv.org/master/d6/dc7/group__imgproc__hist.html#ga994f53817d621e2e4228fc646342d386
HistCmpMethod :: enum int {
	Correl       = 0, // HistCmpCorrel calculates the Correlation
	ChiSqr       = 1, // HistCmpChiSqr calculates the Chi-Square
	Intersect    = 2, // HistCmpIntersect calculates the Intersection
	Bhattacharya = 3, // HistCmpBhattacharya applies the HistCmpBhattacharya by calculating the Bhattacharya distance.
	Hellinger    = Bhattacharya, // HistCmpHellinger applies the HistCmpBhattacharya comparison. It is a synonym to HistCmpBhattacharya.
	ChiSqrAlt    = 4, // HistCmpChiSqrAlt applies the Alternative Chi-Square (regularly used for texture comparsion).
	KlDiv        = 5, // HistCmpKlDiv applies the Kullback-Liebler divergence comparison.
}

compare_hist :: proc(hist1, hist2: Mat, method: HistCmpMethod) -> f64 {
	return cast(f64)CompareHist(hist1, hist2, c.int(method))
}

// DistanceTypes types for Distance Transform and M-estimatorss
//
// For further details, please see:
// https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#gaa2bfbebbc5c320526897996aafa1d8eb
DistanceTypes :: enum {
	User,
	L1,
	L2,
	C,
	L12,
	Fair,
	Welsch,
	Huber,
}


// emd Computes the "minimal work" distance between two weighted point configurations.
//
// For further details, please see:
// https://docs.opencv.org/4.x/d6/dc7/group__imgproc__hist.html#ga902b8e60cc7075c8947345489221e0e0
emd :: proc(signature1, signature2: Mat, typ: DistanceTypes) -> f32 {
	return cast(f32)EMD(signature1, signature2, c.int(typ))
}

// clip_line clips the line against the image rectangle.
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf483cb46ad6b049bc35ec67052ef1c2c
clip_line :: proc(imgSize, pt1, pt2: [2]int) -> bool {
	pSize := Size{c.int(imgSize.x), c.int(imgSize.y)}
	rPt1 := Point{c.int(pt1.x), c.int(pt1.y)}
	rPt2 := Point{c.int(pt2.x), c.int(pt2.y)}
	return bool(ClipLine(pSize, rPt1, rPt2))
}

// bilateral_filter applies a bilateral filter to an image.
//
// Bilateral filtering is described here:
// http://www.dai.ed.ac.uk/CVonline/LOCAL_COPIES/MANDUCHI1/Bilateral_Filtering.html
//
// BilateralFilter can reduce unwanted noise very well while keeping edges
// fairly sharp. However, it is very slow compared to most filters.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga9d7064d478c95d60003cf839430737ed
bilateral_filter :: proc(src: Mat, diameter: int, sigmaColor: f64, sigmaSpace: f64) -> (dst: Mat) {
	dst = new_mat()
	BilateralFilter(src, dst, c.int(diameter), c.double(sigmaColor), c.double(sigmaSpace))
	return
}

// blur blurs an image Mat using a normalized box filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga8c45db9afe636703801b0b2e440fce37
blur :: proc(src: Mat, ksize: [2]int) -> (dst: Mat) {
	dst = new_mat()
	pSize := Size{c.int(ksize.x), c.int(ksize.y)}
	Blur(src, dst, pSize)
	return
}

// box_filter blurs an image using the box filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gad533230ebf2d42509547d514f7d3fbc3
box_filter :: proc(src: Mat, depth: int, ksize: [2]int) -> (dst: Mat) {
	dst = new_mat()
	pSize := Size{c.int(ksize.x), c.int(ksize.y)}
	BoxFilter(src, dst, c.int(depth), pSize)
	return
}

// sq_box_filter calculates the normalized sum of squares of the pixel values overlapping the filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga045028184a9ef65d7d2579e5c4bff6c0
sq_box_filter :: proc(src: Mat, depth: int, ksize: [2]int) -> (dst: Mat) {
	dst = new_mat()
	pSize := Size{c.int(ksize.x), c.int(ksize.y)}
	SqBoxFilter(src, dst, c.int(depth), pSize)
	return
}

// dilate dilates an image by using a specific structuring element.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga4ff0f3318642c4f469d0e11f242f3b6c
dilate :: proc(src, kernel: Mat) -> (dst: Mat) {
	dst = new_mat()
	Dilate(src, dst, kernel)
	return
}

RGBA :: distinct [4]byte

// BorderType type of border.
BorderType :: enum {
	Constant    = 0, // BorderConstant border type
	Replicate   = 1, // BorderReplicate border type
	Reflect     = 2, // BorderReflect border type
	Wrap        = 3, // BorderWrap border type
	Reflect101  = 4, // BorderReflect101 border type
	Transparent = 5, // BorderTransparent border type
	Default     = Reflect101, // BorderDefault border type
	Isolated    = 16, // BorderIsolated border type
}


// dilate_with_params dilates an image by using a specific structuring element.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga4ff0f3318642c4f469d0e11f242f3b6c
dilate_with_params :: proc(
	src, kernel: Mat,
	anchor: [2]int,
	iterations, borderType: BorderType,
	borderValue: RGBA,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	cAnchor := Point{c.int(anchor.x), c.int(anchor.y)}
	bv := Scalar {
		c.double(borderValue.b),
		c.double(borderValue.g),
		c.double(borderValue.r),
		c.double(borderValue.a),
	}
	DilateWithParams(src, dst, kernel, cAnchor, c.int(iterations), c.int(borderType), bv)
	return
}

// DistanceTransformLabelTypes are the types of the DistanceTransform algorithm flag
DistanceTransformLabelTypes :: enum {
	// CComp assigns the same label to each connected component of zeros in the source image
	// (as well as all the non-zero pixels closest to the connected component).
	CComp = 0,
	// Pixel assigns its own label to each zero pixel (and all the non-zero pixels closest to it).
	Pixel,
}

// DistanceTransformMasks are the marsk sizes for distance transform
DistanceTransformMasks :: enum {
	Mask3, // Mask3 is a mask of size 3
	Mask5, // Mask5 is a mask of size 3
	MaskPrecise, // MaskPrecise is not currently supported
}

// distance_transform Calculates the distance to the closest zero pixel for each pixel of the source image.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga8a0b7fdfcb7a13dde018988ba3a43042
distance_transform :: proc(
	src, labels: Mat,
	distType: DistanceTypes,
	maskSize: DistanceTransformMasks,
	labelType: DistanceTransformLabelTypes,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	DistanceTransform(src, dst, labels, c.int(distType), c.int(maskSize), c.int(labelType))
	return
}

// Erode erodes an image by using a specific structuring element.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaeb1e0c1033e3f6b891a25d0511362aeb
erode :: proc(src, kernel: Mat) -> (dst: Mat) {
	dst = new_mat()
	Erode(src, dst, kernel)
	return
}

// ErodeWithParams erodes an image by using a specific structuring element.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaeb1e0c1033e3f6b891a25d0511362aeb
erode_with_params :: proc(
	src, kernel: Mat,
	anchor: [2]int,
	iterations, borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	cAnchor := Point{c.int(anchor.x), c.int(anchor.y)}
	ErodeWithParams(src, dst, kernel, cAnchor, c.int(iterations), c.int(borderType))
	return
}

// // ErodeWithParamsAndBorderValue erodes an image by using a specific structuring
// // element. Same as ErodeWithParams but requires an additional borderValue
// // parameter.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaeb1e0c1033e3f6b891a25d0511362aeb
// ErodeWithParamsAndBorderValue(src Mat, dst *Mat, kernel Mat, anchor image.Point, iterations, borderType int, borderValue Scalar) {
// 	cAnchor := Point{
// 		x: c.int(anchor.X),
// 		y: c.int(anchor.Y),
// 	}
//
// 	bv := Scalar{
// 		val1: c.double(borderValue.Val1),
// 		val2: c.double(borderValue.Val2),
// 		val3: c.double(borderValue.Val3),
// 		val4: c.double(borderValue.Val4),
// 	}
//
// 	C.ErodeWithParamsAndBorderValue(src, dst, kernel, cAnchor, c.int(iterations), C.int(borderType), bv)
// }
//
// // RetrievalMode is the mode of the contour retrieval algorithm.
// type RetrievalMode int
//
// const (
// 	// RetrievalExternal retrieves only the extreme outer contours.
// 	// It sets `hierarchy[i][2]=hierarchy[i][3]=-1` for all the contours.
// 	RetrievalExternal RetrievalMode = 0
//
// 	// RetrievalList retrieves all of the contours without establishing
// 	// any hierarchical relationships.
// 	RetrievalList RetrievalMode = 1
//
// 	// RetrievalCComp retrieves all of the contours and organizes them into
// 	// a two-level hierarchy. At the top level, there are external boundaries
// 	// of the components. At the second level, there are boundaries of the holes.
// 	// If there is another contour inside a hole of a connected component, it
// 	// is still put at the top level.
// 	RetrievalCComp RetrievalMode = 2
//
// 	// RetrievalTree retrieves all of the contours and reconstructs a full
// 	// hierarchy of nested contours.
// 	RetrievalTree RetrievalMode = 3
//
// 	// RetrievalFloodfill lacks a description in the original header.
// 	RetrievalFloodfill RetrievalMode = 4
// )
//
// // ContourApproximationMode is the mode of the contour approximation algorithm.
// type ContourApproximationMode int
//
// const (
// 	// ChainApproxNone stores absolutely all the contour points. That is,
// 	// any 2 subsequent points (x1,y1) and (x2,y2) of the contour will be
// 	// either horizontal, vertical or diagonal neighbors, that is,
// 	// max(abs(x1-x2),abs(y2-y1))==1.
// 	ChainApproxNone ContourApproximationMode = 1
//
// 	// ChainApproxSimple compresses horizontal, vertical, and diagonal segments
// 	// and leaves only their end points.
// 	// For example, an up-right rectangular contour is encoded with 4 points.
// 	ChainApproxSimple ContourApproximationMode = 2
//
// 	// ChainApproxTC89L1 applies one of the flavors of the Teh-Chin chain
// 	// approximation algorithms.
// 	ChainApproxTC89L1 ContourApproximationMode = 3
//
// 	// ChainApproxTC89KCOS applies one of the flavors of the Teh-Chin chain
// 	// approximation algorithms.
// 	ChainApproxTC89KCOS ContourApproximationMode = 4
// )
//
// // BoundingRect calculates the up-right bounding rectangle of a point set.
// //
// // For further details, please see:
// // https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gacb413ddce8e48ff3ca61ed7cf626a366
// BoundingRect(contour PointVector) image.Rectangle {
// 	r := C.BoundingRect(contour.p)
// 	rect := image.Rect(int(r.x), int(r.y), int(r.x+r.width), int(r.y+r.height))
// 	return rect
// }
//
// // BoxPoints finds the four vertices of a rotated rect. Useful to draw the rotated rectangle.
// //
// // For further Details, please see:
// // https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gaf78d467e024b4d7936cf9397185d2f5c
// BoxPoints(rect RotatedRect, pts *Mat) {
// 	rPoints := toCPoints(rect.Points)
//
// 	rRect := Rect{
// 		x:      c.int(rect.BoundingRect.Min.X),
// 		y:      c.int(rect.BoundingRect.Min.Y),
// 		width:  c.int(rect.BoundingRect.Max.X - rect.BoundingRect.Min.X),
// 		height: c.int(rect.BoundingRect.Max.Y - rect.BoundingRect.Min.Y),
// 	}
//
// 	rCenter := Point{
// 		x: c.int(rect.Center.X),
// 		y: c.int(rect.Center.Y),
// 	}
//
// 	rSize := Size{
// 		width:  c.int(rect.Width),
// 		height: c.int(rect.Height),
// 	}
//
// 	r := RotatedRect{
// 		pts:          rPoints,
// 		boundingRect: rRect,
// 		center:       rCenter,
// 		size:         rSize,
// 		angle:        c.double(rect.Angle),
// 	}
//
// 	C.BoxPoints(r, pts.p)
// }
//
// // BoxPoints finds the four vertices of a rotated rect. Useful to draw the rotated rectangle.
// //
// // For further Details, please see:
// // https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gaf78d467e024b4d7936cf9397185d2f5c
// BoxPoints2f(rect RotatedRect2f, pts *Mat) {
// 	rPoints := toCPoints2f(rect.Points)
//
// 	rRect := Rect{
// 		x:      c.int(rect.BoundingRect.Min.X),
// 		y:      c.int(rect.BoundingRect.Min.Y),
// 		width:  c.int(rect.BoundingRect.Max.X - rect.BoundingRect.Min.X),
// 		height: c.int(rect.BoundingRect.Max.Y - rect.BoundingRect.Min.Y),
// 	}
//
// 	rCenter := Point2f{
// 		x: C.float(rect.Center.X),
// 		y: C.float(rect.Center.Y),
// 	}
//
// 	rSize := Size2f{
// 		width:  C.float(rect.Width),
// 		height: C.float(rect.Height),
// 	}
//
// 	r := RotatedRect2f{
// 		pts:          rPoints,
// 		boundingRect: rRect,
// 		center:       rCenter,
// 		size:         rSize,
// 		angle:        c.double(rect.Angle),
// 	}
//
// 	C.BoxPoints2f(r, pts.p)
// }
//
// // ContourArea calculates a contour area.
// //
// // For further details, please see:
// // https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#ga2c759ed9f497d4a618048a2f56dc97f1
// ContourArea(contour PointVector) f64 {
// 	result := C.ContourArea(contour.p)
// 	return f64(result)
// }
//
// type RotatedRect struct {
// 	Points       []image.Point
// 	BoundingRect image.Rectangle
// 	Center       image.Point
// 	Width        int
// 	Height       int
// 	Angle        f64
// }
//
// type RotatedRect2f struct {
// 	Points       []Point2f
// 	BoundingRect image.Rectangle
// 	Center       Point2f
// 	Width        f32
// 	Height       f32
// 	Angle        f64
// }
//
// // toPoints converts C.Contour to []image.Points
// toPoints(points C.Contour) []image.Point {
// 	pArray := points.points
// 	pLength := int(points.length)
//
// 	pHdr := reflect.SliceHeader{
// 		Data: uintptr(unsafe.Pointer(pArray)),
// 		Len:  pLength,
// 		Cap:  pLength,
// 	}
// 	sPoints := *(*[]C.Point)(unsafe.Pointer(&pHdr))
//
// 	points4 := make([]image.Point, pLength)
// 	for j, pt := range sPoints {
// 		points4[j] = image.Pt(int(pt.x), int(pt.y))
// 	}
// 	return points4
// }
//
// // toPoints2f converts C.Contour2f to []Point2f
// toPoints2f(points C.Contour2f) []Point2f {
// 	pArray := points.points
// 	pLength := int(points.length)
//
// 	pHdr := reflect.SliceHeader{
// 		Data: uintptr(unsafe.Pointer(pArray)),
// 		Len:  pLength,
// 		Cap:  pLength,
// 	}
// 	sPoints := *(*[]C.Point)(unsafe.Pointer(&pHdr))
//
// 	points4 := make([]Point2f, pLength)
// 	for j, pt := range sPoints {
// 		points4[j] = NewPoint2f(f32(pt.x), float32(pt.y))
// 	}
// 	return points4
// }
//
// // MinAreaRect finds a rotated rectangle of the minimum area enclosing the input 2D point set.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga3d476a3417130ae5154aea421ca7ead9
// MinAreaRect(points PointVector) RotatedRect {
// 	result := C.MinAreaRect(points.p)
// 	defer C.Points_Close(result.pts)
//
// 	return RotatedRect{
// 		Points:       toPoints(result.pts),
// 		BoundingRect: image.Rect(int(result.boundingRect.x), int(result.boundingRect.y), int(result.boundingRect.x)+int(result.boundingRect.width), int(result.boundingRect.y)+int(result.boundingRect.height)),
// 		Center:       image.Pt(int(result.center.x), int(result.center.y)),
// 		Width:        int(result.size.width),
// 		Height:       int(result.size.height),
// 		Angle:        f64(result.angle),
// 	}
// }
//
// // MinAreaRect finds a rotated rectangle of the minimum area enclosing the input 2D point set.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga3d476a3417130ae5154aea421ca7ead9
// MinAreaRect2f(points PointVector) RotatedRect2f {
// 	result := C.MinAreaRect2f(points.p)
// 	defer C.Points2f_Close(result.pts)
//
// 	return RotatedRect2f{
// 		Points:       toPoints2f(result.pts),
// 		BoundingRect: image.Rect(int(result.boundingRect.x), int(result.boundingRect.y), int(result.boundingRect.x)+int(result.boundingRect.width), int(result.boundingRect.y)+int(result.boundingRect.height)),
// 		Center:       NewPoint2f(f32(result.center.x), float32(result.center.y)),
// 		Width:        f32(result.size.width),
// 		Height:       f32(result.size.height),
// 		Angle:        f64(result.angle),
// 	}
// }
//
// // FitEllipse Fits an ellipse around a set of 2D points.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaf259efaad93098103d6c27b9e4900ffa
// FitEllipse(pts PointVector) RotatedRect {
// 	cRect := C.FitEllipse(pts.p)
// 	defer C.Points_Close(cRect.pts)
//
// 	return RotatedRect{
// 		Points:       toPoints(cRect.pts),
// 		BoundingRect: image.Rect(int(cRect.boundingRect.x), int(cRect.boundingRect.y), int(cRect.boundingRect.x)+int(cRect.boundingRect.width), int(cRect.boundingRect.y)+int(cRect.boundingRect.height)),
// 		Center:       image.Pt(int(cRect.center.x), int(cRect.center.y)),
// 		Width:        int(cRect.size.width),
// 		Height:       int(cRect.size.height),
// 		Angle:        f64(cRect.angle),
// 	}
//
// }
//
// // MinEnclosingCircle finds a circle of the minimum area enclosing the input 2D point set.
// //
// // For further details, please see:
// // https://docs.opencv.org/3.4/d3/dc0/group__imgproc__shape.html#ga8ce13c24081bbc7151e9326f412190f1
// MinEnclosingCircle(pts PointVector) (x, y, radius f32) {
// 	cCenterPoint := Point2f{}
// 	var cRadius C.float
// 	C.MinEnclosingCircle(pts, &cCenterPoint, &cRadius)
// 	x, y = f32(cCenterPoint.x), float32(cCenterPoint.y)
// 	radius = f32(cRadius)
// 	return x, y, radius
// }
//
// // FindContours finds contours in a binary image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga95f5b48d01abc7c2e0732db24689837b
// FindContours(src Mat, mode RetrievalMode, method ContourApproximationMode) PointsVector {
// 	hierarchy := NewMat()
// 	defer hierarchy.Close()
// 	return FindContoursWithParams(src, &hierarchy, mode, method)
// }
//
// // FindContoursWithParams finds contours in a binary image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga17ed9f5d79ae97bd4c7cf18403e1689a
// FindContoursWithParams(src Mat, hierarchy *Mat, mode RetrievalMode, method ContourApproximationMode) PointsVector {
// 	return PointsVector{p: C.FindContours(src, hierarchy, c.int(mode), C.int(method))}
// }
//
// // PointPolygonTest performs a point-in-contour test.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga1a539e8db2135af2566103705d7a5722
// PointPolygonTest(pts PointVector, pt image.Point, measureDist bool) f64 {
// 	cp := Point{
// 		x: c.int(pt.X),
// 		y: c.int(pt.Y),
// 	}
// 	return f64(C.PointPolygonTest(pts, cp, C.bool(measureDist)))
// }
//
// // ConnectedComponentsAlgorithmType specifies the type for ConnectedComponents
// type ConnectedComponentsAlgorithmType int
//
// const (
// 	// SAUF algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity.
// 	CCL_WU ConnectedComponentsAlgorithmType = 0
//
// 	// BBDT algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity.
// 	CCL_DEFAULT ConnectedComponentsAlgorithmType = 1
//
// 	// BBDT algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity
// 	CCL_GRANA ConnectedComponentsAlgorithmType = 2
// )
//
// // ConnectedComponents computes the connected components labeled image of boolean image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaedef8c7340499ca391d459122e51bef5
// ConnectedComponents(src Mat, labels *Mat) int {
// 	return int(C.ConnectedComponents(src, labels, c.int(8), C.int(MatTypeCV32S), C.int(CCL_DEFAULT)))
// }
//
// // ConnectedComponents computes the connected components labeled image of boolean image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaedef8c7340499ca391d459122e51bef5
// ConnectedComponentsWithParams(src Mat, labels *Mat, conn int, ltype MatType,
// 	ccltype ConnectedComponentsAlgorithmType) int {
// 	return int(C.ConnectedComponents(src, labels, c.int(conn), C.int(ltype), C.int(ccltype)))
// }
//
// // ConnectedComponentsTypes are the connected components algorithm output formats
// type ConnectedComponentsTypes int
//
// const (
// 	//The leftmost (x) coordinate which is the inclusive start of the bounding box in the horizontal direction.
// 	CC_STAT_LEFT ConnectedComponentsTypes = 0
//
// 	//The topmost (y) coordinate which is the inclusive start of the bounding box in the vertical direction.
// 	CC_STAT_TOP ConnectedComponentsTypes = 1
//
// 	// The horizontal size of the bounding box.
// 	CC_STAT_WIDTH ConnectedComponentsTypes = 2
//
// 	// The vertical size of the bounding box.
// 	CC_STAT_HEIGHT ConnectedComponentsTypes = 3
//
// 	// The total area (in pixels) of the connected component.
// 	CC_STAT_AREA ConnectedComponentsTypes = 4
//
// 	CC_STAT_MAX ConnectedComponentsTypes = 5
// )
//
// // ConnectedComponentsWithStats computes the connected components labeled image of boolean
// // image and also produces a statistics output for each label.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga107a78bf7cd25dec05fb4dfc5c9e765f
// ConnectedComponentsWithStats(src Mat, labels *Mat, stats *Mat, centroids *Mat) int {
// 	return int(C.ConnectedComponentsWithStats(src, labels, stats, centroids,
// 		c.int(8), C.int(MatTypeCV32S), C.int(CCL_DEFAULT)))
// }
//
// // ConnectedComponentsWithStats computes the connected components labeled image of boolean
// // image and also produces a statistics output for each label.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga107a78bf7cd25dec05fb4dfc5c9e765f
// ConnectedComponentsWithStatsWithParams(src Mat, labels *Mat, stats *Mat, centroids *Mat,
// 	conn int, ltype MatType, ccltype ConnectedComponentsAlgorithmType) int {
// 	return int(C.ConnectedComponentsWithStats(src, labels, stats, centroids, c.int(conn),
// 		c.int(ltype), C.int(ccltype)))
// }
//
// // TemplateMatchMode is the type of the template matching operation.
// type TemplateMatchMode int
//
// const (
// 	// TmSqdiff maps to TM_SQDIFF
// 	TmSqdiff TemplateMatchMode = 0
// 	// TmSqdiffNormed maps to TM_SQDIFF_NORMED
// 	TmSqdiffNormed TemplateMatchMode = 1
// 	// TmCcorr maps to TM_CCORR
// 	TmCcorr TemplateMatchMode = 2
// 	// TmCcorrNormed maps to TM_CCORR_NORMED
// 	TmCcorrNormed TemplateMatchMode = 3
// 	// TmCcoeff maps to TM_CCOEFF
// 	TmCcoeff TemplateMatchMode = 4
// 	// TmCcoeffNormed maps to TM_CCOEFF_NORMED
// 	TmCcoeffNormed TemplateMatchMode = 5
// )
//
// // MatchTemplate compares a template against overlapped image regions.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/df/dfb/group__imgproc__object.html#ga586ebfb0a7fb604b35a23d85391329be
// MatchTemplate(image Mat, templ Mat, result *Mat, method TemplateMatchMode, mask Mat) {
// 	C.MatchTemplate(image, templ, result, c.int(method), mask.p)
// }
//
// // Moments calculates all of the moments up to the third order of a polygon
// // or rasterized shape.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga556a180f43cab22649c23ada36a8a139
// Moments(src Mat, binaryImage bool) map[string]f64 {
// 	r := C.Moments(src, C.bool(binaryImage))
//
// 	result := make(map[string]f64)
// 	result["m00"] = f64(r.m00)
// 	result["m10"] = f64(r.m10)
// 	result["m01"] = f64(r.m01)
// 	result["m20"] = f64(r.m20)
// 	result["m11"] = f64(r.m11)
// 	result["m02"] = f64(r.m02)
// 	result["m30"] = f64(r.m30)
// 	result["m21"] = f64(r.m21)
// 	result["m12"] = f64(r.m12)
// 	result["m03"] = f64(r.m03)
// 	result["mu20"] = f64(r.mu20)
// 	result["mu11"] = f64(r.mu11)
// 	result["mu02"] = f64(r.mu02)
// 	result["mu30"] = f64(r.mu30)
// 	result["mu21"] = f64(r.mu21)
// 	result["mu12"] = f64(r.mu12)
// 	result["mu03"] = f64(r.mu03)
// 	result["nu20"] = f64(r.nu20)
// 	result["nu11"] = f64(r.nu11)
// 	result["nu02"] = f64(r.nu02)
// 	result["nu30"] = f64(r.nu30)
// 	result["nu21"] = f64(r.nu21)
// 	result["nu12"] = f64(r.nu12)
// 	result["nu03"] = f64(r.nu03)
//
// 	return result
// }
//
// // PyrDown blurs an image and downsamples it.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaf9bba239dfca11654cb7f50f889fc2ff
// PyrDown(src Mat, dst *Mat, ksize image.Point, borderType BorderType) {
// 	pSize := Size{
// 		height: c.int(ksize.X),
// 		width:  c.int(ksize.Y),
// 	}
// 	C.PyrDown(src, dst, pSize, c.int(borderType))
// }
//
// // PyrUp upsamples an image and then blurs it.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gada75b59bdaaca411ed6fee10085eb784
// PyrUp(src Mat, dst *Mat, ksize image.Point, borderType BorderType) {
// 	pSize := Size{
// 		height: c.int(ksize.X),
// 		width:  c.int(ksize.Y),
// 	}
// 	C.PyrUp(src, dst, pSize, c.int(borderType))
// }
//
// // MorphologyDefaultBorder returns "magic" border value for erosion and dilation.
// // It is automatically transformed to Scalar::all(-DBL_MAX) for dilation.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga94756fad83d9d24d29c9bf478558c40a
// MorphologyDefaultBorderValue() Scalar {
// 	var scalar C.Scalar = C.MorphologyDefaultBorderValue()
// 	return NewScalar(f64(scalar.val1), float64(scalar.val2), float64(scalar.val3), float64(scalar.val4))
// }
//
// // MorphologyEx performs advanced morphological transformations.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga67493776e3ad1a3df63883829375201f
// MorphologyEx(src Mat, dst *Mat, op MorphType, kernel Mat) {
// 	C.MorphologyEx(src, dst, c.int(op), kernel.p)
// }
//
// // MorphologyExWithParams performs advanced morphological transformations.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga67493776e3ad1a3df63883829375201f
// MorphologyExWithParams(src Mat, dst *Mat, op MorphType, kernel Mat, iterations int, borderType BorderType) {
// 	pt := Point{
// 		x: c.int(-1),
// 		y: c.int(-1),
// 	}
// 	C.MorphologyExWithParams(src, dst, c.int(op), kernel, pt, C.int(iterations), C.int(borderType))
// }
//
// // MorphShape is the shape of the structuring element used for Morphing operations.
// type MorphShape int
//
// const (
// 	// MorphRect is the rectangular morph shape.
// 	MorphRect MorphShape = 0
//
// 	// MorphCross is the cross morph shape.
// 	MorphCross MorphShape = 1
//
// 	// MorphEllipse is the ellipse morph shape.
// 	MorphEllipse MorphShape = 2
// )
//
// // GetStructuringElement returns a structuring element of the specified size
// // and shape for morphological operations.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac342a1bb6eabf6f55c803b09268e36dc
// GetStructuringElement(shape MorphShape, ksize image.Point) Mat {
// 	sz := Size{
// 		width:  c.int(ksize.X),
// 		height: c.int(ksize.Y),
// 	}
//
// 	return newMat(C.GetStructuringElement(c.int(shape), sz))
// }
//
// // MorphType type of morphological operation.
// type MorphType int
//
// const (
// 	// MorphErode operation
// 	MorphErode MorphType = 0
//
// 	// MorphDilate operation
// 	MorphDilate MorphType = 1
//
// 	// MorphOpen operation
// 	MorphOpen MorphType = 2
//
// 	// MorphClose operation
// 	MorphClose MorphType = 3
//
// 	// MorphGradient operation
// 	MorphGradient MorphType = 4
//
// 	// MorphTophat operation
// 	MorphTophat MorphType = 5
//
// 	// MorphBlackhat operation
// 	MorphBlackhat MorphType = 6
//
// 	// MorphHitmiss operation
// 	MorphHitmiss MorphType = 7
// )
//
// // GaussianBlur blurs an image Mat using a Gaussian filter.
// // The function convolves the src Mat image into the dst Mat using
// // the specified Gaussian kernel params.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaabe8c836e97159a9193fb0b11ac52cf1
// GaussianBlur(src Mat, dst *Mat, ksize image.Point, sigmaX f64,
// 	sigmaY f64, borderType BorderType) {
// 	pSize := Size{
// 		width:  c.int(ksize.X),
// 		height: c.int(ksize.Y),
// 	}
//
// 	C.GaussianBlur(src, dst, pSize, c.double(sigmaX), c.double(sigmaY), c.int(borderType))
// }
//
// // GetGaussianKernel returns Gaussian filter coefficients.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac05a120c1ae92a6060dd0db190a61afa
// GetGaussianKernel(ksize int, sigma f64) Mat {
// 	return newMat(C.GetGaussianKernel(c.int(ksize), c.double(sigma), C.int(MatTypeCV64F)))
// }
//
// // GetGaussianKernelWithParams returns Gaussian filter coefficients.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac05a120c1ae92a6060dd0db190a61afa
// GetGaussianKernelWithParams(ksize int, sigma f64, ktype MatType) Mat {
// 	return newMat(C.GetGaussianKernel(c.int(ksize), c.double(sigma), C.int(ktype)))
// }
//
// // Sobel calculates the first, second, third, or mixed image derivatives using an extended Sobel operator
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gacea54f142e81b6758cb6f375ce782c8d
// Sobel(src Mat, dst *Mat, ddepth MatType, dx, dy, ksize int, scale, delta f64, borderType BorderType) {
// 	C.Sobel(src, dst, c.int(ddepth), C.int(dx), C.int(dy), C.int(ksize), c.double(scale), c.double(delta), C.int(borderType))
// }
//
// // SpatialGradient calculates the first order image derivative in both x and y using a Sobel operator.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga405d03b20c782b65a4daf54d233239a2
// SpatialGradient(src Mat, dx, dy *Mat, ksize MatType, borderType BorderType) {
// 	C.SpatialGradient(src, dx, dy, c.int(ksize), C.int(borderType))
// }
//
// // Laplacian calculates the Laplacian of an image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gad78703e4c8fe703d479c1860d76429e6
// Laplacian(src Mat, dst *Mat, dDepth MatType, size int, scale f64,
// 	delta f64, borderType BorderType) {
// 	C.Laplacian(src, dst, c.int(dDepth), C.int(size), c.double(scale), c.double(delta), C.int(borderType))
// }
//
// // Scharr calculates the first x- or y- image derivative using Scharr operator.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaa13106761eedf14798f37aa2d60404c9
// Scharr(src Mat, dst *Mat, dDepth MatType, dx int, dy int, scale f64,
// 	delta f64, borderType BorderType) {
// 	C.Scharr(src, dst, c.int(dDepth), C.int(dx), C.int(dy), c.double(scale), c.double(delta), C.int(borderType))
// }
//
// // MedianBlur blurs an image using the median filter.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga564869aa33e58769b4469101aac458f9
// MedianBlur(src Mat, dst *Mat, ksize int) {
// 	C.MedianBlur(src, dst, c.int(ksize))
// }
//
// // Canny finds edges in an image using the Canny algorithm.
// // The function finds edges in the input image image and marks
// // them in the output map edges using the Canny algorithm.
// // The smallest value between threshold1 and threshold2 is used
// // for edge linking. The largest value is used to
// // find initial segments of strong edges.
// // See http://en.wikipedia.org/wiki/Canny_edge_detector
// //
// // For further details, please see:
// // http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga04723e007ed888ddf11d9ba04e2232de
// Canny(src Mat, edges *Mat, t1 f32, t2 float32) {
// 	C.Canny(src, edges, c.double(t1), c.double(t2))
// }
//
// // CornerSubPix Refines the corner locations. The function iterates to find
// // the sub-pixel accurate location of corners or radial saddle points.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga354e0d7c86d0d9da75de9b9701a9a87e
// CornerSubPix(img Mat, corners *Mat, winSize image.Point, zeroZone image.Point, criteria TermCriteria) {
// 	winSz := Size{
// 		width:  c.int(winSize.X),
// 		height: c.int(winSize.Y),
// 	}
//
// 	zeroSz := Size{
// 		width:  c.int(zeroZone.X),
// 		height: c.int(zeroZone.Y),
// 	}
//
// 	C.CornerSubPix(img, corners, winSz, zeroSz, criteria.p)
// 	return
// }
//
// // GoodFeaturesToTrack determines strong corners on an image. The function
// // finds the most prominent corners in the image or in the specified image region.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga1d6bb77486c8f92d79c8793ad995d541
// GoodFeaturesToTrack(img Mat, corners *Mat, maxCorners int, quality f64, minDist float64) {
// 	C.GoodFeaturesToTrack(img, corners, c.int(maxCorners), c.double(quality), c.double(minDist))
// }
//
// // GrabCutMode is the flag for GrabCut algorithm.
// type GrabCutMode int
//
// const (
// 	// GCInitWithRect makes the function initialize the state and the mask using the provided rectangle.
// 	// After that it runs the itercount iterations of the algorithm.
// 	GCInitWithRect GrabCutMode = 0
// 	// GCInitWithMask makes the function initialize the state using the provided mask.
// 	// GCInitWithMask and GCInitWithRect can be combined.
// 	// Then all the pixels outside of the ROI are automatically initialized with GC_BGD.
// 	GCInitWithMask GrabCutMode = 1
// 	// GCEval means that the algorithm should just resume.
// 	GCEval GrabCutMode = 2
// 	// GCEvalFreezeModel means that the algorithm should just run a single iteration of the GrabCut algorithm
// 	// with the fixed model
// 	GCEvalFreezeModel GrabCutMode = 3
// )
//
// // Grabcut runs the GrabCut algorithm.
// // The function implements the GrabCut image segmentation algorithm.
// // For further details, please see:
// // https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga909c1dda50efcbeaa3ce126be862b37f
// GrabCut(img Mat, mask *Mat, r image.Rectangle, bgdModel *Mat, fgdModel *Mat, iterCount int, mode GrabCutMode) {
// 	cRect := Rect{
// 		x:      c.int(r.Min.X),
// 		y:      c.int(r.Min.Y),
// 		width:  c.int(r.Size().X),
// 		height: c.int(r.Size().Y),
// 	}
//
// 	C.GrabCut(img, mask, cRect, bgdModel, fgdModel, c.int(iterCount), C.int(mode))
// }
//
// // HoughMode is the type for Hough transform variants.
// type HoughMode int
//
// const (
// 	// HoughStandard is the classical or standard Hough transform.
// 	HoughStandard HoughMode = 0
// 	// HoughProbabilistic is the probabilistic Hough transform (more efficient
// 	// in case if the picture contains a few long linear segments).
// 	HoughProbabilistic HoughMode = 1
// 	// HoughMultiScale is the multi-scale variant of the classical Hough
// 	// transform.
// 	HoughMultiScale HoughMode = 2
// 	// HoughGradient is basically 21HT, described in: HK Yuen, John Princen,
// 	// John Illingworth, and Josef Kittler. Comparative study of hough
// 	// transform methods for circle finding. Image and Vision Computing,
// 	// 8(1):71–77, 1990.
// 	HoughGradient HoughMode = 3
// )
//
// // HoughCircles finds circles in a grayscale image using the Hough transform.
// // The only "method" currently supported is HoughGradient. If you want to pass
// // more parameters, please see `HoughCirclesWithParams`.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga47849c3be0d0406ad3ca45db65a25d2d
// HoughCircles(src Mat, circles *Mat, method HoughMode, dp, minDist f64) {
// 	C.HoughCircles(src, circles, c.int(method), c.double(dp), c.double(minDist))
// }
//
// // HoughCirclesWithParams finds circles in a grayscale image using the Hough
// // transform. The only "method" currently supported is HoughGradient.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga47849c3be0d0406ad3ca45db65a25d2d
// HoughCirclesWithParams(src Mat, circles *Mat, method HoughMode, dp, minDist, param1, param2 f64, minRadius, maxRadius int) {
// 	C.HoughCirclesWithParams(src, circles, c.int(method), c.double(dp), c.double(minDist), c.double(param1), c.double(param2), C.int(minRadius), C.int(maxRadius))
// }
//
// // HoughLines implements the standard or standard multi-scale Hough transform
// // algorithm for line detection. For a good explanation of Hough transform, see:
// // http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
// //
// // For further details, please see:
// // http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga46b4e588934f6c8dfd509cc6e0e4545a
// HoughLines(src Mat, lines *Mat, rho f32, theta float32, threshold int) {
// 	C.HoughLines(src, lines, c.double(rho), c.double(theta), c.int(threshold))
// }
//
// // HoughLinesP implements the probabilistic Hough transform
// // algorithm for line detection. For a good explanation of Hough transform, see:
// // http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
// //
// // For further details, please see:
// // http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga8618180a5948286384e3b7ca02f6feeb
// HoughLinesP(src Mat, lines *Mat, rho f32, theta float32, threshold int) {
// 	C.HoughLinesP(src, lines, c.double(rho), c.double(theta), c.int(threshold))
// }
// HoughLinesPWithParams(src Mat, lines *Mat, rho f32, theta float32, threshold int, minLineLength float32, maxLineGap float32) {
// 	C.HoughLinesPWithParams(src, lines, c.double(rho), c.double(theta), c.int(threshold), c.double(minLineLength), c.double(maxLineGap))
// }
//
// // HoughLinesPointSet implements the Hough transform algorithm for line
// // detection on a set of points. For a good explanation of Hough transform, see:
// // http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
// //
// // For further details, please see:
// // https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga2858ef61b4e47d1919facac2152a160e
// HoughLinesPointSet(points Mat, lines *Mat, linesMax int, threshold int,
// 	minRho f32, maxRho float32, rhoStep float32,
// 	minTheta f32, maxTheta float32, thetaStep float32) {
// 	C.HoughLinesPointSet(points, lines, c.int(linesMax), C.int(threshold),
// 		c.double(minRho), c.double(maxRho), c.double(rhoStep),
// 		c.double(minTheta), c.double(maxTheta), c.double(thetaStep))
// }
//
// // Integral calculates one or more integral images for the source image.
// // For further details, please see:
// // https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga97b87bec26908237e8ba0f6e96d23e28
// Integral(src Mat, sum *Mat, sqsum *Mat, tilted *Mat) {
// 	c.integral(src, sum, sqsum, tilted.p)
// }
//
// // ThresholdType type of threshold operation.
// type ThresholdType int
//
// const (
// 	// ThresholdBinary threshold type
// 	ThresholdBinary ThresholdType = 0
//
// 	// ThresholdBinaryInv threshold type
// 	ThresholdBinaryInv ThresholdType = 1
//
// 	// ThresholdTrunc threshold type
// 	ThresholdTrunc ThresholdType = 2
//
// 	// ThresholdToZero threshold type
// 	ThresholdToZero ThresholdType = 3
//
// 	// ThresholdToZeroInv threshold type
// 	ThresholdToZeroInv ThresholdType = 4
//
// 	// ThresholdMask threshold type
// 	ThresholdMask ThresholdType = 7
//
// 	// ThresholdOtsu threshold type
// 	ThresholdOtsu ThresholdType = 8
//
// 	// ThresholdTriangle threshold type
// 	ThresholdTriangle ThresholdType = 16
// )
//
// // Threshold applies a fixed-level threshold to each array element.
// //
// // For further details, please see:
// // https://docs.opencv.org/3.3.0/d7/d1b/group__imgproc__misc.html#gae8a4a146d1ca78c626a53577199e9c57
// Threshold(src Mat, dst *Mat, thresh f32, maxvalue float32, typ ThresholdType) (threshold float32) {
// 	return f32(C.Threshold(src, dst, c.double(thresh), c.double(maxvalue), c.int(typ)))
// }
//
// // AdaptiveThresholdType type of adaptive threshold operation.
// type AdaptiveThresholdType int
//
// const (
// 	// AdaptiveThresholdMean threshold type
// 	AdaptiveThresholdMean AdaptiveThresholdType = 0
//
// 	// AdaptiveThresholdGaussian threshold type
// 	AdaptiveThresholdGaussian AdaptiveThresholdType = 1
// )
//
// // AdaptiveThreshold applies a fixed-level threshold to each array element.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga72b913f352e4a1b1b397736707afcde3
// AdaptiveThreshold(src Mat, dst *Mat, maxValue f32, adaptiveTyp AdaptiveThresholdType, typ ThresholdType, blockSize int, c float32) {
// 	C.AdaptiveThreshold(src, dst, c.double(maxValue), c.int(adaptiveTyp), C.int(typ), C.int(blockSize), c.double(c))
// }
//
// // ArrowedLine draws a arrow segment pointing from the first point
// // to the second one.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga0a165a3ca093fd488ac709fdf10c05b2
// ArrowedLine(img *Mat, pt1 image.Point, pt2 image.Point, c color.RGBA, thickness int) {
// 	sp1 := Point{
// 		x: c.int(pt1.X),
// 		y: c.int(pt1.Y),
// 	}
//
// 	sp2 := Point{
// 		x: c.int(pt2.X),
// 		y: c.int(pt2.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.ArrowedLine(img, sp1, sp2, sColor, c.int(thickness))
// }
//
// // Circle draws a circle.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf10604b069374903dbd0f0488cb43670
// Circle(img *Mat, center image.Point, radius int, c color.RGBA, thickness int) {
// 	pc := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.Circle(img, pc, c.int(radius), sColor, C.int(thickness))
// }
//
// // CircleWithParams draws a circle.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf10604b069374903dbd0f0488cb43670
// CircleWithParams(img *Mat, center image.Point, radius int, c color.RGBA, thickness int, lineType LineType, shift int) {
// 	pc := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.CircleWithParams(img, pc, c.int(radius), sColor, C.int(thickness), C.int(lineType), C.int(shift))
// }
//
// // Ellipse draws a simple or thick elliptic arc or fills an ellipse sector.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga28b2267d35786f5f890ca167236cbc69
// Ellipse(img *Mat, center, axes image.Point, angle, startAngle, endAngle f64, c color.RGBA, thickness int) {
// 	pc := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	pa := Point{
// 		x: c.int(axes.X),
// 		y: c.int(axes.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.Ellipse(img, pc, pa, c.double(angle), c.double(startAngle), c.double(endAngle), sColor, c.int(thickness))
// }
//
// // Ellipse draws a simple or thick elliptic arc or fills an ellipse sector.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga28b2267d35786f5f890ca167236cbc69
// EllipseWithParams(img *Mat, center, axes image.Point, angle, startAngle, endAngle f64, c color.RGBA, thickness int, lineType LineType, shift int) {
// 	pc := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	pa := Point{
// 		x: c.int(axes.X),
// 		y: c.int(axes.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.EllipseWithParams(img, pc, pa, c.double(angle), c.double(startAngle), c.double(endAngle), sColor, c.int(thickness), C.int(lineType), C.int(shift))
// }
//
// // Line draws a line segment connecting two points.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga7078a9fae8c7e7d13d24dac2520ae4a2
// Line(img *Mat, pt1 image.Point, pt2 image.Point, c color.RGBA, thickness int) {
// 	sp1 := Point{
// 		x: c.int(pt1.X),
// 		y: c.int(pt1.Y),
// 	}
//
// 	sp2 := Point{
// 		x: c.int(pt2.X),
// 		y: c.int(pt2.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.Line(img, sp1, sp2, sColor, c.int(thickness))
// }
//
// // Rectangle draws a simple, thick, or filled up-right rectangle.
// // It renders a rectangle with the desired characteristics to the target Mat image.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga346ac30b5c74e9b5137576c9ee9e0e8c
// Rectangle(img *Mat, r image.Rectangle, c color.RGBA, thickness int) {
// 	cRect := Rect{
// 		x:      c.int(r.Min.X),
// 		y:      c.int(r.Min.Y),
// 		width:  c.int(r.Size().X),
// 		height: c.int(r.Size().Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.Rectangle(img, cRect, sColor, c.int(thickness))
// }
//
// // RectangleWithParams draws a simple, thick, or filled up-right rectangle.
// // It renders a rectangle with the desired characteristics to the target Mat image.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga346ac30b5c74e9b5137576c9ee9e0e8c
// RectangleWithParams(img *Mat, r image.Rectangle, c color.RGBA, thickness int, lineType LineType, shift int) {
// 	cRect := Rect{
// 		x:      c.int(r.Min.X),
// 		y:      c.int(r.Min.Y),
// 		width:  c.int(r.Size().X),
// 		height: c.int(r.Size().Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.RectangleWithParams(img, cRect, sColor, c.int(thickness), C.int(lineType), C.int(shift))
// }
//
// // FillPoly fills the area bounded by one or more polygons.
// //
// // For more information, see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf30888828337aa4c6b56782b5dfbd4b7
// FillPoly(img *Mat, pts PointsVector, c color.RGBA) {
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.FillPoly(img, pts, sColor)
// }
//
// // FillPolyWithParams fills the area bounded by one or more polygons.
// //
// // For more information, see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf30888828337aa4c6b56782b5dfbd4b7
// FillPolyWithParams(img *Mat, pts PointsVector, c color.RGBA, lineType LineType, shift int, offset image.Point) {
// 	offsetP := Point{
// 		x: c.int(offset.X),
// 		y: c.int(offset.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.FillPolyWithParams(img, pts, sColor, c.int(lineType), C.int(shift), offsetP)
// }
//
// // Polylines draws several polygonal curves.
// //
// // For more information, see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga1ea127ffbbb7e0bfc4fd6fd2eb64263c
// Polylines(img *Mat, pts PointsVector, isClosed bool, c color.RGBA, thickness int) {
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.Polylines(img, pts, C.bool(isClosed), sColor, c.int(thickness))
// }
//
// // HersheyFont are the font libraries included in OpenCV.
// // Only a subset of the available Hershey fonts are supported by OpenCV.
// //
// // For more information, see:
// // http://sources.isc.org/utils/misc/hershey-font.txt
// type HersheyFont int
//
// const (
// 	// FontHersheySimplex is normal size sans-serif font.
// 	FontHersheySimplex HersheyFont = 0
// 	// FontHersheyPlain issmall size sans-serif font.
// 	FontHersheyPlain HersheyFont = 1
// 	// FontHersheyDuplex normal size sans-serif font
// 	// (more complex than FontHersheySIMPLEX).
// 	FontHersheyDuplex HersheyFont = 2
// 	// FontHersheyComplex i a normal size serif font.
// 	FontHersheyComplex HersheyFont = 3
// 	// FontHersheyTriplex is a normal size serif font
// 	// (more complex than FontHersheyCOMPLEX).
// 	FontHersheyTriplex HersheyFont = 4
// 	// FontHersheyComplexSmall is a smaller version of FontHersheyCOMPLEX.
// 	FontHersheyComplexSmall HersheyFont = 5
// 	// FontHersheyScriptSimplex is a hand-writing style font.
// 	FontHersheyScriptSimplex HersheyFont = 6
// 	// FontHersheyScriptComplex is a more complex variant of FontHersheyScriptSimplex.
// 	FontHersheyScriptComplex HersheyFont = 7
// 	// FontItalic is the flag for italic font.
// 	FontItalic HersheyFont = 16
// )
//
// // LineType are the line libraries included in OpenCV.
// //
// // For more information, see:
// // https://vovkos.github.io/doxyrest-showcase/opencv/sphinx_rtd_theme/enum_cv_LineTypes.html
// type LineType int
//
// const (
// 	// Filled line
// 	Filled LineType = -1
// 	// Line4 4-connected line
// 	Line4 LineType = 4
// 	// Line8 8-connected line
// 	Line8 LineType = 8
// 	// LineAA antialiased line
// 	LineAA LineType = 16
// )
//
// // GetTextSize calculates the width and height of a text string.
// // It returns an image.Point with the size required to draw text using
// // a specific font face, scale, and thickness.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga3d2abfcb995fd2db908c8288199dba82
// GetTextSize(text string, fontFace HersheyFont, fontScale f64, thickness int) image.Point {
// 	cText := C.CString(text)
// 	defer C.free(unsafe.Pointer(cText))
//
// 	sz := C.GetTextSize(cText, c.int(fontFace), c.double(fontScale), C.int(thickness))
// 	return image.Pt(int(sz.width), int(sz.height))
// }
//
// // GetTextSizeWithBaseline calculates the width and height of a text string including the basline of the text.
// // It returns an image.Point with the size required to draw text using
// // a specific font face, scale, and thickness as well as its baseline.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga3d2abfcb995fd2db908c8288199dba82
// GetTextSizeWithBaseline(text string, fontFace HersheyFont, fontScale f64, thickness int) (image.Point, int) {
// 	cText := C.CString(text)
// 	defer C.free(unsafe.Pointer(cText))
// 	cBaseline := c.int(0)
//
// 	sz := C.GetTextSizeWithBaseline(cText, c.int(fontFace), c.double(fontScale), C.int(thickness), &cBaseline)
// 	return image.Pt(int(sz.width), int(sz.height)), int(cBaseline)
// }
//
// // PutText draws a text string.
// // It renders the specified text string into the img Mat at the location
// // passed in the "org" param, using the desired font face, font scale,
// // color, and line thinkness.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga5126f47f883d730f633d74f07456c576
// PutText(img *Mat, text string, org image.Point, fontFace HersheyFont, fontScale f64, c color.RGBA, thickness int) {
// 	cText := C.CString(text)
// 	defer C.free(unsafe.Pointer(cText))
//
// 	pOrg := Point{
// 		x: c.int(org.X),
// 		y: c.int(org.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.PutText(img, cText, pOrg, c.int(fontFace), c.double(fontScale), sColor, C.int(thickness))
// 	return
// }
//
// // PutTextWithParams draws a text string.
// // It renders the specified text string into the img Mat at the location
// // passed in the "org" param, using the desired font face, font scale,
// // color, and line thinkness.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga5126f47f883d730f633d74f07456c576
// PutTextWithParams(img *Mat, text string, org image.Point, fontFace HersheyFont, fontScale f64, c color.RGBA, thickness int, lineType LineType, bottomLeftOrigin bool) {
// 	cText := C.CString(text)
// 	defer C.free(unsafe.Pointer(cText))
//
// 	pOrg := Point{
// 		x: c.int(org.X),
// 		y: c.int(org.Y),
// 	}
//
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.PutTextWithParams(img, cText, pOrg, c.int(fontFace), c.double(fontScale), sColor, C.int(thickness), C.int(lineType), C.bool(bottomLeftOrigin))
// 	return
// }
//
// // InterpolationFlags are bit flags that control the interpolation algorithm
// // that is used.
// type InterpolationFlags int
//
// const (
// 	// InterpolationNearestNeighbor is nearest neighbor. (fast but low quality)
// 	InterpolationNearestNeighbor InterpolationFlags = 0
//
// 	// InterpolationLinear is bilinear interpolation.
// 	InterpolationLinear InterpolationFlags = 1
//
// 	// InterpolationCubic is bicube interpolation.
// 	InterpolationCubic.interpolationFlags = 2
//
// 	// InterpolationArea uses pixel area relation. It is preferred for image
// 	// decimation as it gives moire-free results.
// 	InterpolationArea InterpolationFlags = 3
//
// 	// InterpolationLanczos4 is Lanczos interpolation over 8x8 neighborhood.
// 	InterpolationLanczos4 InterpolationFlags = 4
//
// 	// InterpolationDefault is an alias for InterpolationLinear.
// 	InterpolationDefault = InterpolationLinear
//
// 	// InterpolationMax indicates use maximum interpolation.
// 	InterpolationMax InterpolationFlags = 7
//
// 	// WarpFillOutliers fills all of the destination image pixels. If some of them correspond to outliers in the source image, they are set to zero.
// 	WarpFillOutliers = 8
//
// 	// WarpInverseMap, inverse transformation.
// 	WarpInverseMap = 16
// )
//
// // Resize resizes an image.
// // It resizes the image src down to or up to the specified size, storing the
// // result in dst. Note that src and dst may be the same image. If you wish to
// // scale by factor, an empty sz may be passed and non-zero fx and fy. Likewise,
// // if you wish to scale to an explicit size, a non-empty sz may be passed with
// // zero for both fx and fy.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga47a974309e9102f5f08231edc7e7529d
// Resize(src Mat, dst *Mat, sz image.Point, fx, fy f64, interp InterpolationFlags) {
// 	pSize := Size{
// 		width:  c.int(sz.X),
// 		height: c.int(sz.Y),
// 	}
//
// 	C.Resize(src, dst, pSize, c.double(fx), c.double(fy), c.int(interp))
// 	return
// }
//
// // GetRectSubPix retrieves a pixel rectangle from an image with sub-pixel accuracy.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga77576d06075c1a4b6ba1a608850cd614
// GetRectSubPix(src Mat, patchSize image.Point, center image.Point, dst *Mat) {
// 	sz := Size{
// 		width:  c.int(patchSize.X),
// 		height: c.int(patchSize.Y),
// 	}
// 	pt := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	C.GetRectSubPix(src, sz, pt, dst.p)
// }
//
// // GetRotationMatrix2D calculates an affine matrix of 2D rotation.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gafbbc470ce83812914a70abfb604f4326
// GetRotationMatrix2D(center image.Point, angle, scale f64) Mat {
// 	pc := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	return newMat(C.GetRotationMatrix2D(pc, c.double(angle), c.double(scale)))
// }
//
// // WarpAffine applies an affine transformation to an image. For more parameters please check WarpAffineWithParams
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga0203d9ee5fcd28d40dbc4a1ea4451983
// WarpAffine(src Mat, dst *Mat, m Mat, sz image.Point) {
// 	pSize := Size{
// 		width:  c.int(sz.X),
// 		height: c.int(sz.Y),
// 	}
//
// 	C.WarpAffine(src, dst, m, pSize)
// }
//
// // WarpAffineWithParams applies an affine transformation to an image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga0203d9ee5fcd28d40dbc4a1ea4451983
// WarpAffineWithParams(src Mat, dst *Mat, m Mat, sz image.Point, flags InterpolationFlags, borderType BorderType, borderValue color.RGBA) {
// 	pSize := Size{
// 		width:  c.int(sz.X),
// 		height: c.int(sz.Y),
// 	}
// 	bv := Scalar{
// 		val1: c.double(borderValue.B),
// 		val2: c.double(borderValue.G),
// 		val3: c.double(borderValue.R),
// 		val4: c.double(borderValue.A),
// 	}
// 	C.WarpAffineWithParams(src, dst, m, pSize, c.int(flags), C.int(borderType), bv)
// }
//
// // WarpPerspective applies a perspective transformation to an image.
// // For more parameters please check WarpPerspectiveWithParams.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gaf73673a7e8e18ec6963e3774e6a94b87
// WarpPerspective(src Mat, dst *Mat, m Mat, sz image.Point) {
// 	pSize := Size{
// 		width:  c.int(sz.X),
// 		height: c.int(sz.Y),
// 	}
//
// 	C.WarpPerspective(src, dst, m, pSize)
// }
//
// // WarpPerspectiveWithParams applies a perspective transformation to an image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gaf73673a7e8e18ec6963e3774e6a94b87
// WarpPerspectiveWithParams(src Mat, dst *Mat, m Mat, sz image.Point, flags InterpolationFlags, borderType BorderType, borderValue color.RGBA) {
// 	pSize := Size{
// 		width:  c.int(sz.X),
// 		height: c.int(sz.Y),
// 	}
// 	bv := Scalar{
// 		val1: c.double(borderValue.B),
// 		val2: c.double(borderValue.G),
// 		val3: c.double(borderValue.R),
// 		val4: c.double(borderValue.A),
// 	}
// 	C.WarpPerspectiveWithParams(src, dst, m, pSize, c.int(flags), C.int(borderType), bv)
// }
//
// // Watershed performs a marker-based image segmentation using the watershed algorithm.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga3267243e4d3f95165d55a618c65ac6e1
// Watershed(image Mat, markers *Mat) {
// 	C.Watershed(image, markers.p)
// }
//
// // ColormapTypes are the 12 GNU Octave/MATLAB equivalent colormaps.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/d50/group__imgproc__colormap.html
// type ColormapTypes int
//
// // List of the available color maps
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/d50/group__imgproc__colormap.html#ga9a805d8262bcbe273f16be9ea2055a65
// const (
// 	ColormapAutumn  ColormapTypes = 0
// 	ColormapBone    ColormapTypes = 1
// 	ColormapJet     ColormapTypes = 2
// 	ColormapWinter  ColormapTypes = 3
// 	ColormapRainbow ColormapTypes = 4
// 	ColormapOcean   ColormapTypes = 5
// 	ColormapSummer  ColormapTypes = 6
// 	ColormapSpring  ColormapTypes = 7
// 	ColormapCool    ColormapTypes = 8
// 	ColormapHsv     ColormapTypes = 9
// 	ColormapPink    ColormapTypes = 10
// 	ColormapHot     ColormapTypes = 11
// 	ColormapParula  ColormapTypes = 12
// )
//
// // ApplyColorMap applies a GNU Octave/MATLAB equivalent colormap on a given image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/d50/group__imgproc__colormap.html#gadf478a5e5ff49d8aa24e726ea6f65d15
// ApplyColorMap(src Mat, dst *Mat, colormapType ColormapTypes) {
// 	C.ApplyColorMap(src, dst, c.int(colormapType))
// }
//
// // ApplyCustomColorMap applies a custom defined colormap on a given image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/d50/group__imgproc__colormap.html#gacb22288ddccc55f9bd9e6d492b409cae
// ApplyCustomColorMap(src Mat, dst *Mat, customColormap Mat) {
// 	C.ApplyCustomColorMap(src, dst, customColormap.p)
// }
//
// // GetPerspectiveTransform returns 3x3 perspective transformation for the
// // corresponding 4 point pairs as image.Point.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga8c1ae0e3589a9d77fffc962c49b22043
// GetPerspectiveTransform(src, dst PointVector) Mat {
// 	return newMat(C.GetPerspectiveTransform(src, dst.p))
// }
//
// // GetPerspectiveTransform2f returns 3x3 perspective transformation for the
// // corresponding 4 point pairs as gocv.Point2f.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga8c1ae0e3589a9d77fffc962c49b22043
// GetPerspectiveTransform2f(src, dst Point2fVector) Mat {
// 	return newMat(C.GetPerspectiveTransform2f(src, dst.p))
// }
//
// // GetAffineTransform returns a 2x3 affine transformation matrix for the
// // corresponding 3 point pairs as image.Point.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga8f6d378f9f8eebb5cb55cd3ae295a999
// GetAffineTransform(src, dst PointVector) Mat {
// 	return newMat(C.GetAffineTransform(src, dst.p))
// }
//
// // GetAffineTransform2f returns a 2x3 affine transformation matrix for the
// // corresponding 3 point pairs as gocv.Point2f.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#ga8f6d378f9f8eebb5cb55cd3ae295a999
// GetAffineTransform2f(src, dst Point2fVector) Mat {
// 	return newMat(C.GetAffineTransform2f(src, dst.p))
// }
//
// type HomographyMethod int
//
// const (
// 	HomograpyMethodAllPoints HomographyMethod = 0
// 	HomograpyMethodLMEDS     HomographyMethod = 4
// 	HomograpyMethodRANSAC    HomographyMethod = 8
// )
//
// // FindHomography finds an optimal homography matrix using 4 or more point pairs (as opposed to GetPerspectiveTransform, which uses exactly 4)
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d9/d0c/group__calib3d.html#ga4abc2ece9fab9398f2e560d53c8c9780
// FindHomography(srcPoints Mat, dstPoints *Mat, method HomographyMethod, ransacReprojThreshold f64, mask *Mat, maxIters int, confidence float64) Mat {
// 	return newMat(C.FindHomography(srcPoints.Ptr(), dstPoints.Ptr(), c.int(method), c.double(ransacReprojThreshold), mask.Ptr(), C.int(maxIters), c.double(confidence)))
// }
//
// // DrawContours draws contours outlines or filled contours.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga746c0625f1781f1ffc9056259103edbc
// DrawContours(img *Mat, contours PointsVector, contourIdx int, c color.RGBA, thickness int) {
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
//
// 	C.DrawContours(img, contours, c.int(contourIdx), sColor, C.int(thickness))
// }
//
// // DrawContoursWithParams draws contours outlines or filled contours.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga746c0625f1781f1ffc9056259103edbc
// DrawContoursWithParams(img *Mat, contours PointsVector, contourIdx int, c color.RGBA, thickness int, lineType LineType, hierarchy Mat, maxLevel int, offset image.Point) {
// 	sColor := Scalar{
// 		val1: c.double(c.B),
// 		val2: c.double(c.G),
// 		val3: c.double(c.R),
// 		val4: c.double(c.A),
// 	}
// 	offsetP := Point{
// 		x: c.int(offset.X),
// 		y: c.int(offset.Y),
// 	}
//
// 	C.DrawContoursWithParams(img, contours, c.int(contourIdx), sColor, C.int(thickness), C.int(lineType), hierarchy, C.int(maxLevel), offsetP)
// }
//
// // Remap applies a generic geometrical transformation to an image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gab75ef31ce5cdfb5c44b6da5f3b908ea4
// Remap(src Mat, dst, map1, map2 *Mat, interpolation InterpolationFlags, borderMode BorderType, borderValue color.RGBA) {
// 	bv := Scalar{
// 		val1: c.double(borderValue.B),
// 		val2: c.double(borderValue.G),
// 		val3: c.double(borderValue.R),
// 		val4: c.double(borderValue.A),
// 	}
// 	C.Remap(src, dst, map1, map2, c.int(interpolation), C.int(borderMode), bv)
// }
//
// // Filter2D applies an arbitrary linear filter to an image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga27c049795ce870216ddfb366086b5a04
// Filter2D(src Mat, dst *Mat, ddepth MatType, kernel Mat, anchor image.Point, delta f64, borderType BorderType) {
// 	anchorP := Point{
// 		x: c.int(anchor.X),
// 		y: c.int(anchor.Y),
// 	}
// 	C.Filter2D(src, dst, c.int(ddepth), kernel, anchorP, c.double(delta), C.int(borderType))
// }
//
// // SepFilter2D applies a separable linear filter to the image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga910e29ff7d7b105057d1625a4bf6318d
// SepFilter2D(src Mat, dst *Mat, ddepth MatType, kernelX, kernelY Mat, anchor image.Point, delta f64, borderType BorderType) {
// 	anchorP := Point{
// 		x: c.int(anchor.X),
// 		y: c.int(anchor.Y),
// 	}
// 	C.SepFilter2D(src, dst, c.int(ddepth), kernelX, kernelY, anchorP, c.double(delta), C.int(borderType))
// }
//
// // LogPolar remaps an image to semilog-polar coordinates space.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gaec3a0b126a85b5ca2c667b16e0ae022d
// LogPolar(src Mat, dst *Mat, center image.Point, m f64, flags InterpolationFlags) {
// 	centerP := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	C.LogPolar(src, dst, centerP, c.double(m), c.int(flags))
// }
//
// // LinearPolar remaps an image to polar coordinates space.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/da/d54/group__imgproc__transform.html#gaa38a6884ac8b6e0b9bed47939b5362f3
// LinearPolar(src Mat, dst *Mat, center image.Point, maxRadius f64, flags InterpolationFlags) {
// 	centerP := Point{
// 		x: c.int(center.X),
// 		y: c.int(center.Y),
// 	}
// 	C.LinearPolar(src, dst, centerP, c.double(maxRadius), c.int(flags))
// }
//
// // FitLine fits a line to a 2D or 3D point set.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaf849da1fdafa67ee84b1e9a23b93f91f
// FitLine(pts PointVector, line *Mat, distType DistanceTypes, param, reps, aeps f64) {
// 	C.FitLine(pts, line, c.int(distType), c.double(param), c.double(reps), c.double(aeps))
// }
//
// // Shape matching methods.
// //
// // For further details, please see:
// // https://docs.opencv.org/4.x/d3/dc0/group__imgproc__shape.html#gaadc90cb16e2362c9bd6e7363e6e4c317
// type ShapeMatchModes int
//
// const (
// 	ContoursMatchI1 ShapeMatchModes = 1
// 	ContoursMatchI2 ShapeMatchModes = 2
// 	ContoursMatchI3 ShapeMatchModes = 3
// )
//
// // Compares two shapes.
// //
// // For further details, please see:
// // https://docs.opencv.org/4.x/d3/dc0/group__imgproc__shape.html#gaadc90cb16e2362c9bd6e7363e6e4c317
// MatchShapes(contour1 PointVector, contour2 PointVector, method ShapeMatchModes, parameter f64) float64 {
// 	return f64(C.MatchShapes(contour1, contour2, c.int(method), c.double(parameter)))
// }
//
// // CLAHE is a wrapper around the cv::CLAHE algorithm.
// type CLAHE struct {
// 	// C.CLAHE
// 	p unsafe.Pointer
// }
//
// // NewCLAHE returns a new CLAHE algorithm
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/db6/classcv_1_1CLAHE.html
// NewCLAHE() CLAHE {
// 	return CLAHE{p: unsafe.Pointer(C.CLAHE_Create())}
// }
//
// // NewCLAHEWithParams returns a new CLAHE algorithm
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/db6/classcv_1_1CLAHE.html
// NewCLAHEWithParams(clipLimit f64, tileGridSize image.Point) CLAHE {
// 	pSize := Size{
// 		width:  c.int(tileGridSize.X),
// 		height: c.int(tileGridSize.Y),
// 	}
// 	return CLAHE{p: unsafe.Pointer(C.CLAHE_CreateWithParams(c.double(clipLimit), pSize))}
// }
//
// // Close CLAHE.
// (c *CLAHE) Close() error {
// 	C.CLAHE_Close((C.CLAHE)(c.p))
// 	c.p = nil
// 	return nil
// }
//
// // Apply CLAHE.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d6/db6/classcv_1_1CLAHE.html#a4e92e0e427de21be8d1fae8dcd862c5e
// (c *CLAHE) Apply(src Mat, dst *Mat) {
// 	C.CLAHE_Apply((C.CLAHE)(c.p), src, dst.p)
// }
//
// InvertAffineTransform(src Mat, dst *Mat) {
// 	C.InvertAffineTransform(src, dst.p)
// }
//
// // Apply phaseCorrelate.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga552420a2ace9ef3fb053cd630fdb4952
// PhaseCorrelate(src1, src2, window Mat) (phaseShift Point2f, response f64) {
// 	var responseDouble c.double
// 	result := C.PhaseCorrelate(src1, src2, window, &responseDouble)
//
// 	return Point2f{
// 		X: f32(result.x),
// 		Y: f32(result.y),
// 	}, f64(responseDouble)
// }
//
// // CreateHanningWindow computes a Hanning window coefficients in two dimensions.
// //
// // For further details, please see:
// // https://docs.opencv.org/4.x/d7/df3/group__imgproc__motion.html#ga80e5c3de52f6bab3a7c1e60e89308e1b
// CreateHanningWindow(img *Mat, size image.Point, typ MatType) {
// 	sz := Size{
// 		width:  c.int(size.X),
// 		height: c.int(size.Y),
// 	}
//
// 	C.CreateHanningWindow(img, sz, c.int(typ))
// }
//
// // ToImage converts a Mat to a image.Image.
// (m *Mat) ToImage() (image.Image, error) {
// 	switch m.Type() {
// 	case MatTypeCV8UC1:
// 		img := image.NewGray(image.Rect(0, 0, m.Cols(), m.Rows()))
// 		data, err := m.DataPtrUint8()
// 		if err != nil {
// 			return nil, err
// 		}
// 		copy(img.Pix, data[0:])
// 		return img, nil
//
// 	case MatTypeCV8UC3:
// 		dst := NewMat()
// 		defer dst.Close()
//
// 		C.CvtColor(m, dst, c.int(ColorBGRToRGBA))
//
// 		img := image.NewRGBA(image.Rect(0, 0, m.Cols(), m.Rows()))
// 		data, err := dst.DataPtrUint8()
// 		if err != nil {
// 			return nil, err
// 		}
//
// 		copy(img.Pix, data[0:])
// 		return img, nil
//
// 	case MatTypeCV8UC4:
// 		dst := NewMat()
// 		defer dst.Close()
//
// 		C.CvtColor(m, dst, c.int(ColorBGRAToRGBA))
//
// 		img := image.NewNRGBA(image.Rect(0, 0, m.Cols(), m.Rows()))
// 		data, err := dst.DataPtrUint8()
// 		if err != nil {
// 			return nil, err
// 		}
// 		copy(img.Pix, data[0:])
// 		return img, nil
//
// 	default:
// 		return nil, errors.New("ToImage supports only MatType CV8UC1, CV8UC3 and CV8UC4")
// 	}
// }
//
// // ToImageYUV converts a Mat to a image.YCbCr using image.YCbCrSubsampleRatio420 as default subsampling param.
// (m *Mat) ToImageYUV() (*image.YCbCr, error) {
// 	img, err := m.ToImage()
// 	if err != nil {
// 		return nil, err
// 	}
// 	bounds := img.Bounds()
// 	converted := image.NewYCbCr(bounds, image.YCbCrSubsampleRatio420)
//
// 	for row := 0; row < bounds.Max.Y; row++ {
// 		for col := 0; col < bounds.Max.X; col++ {
// 			r, g, b, _ := img.At(col, row).RGBA()
// 			y, cb, cr := color.RGBToYCbCr(uint8(r), uint8(g), uint8(b))
//
// 			converted.Y[converted.YOffset(col, row)] = y
// 			converted.Cb[converted.COffset(col, row)] = cb
// 			converted.Cr[converted.COffset(col, row)] = cr
// 		}
// 	}
// 	return converted, nil
// }
//
// // ToImageYUV converts a Mat to a image.YCbCr using provided YUV subsample ratio param.
// (m *Mat) ToImageYUVWithParams(ratio image.YCbCrSubsampleRatio) (*image.YCbCr, error) {
// 	img, err := m.ToImage()
// 	if err != nil {
// 		return nil, err
// 	}
// 	bounds := img.Bounds()
// 	converted := image.NewYCbCr(bounds, ratio)
//
// 	for row := 0; row < bounds.Max.Y; row++ {
// 		for col := 0; col < bounds.Max.X; col++ {
// 			r, g, b, _ := img.At(col, row).RGBA()
// 			y, cb, cr := color.RGBToYCbCr(uint8(r), uint8(g), uint8(b))
//
// 			converted.Y[converted.YOffset(col, row)] = y
// 			converted.Cb[converted.COffset(col, row)] = cb
// 			converted.Cr[converted.COffset(col, row)] = cr
// 		}
// 	}
// 	return converted, nil
// }
//
// // ImageToMatRGBA converts image.Image to gocv.Mat,
// // which represents RGBA image having 8bit for each component.
// // Type of Mat is gocv.MatTypeCV8UC4.
// ImageToMatRGBA(img image.Image) (Mat, error) {
// 	bounds := img.Bounds()
// 	x := bounds.Dx()
// 	y := bounds.Dy()
//
// 	var data []uint8
// 	switch img.ColorModel() {
// 	case color.RGBAModel:
// 		m, res := img.(*image.RGBA)
// 		if !res {
// 			return NewMat(), errors.New("Image color format error")
// 		}
// 		data = m.Pix
//
// 	case color.NRGBAModel:
// 		m, res := img.(*image.NRGBA)
// 		if !res {
// 			return NewMat(), errors.New("Image color format error")
// 		}
// 		data = m.Pix
//
// 	default:
// 		data := make([]byte, 0, x*y*3)
// 		for j := bounds.Min.Y; j < bounds.Max.Y; j++ {
// 			for i := bounds.Min.X; i < bounds.Max.X; i++ {
// 				r, g, b, _ := img.At(i, j).RGBA()
// 				data = append(data, byte(b>>8), byte(g>>8), byte(r>>8))
// 			}
// 		}
// 		return NewMatFromBytes(y, x, MatTypeCV8UC3, data)
// 	}
//
// 	// speed up the conversion process of RGBA format
// 	cvt, err := NewMatFromBytes(y, x, MatTypeCV8UC4, data)
// 	if err != nil {
// 		return NewMat(), err
// 	}
//
// 	defer cvt.Close()
//
// 	dst := NewMat()
// 	C.CvtColor(cvt, dst, c.int(ColorBGRAToRGBA))
// 	return dst, nil
// }
//
// // ImageToMatRGB converts image.Image to gocv.Mat,
// // which represents RGB image having 8bit for each component.
// // Type of Mat is gocv.MatTypeCV8UC3.
// ImageToMatRGB(img image.Image) (Mat, error) {
// 	bounds := img.Bounds()
// 	x := bounds.Dx()
// 	y := bounds.Dy()
//
// 	var data []uint8
// 	switch img.ColorModel() {
// 	case color.RGBAModel:
// 		m, res := img.(*image.RGBA)
// 		if true != res {
// 			return NewMat(), errors.New("Image color format error")
// 		}
// 		data = m.Pix
// 		// speed up the conversion process of RGBA format
// 		src, err := NewMatFromBytes(y, x, MatTypeCV8UC4, data)
// 		if err != nil {
// 			return NewMat(), err
// 		}
// 		defer src.Close()
//
// 		dst := NewMat()
// 		CvtColor(src, &dst, ColorRGBAToBGR)
// 		return dst, nil
//
// 	default:
// 		data := make([]byte, 0, x*y*3)
// 		for j := bounds.Min.Y; j < bounds.Max.Y; j++ {
// 			for i := bounds.Min.X; i < bounds.Max.X; i++ {
// 				r, g, b, _ := img.At(i, j).RGBA()
// 				data = append(data, byte(b>>8), byte(g>>8), byte(r>>8))
// 			}
// 		}
// 		return NewMatFromBytes(y, x, MatTypeCV8UC3, data)
// 	}
// }
//
// // ImageGrayToMatGray converts image.Gray to gocv.Mat,
// // which represents grayscale image 8bit.
// // Type of Mat is gocv.MatTypeCV8UC1.
// ImageGrayToMatGray(img *image.Gray) (Mat, error) {
// 	bounds := img.Bounds()
// 	x := bounds.Dx()
// 	y := bounds.Dy()
// 	m, err := NewMatFromBytes(y, x, MatTypeCV8UC1, img.Pix)
// 	if err != nil {
// 		return NewMat(), err
// 	}
// 	return m, nil
// }
//
// // Adds the square of a source image to the accumulator image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga1a567a79901513811ff3b9976923b199
// //
//
// Accumulate(src Mat, dst *Mat) {
// 	C.Mat_Accumulate(src, dst.p)
// }
//
// // Adds an image to the accumulator image with mask.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga1a567a79901513811ff3b9976923b199
// AccumulateWithMask(src Mat, dst *Mat, mask Mat) {
// 	C.Mat_AccumulateWithMask(src, dst, mask.p)
// }
//
// // Adds the square of a source image to the accumulator image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#gacb75e7ffb573227088cef9ceaf80be8c
// AccumulateSquare(src Mat, dst *Mat) {
// 	C.Mat_AccumulateSquare(src, dst.p)
// }
//
// // Adds the square of a source image to the accumulator image with mask.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#gacb75e7ffb573227088cef9ceaf80be8c
// AccumulateSquareWithMask(src Mat, dst *Mat, mask Mat) {
// 	C.Mat_AccumulateSquareWithMask(src, dst, mask.p)
// }
//
// // Adds the per-element product of two input images to the accumulator image.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga82518a940ecfda49460f66117ac82520
// AccumulateProduct(src1 Mat, src2 Mat, dst *Mat) {
// 	C.Mat_AccumulateProduct(src1, src2, dst.p)
// }
//
// // Adds the per-element product of two input images to the accumulator image with mask.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga82518a940ecfda49460f66117ac82520
// AccumulateProductWithMask(src1 Mat, src2 Mat, dst *Mat, mask Mat) {
// 	C.Mat_AccumulateProductWithMask(src1, src2, dst, mask.p)
// }
//
// // Updates a running average.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga4f9552b541187f61f6818e8d2d826bc7
// AccumulatedWeighted(src Mat, dst *Mat, alpha f64) {
// 	C.Mat_AccumulatedWeighted(src, dst, c.double(alpha))
// }
//
// // Updates a running average with mask.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d7/df3/group__imgproc__motion.html#ga4f9552b541187f61f6818e8d2d826bc7
// AccumulatedWeightedWithMask(src Mat, dst *Mat, alpha f64, mask Mat) {
// 	C.Mat_AccumulatedWeightedWithMask(src, dst, c.double(alpha), mask.p)
// }
