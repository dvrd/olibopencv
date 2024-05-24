package cv

import "core:c"
import "core:strings"

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
	Blur :: proc(src, dst: Mat, ps: CSize) ---
	BoxFilter :: proc(src, dst: Mat, ddepth: c.int, ps: CSize) ---
	SqBoxFilter :: proc(src, dst: Mat, ddepth: c.int, ps: CSize) ---
	Dilate :: proc(src, dst, kernel: Mat) ---
	DilateWithParams :: proc(src, dst, kernel: Mat, anchor: CPoint, iterations, borderType: BorderType, borderValue: Scalar) ---
	DistanceTransform :: proc(src, dst, labels: Mat, distanceType, maskSize, labelType: c.int) ---
	Erode :: proc(src, dst, kernel: Mat) ---
	ErodeWithParams :: proc(src, dst, kernel: Mat, anchor: CPoint, iterations, borderType: BorderType) ---
	ErodeWithParamsAndBorderValue :: proc(src, dst, kernel: Mat, anchor: CPoint, iterations, borderType: BorderType, borderValue: Scalar) ---
	MatchTemplate :: proc(image, templ, result: Mat, method: TemplateMatchMode, mask: Mat) ---
	Moments :: proc(src: Mat, binaryImage: c.bool) -> Moment ---
	PyrDown :: proc(src: Mat, dst: Mat, dstsize: CSize, borderType: BorderType) ---
	PyrUp :: proc(src, dst: Mat, dstsize: CSize, borderType: BorderType) ---
	BoundingRect :: proc(pts: PointVector) -> CRect ---
	BoxPoints :: proc(rect: CRotatedRect, boxPts: Mat) ---
	BoxPoints2f :: proc(rect: CRotatedRect2f, boxPts: Mat) ---
	ContourArea :: proc(pts: PointVector) -> c.double ---
	MinAreaRect :: proc(pts: PointVector) -> CRotatedRect ---
	MinAreaRect2f :: proc(pts: PointVector) -> CRotatedRect2f ---
	FitEllipse :: proc(pts: PointVector) -> CRotatedRect ---
	MinEnclosingCircle :: proc(pts: PointVector, center: ^Point2f, radius: ^c.float) ---
	FindContours :: proc(src, hierarchy: Mat, mode, method: c.int) -> PointsVector ---
	PointPolygonTest :: proc(pts: PointVector, pt: CPoint, measureDist: c.bool) -> c.double ---
	ConnectedComponents :: proc(src, dst: Mat, connectivity: c.int, ltype: Mat_Type, ccltype: CCL_AlgorithmType) -> c.int ---
	ConnectedComponentsWithStats :: proc(src: Mat, labels: Mat, stats: Mat, centroids: Mat, connectivity: c.int, ltype: Mat_Type, ccltype: CCL_AlgorithmType) -> c.int ---
	GaussianBlur :: proc(src: Mat, dst: Mat, ps: CSize, sX, sY: c.double, bt: BorderType) ---
	GetGaussianKernel :: proc(ksize: c.int, sigma: c.double, ktype: Mat_Type) -> Mat ---
	Laplacian :: proc(src, dst: Mat, dDepth: Mat_Type, kSize: c.int, scale, delta: c.double, borderType: BorderType) ---
	Scharr :: proc(src, dst: Mat, dDepth: Mat_Type, dx, dy: c.int, scale, delta: c.double, borderType: BorderType) ---
	GetStructuringElement :: proc(shape: c.int, ksize: CSize) -> Mat ---
	MorphologyDefaultBorderValue :: proc() -> Scalar ---
	MorphologyEx :: proc(src: Mat, dst: Mat, op: MorphType, kernel: Mat) ---
	MorphologyExWithParams :: proc(src: Mat, dst: Mat, op: MorphType, kernel: Mat, pt: CPoint, iterations, borderType: BorderType) ---
	MedianBlur :: proc(src: Mat, dst: Mat, ksize: c.int) ---
	Canny :: proc(src: Mat, edges: Mat, t1: c.double, t2: c.double) ---
	CornerSubPix :: proc(img: Mat, corners: Mat, winSize: CSize, zeroZone: CSize, criteria: TermCriteria) ---
	GoodFeaturesToTrack :: proc(img: Mat, corners: Mat, maxCorners: c.int, quality: c.double, minDist: c.double) ---
	GrabCut :: proc(img: Mat, mask: Mat, rect: CRect, bgdModel: Mat, fgdModel: Mat, iterCount: c.int, mode: GrabCutMode) ---
	HoughCircles :: proc(src, circles: Mat, method: HoughMode, dp, minDist: c.double) ---
	HoughCirclesWithParams :: proc(src, circles: Mat, method: HoughMode, dp, minDist, param1, param2: c.double, minRadius, maxRadius: c.int) ---
	HoughLines :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int) ---
	HoughLinesP :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int) ---
	HoughLinesPWithParams :: proc(src: Mat, lines: Mat, rho: c.double, theta: c.double, threshold: c.int, minLineLength: c.double, maxLineGap: c.double) ---
	HoughLinesPointSet :: proc(points: Mat, lines: Mat, lines_max: c.int, threshold: c.int, min_rho: c.double, max_rho: c.double, rho_step: c.double, min_theta: c.double, max_theta: c.double, theta_step: c.double) ---
	Integral :: proc(src: Mat, sum: Mat, sqsum: Mat, tilted: Mat) ---
	Threshold :: proc(src: Mat, dst: Mat, thresh, maxvalue: c.double, typ: ThresholdType) -> c.double ---
	AdaptiveThreshold :: proc(src: Mat, dst: Mat, maxValue: c.double, adaptiveTyp: c.int, typ: c.int, blockSize: c.int, const: c.double) ---
	ArrowedLine :: proc(img: Mat, pt1: CPoint, pt2: CPoint, color: Scalar, thickness: c.int) ---
	Circle :: proc(img: Mat, center: CPoint, radius: c.int, color: Scalar, thickness: c.int) ---
	CircleWithParams :: proc(img: Mat, center: CPoint, radius: c.int, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	Ellipse :: proc(img: Mat, center: CPoint, axes: CPoint, angle: c.double, startAngle: c.double, endAngle: c.double, color: Scalar, thickness: c.int) ---
	EllipseWithParams :: proc(img: Mat, center: CPoint, axes: CPoint, angle: c.double, startAngle: c.double, endAngle: c.double, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	Line :: proc(img: Mat, pt1: CPoint, pt2: CPoint, color: Scalar, thickness: c.int) ---
	Rectangle :: proc(img: Mat, rect: CRect, color: Scalar, thickness: c.int) ---
	RectangleWithParams :: proc(img: Mat, rect: CRect, color: Scalar, thickness: c.int, lineType: c.int, shift: c.int) ---
	FillPoly :: proc(img: Mat, points: PointsVector, color: Scalar) ---
	FillPolyWithParams :: proc(img: Mat, points: PointsVector, color: Scalar, lineType: c.int, shift: c.int, offset: CPoint) ---
	Polylines :: proc(img: Mat, points: PointsVector, isClosed: c.bool, color: Scalar, thickness: c.int) ---
	GetTextSize :: proc(text: cstring, fontFace: HersheyFont, fontScale: c.double, thickness: c.int) -> Size ---
	GetTextSizeWithBaseline :: proc(text: cstring, fontFace: c.int, fontScale: c.double, thickness: c.int, baseline: ^c.int) -> Size ---
	PutText :: proc(img: Mat, text: cstring, org: CPoint, fontFace: c.int, fontScale: c.double, color: Scalar, thickness: c.int) ---
	PutTextWithParams :: proc(img: Mat, text: cstring, org: CPoint, fontFace: c.int, fontScale: c.double, color: Scalar, thickness: c.int, lineType: c.int, bottomLeftOrigin: c.bool) ---
	Resize :: proc(src: Mat, dst: Mat, sz: CSize, fx: c.double, fy: c.double, interp: c.int) ---
	GetRectSubPix :: proc(src: Mat, patchSize: CSize, center: CPoint, dst: Mat) ---
	GetRotationMatrix2D :: proc(center: CPoint, angle: c.double, scale: c.double) -> Mat ---
	WarpAffine :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: CSize) ---
	WarpAffineWithParams :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: CSize, flags: c.int, borderMode: c.int, borderValue: Scalar) ---
	WarpPerspective :: proc(src: Mat, dst: Mat, m: Mat, dsize: CSize) ---
	WarpPerspectiveWithParams :: proc(src: Mat, dst: Mat, rot_mat: Mat, dsize: CSize, flags: c.int, borderMode: c.int, borderValue: Scalar) ---
	Watershed :: proc(image: Mat, markers: Mat) ---
	ApplyColorMap :: proc(src: Mat, dst: Mat, colormap: c.int) ---
	ApplyCustomColorMap :: proc(src: Mat, dst: Mat, colormap: Mat) ---
	GetPerspectiveTransform :: proc(src: PointVector, dst: PointVector) -> Mat ---
	GetPerspectiveTransform2f :: proc(src: Point2fVector, dst: Point2fVector) -> Mat ---
	GetAffineTransform :: proc(src: PointVector, dst: PointVector) -> Mat ---
	GetAffineTransform2f :: proc(src: Point2fVector, dst: Point2fVector) -> Mat ---
	FindHomography :: proc(src: Mat, dst: Mat, method: c.int, ransacReprojThreshold: c.double, mask: Mat, maxIters: c.int, confidence: c.double) -> Mat ---
	DrawContours :: proc(src: Mat, contours: PointsVector, contourIdx: c.int, color: Scalar, thickness: c.int) ---
	DrawContoursWithParams :: proc(src: Mat, contours: PointsVector, contourIdx: c.int, color: Scalar, thickness: c.int, lineType: c.int, hierarchy: Mat, maxLevel: c.int, offset: CPoint) ---
	Sobel :: proc(src: Mat, dst: Mat, ddepth: Mat_Type, dx, dy, ksize: c.int, scale, delta: c.double, borderType: BorderType) ---
	SpatialGradient :: proc(src, dx, dy: Mat, ksize: Mat_Type, borderType: BorderType) ---
	Remap :: proc(src: Mat, dst: Mat, map1: Mat, map2: Mat, interpolation: c.int, borderMode: c.int, borderValue: Scalar) ---
	Filter2D :: proc(src: Mat, dst: Mat, ddepth: c.int, kernel: Mat, anchor: CPoint, delta: c.double, borderType: BorderType) ---
	SepFilter2D :: proc(src: Mat, dst: Mat, ddepth: c.int, kernelX: Mat, kernelY: Mat, anchor: CPoint, delta: c.double, borderType: BorderType) ---
	LogPolar :: proc(src: Mat, dst: Mat, center: CPoint, m: c.double, flags: c.int) ---
	FitLine :: proc(pts: PointVector, line: Mat, distType: c.int, param: c.double, reps: c.double, aeps: c.double) ---
	LinearPolar :: proc(src: Mat, dst: Mat, center: CPoint, maxRadius: c.double, flags: c.int) ---
	MatchShapes :: proc(contour1: PointVector, contour2: PointVector, method: c.int, parameter: c.double) -> c.double ---
	ClipLine :: proc(imgSize: CSize, pt1: CPoint, pt2: CPoint) -> c.bool ---
	CLAHE_Create :: proc() -> CLAHE ---
	CLAHE_CreateWithParams :: proc(clipLimit: c.double, tileGridSize: CSize) -> CLAHE ---
	CLAHE_Close :: proc(c: CLAHE) ---
	CLAHE_Apply :: proc(c: CLAHE, src, dst: Mat) ---
	InvertAffineTransform :: proc(src: Mat, dst: Mat) ---
	PhaseCorrelate :: proc(src1: Mat, src2: Mat, window: Mat, response: ^c.double) -> Point2f ---
	CreateHanningWindow :: proc(dst: Mat, size: CSize, typ: c.int) ---
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
// For further details, please see:
// https://docs.opencv.org/master/d6/dc7/group__imgproc__hist.html#ga6ca1876785483836f72a77ced8ea759a
calc_hist :: proc(mats: Mats, chans: []int, mask, hist: Mat, sz: []int, rng: []f32, acc: bool) {
	c_chans := IntVector{cast([^]c.int)&chans[0], cast(c.int)len(chans)}
	c_sz := IntVector{cast([^]c.int)&sz[0], cast(c.int)len(sz)}
	c_rng := FloatVector{cast([^]c.float)&rng[0], cast(c.int)len(rng)}
	CalcHist(mats, c_chans, mask, hist, c_sz, c_rng, c.bool(acc))
}

// calc_back_project calculates the back projection of a histogram.
//
// For further details, please see:
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
	ChiSqrAlt    = 4, // HistCmpChiSqrAlt applies the Alternative Chi-Square (regularly used for texture comparison).
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
	pSize := CSize{c.int(imgSize.x), c.int(imgSize.y)}
	rPt1 := CPoint{c.int(pt1.x), c.int(pt1.y)}
	rPt2 := CPoint{c.int(pt2.x), c.int(pt2.y)}
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
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}
	Blur(src, dst, pSize)
	return
}

// box_filter blurs an image using the box filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gad533230ebf2d42509547d514f7d3fbc3
box_filter :: proc(src: Mat, depth: int, ksize: [2]int) -> (dst: Mat) {
	dst = new_mat()
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}
	BoxFilter(src, dst, c.int(depth), pSize)
	return
}

// sq_box_filter calculates the normalized sum of squares of the pixel values overlapping the filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga045028184a9ef65d7d2579e5c4bff6c0
sq_box_filter :: proc(src: Mat, depth: int, ksize: [2]int) -> (dst: Mat) {
	dst = new_mat()
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}
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
	cAnchor := CPoint{c.int(anchor.x), c.int(anchor.y)}
	bv := Scalar {
		c.double(borderValue.b),
		c.double(borderValue.g),
		c.double(borderValue.r),
		c.double(borderValue.a),
	}
	DilateWithParams(src, dst, kernel, cAnchor, iterations, borderType, bv)
	return
}

// DistanceTransformLabelTypes are the types of the DistanceTransform algorithm flag
DistanceTransformLabelTypes :: enum {
	// CComp assigns the same label to each connected component of zeros in the source image
	// (as well as all the non-zero pixels closest to the connected component).
	CComp,
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

// erode erodes an image by using a specific structuring element.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaeb1e0c1033e3f6b891a25d0511362aeb
erode :: proc(src, kernel: Mat) -> (dst: Mat) {
	dst = new_mat()
	Erode(src, dst, kernel)
	return
}

// erode_with_params erodes an image by using a specific structuring element.
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
	cAnchor := CPoint{c.int(anchor.x), c.int(anchor.y)}
	ErodeWithParams(src, dst, kernel, cAnchor, iterations, borderType)
	return
}

// erode_with_params_and_border_value erodes an image by using a specific structuring
// element. Same as ErodeWithParams but requires an additional borderValue
// parameter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaeb1e0c1033e3f6b891a25d0511362aeb
erode_with_params_and_border_value :: proc(
	src, kernel: Mat,
	anchor: [2]int,
	iterations, borderType: BorderType,
	borderValue: [4]f64,
) -> (
	dst: Mat,
) {
	dst = new_mat()

	cAnchor := CPoint{c.int(anchor.x), c.int(anchor.y)}

	bv := Scalar {
		c.double(borderValue[0]),
		c.double(borderValue[1]),
		c.double(borderValue[2]),
		c.double(borderValue[3]),
	}

	ErodeWithParamsAndBorderValue(src, dst, kernel, cAnchor, iterations, borderType, bv)
	return
}

// RetrievalMode is the mode of the contour retrieval algorithm.
RetrievalMode :: enum {
	// External retrieves only the extreme outer contours.
	// It sets `hierarchy[i][2]=hierarchy[i][3]=-1` for all the contours.
	External,
	// List retrieves all of the contours without establishing
	// any hierarchical relationships.
	List,
	// CComp retrieves all of the contours and organizes them into
	// a two-level hierarchy. At the top level, there are external boundaries
	// of the components. At the second level, there are boundaries of the holes.
	// If there is another contour inside a hole of a connected component, it
	// is still put at the top level.
	CComp,
	// Tree retrieves all of the contours and reconstructs a full
	// hierarchy of nested contours.
	Tree,
	// Floodfill lacks a description in the original header.
	Floodfill,
}

// ContourApproximationMode is the mode of the contour approximation algorithm.
ContourApproximationMode :: enum {
	// None stores absolutely all the contour points. That is,
	// any 2 subsequent points (x1,y1) and (x2,y2) of the contour will be
	// either horizontal, vertical or diagonal neighbors, that is,
	// max(abs(x1-x2),abs(y2-y1))==1.
	None     = 1,
	// Simple compresses horizontal, vertical, and diagonal segments
	// and leaves only their end points.
	// For example, an up-right rectangular contour is encoded with 4 points.
	Simple   = 2,
	// TC89L1 applies one of the flavors of the Teh-Chin chain
	// approximation algorithms.
	TC89L1   = 3,
	// TC89KCOS applies one of the flavors of the Teh-Chin chain
	// approximation algorithms.
	TC89KCOS = 4,
}

Point :: distinct [2]int

to_cpoints :: proc(pts: []Point) -> CPoints {
	return {cast([^]CPoint)&pts[0], cast(c.int)len(pts)}
}

Size :: struct {
	height, width: int,
}
Rect :: struct {
	min, max: Point,
}

// Rect is shorthand for [Rectangle]{Pt(x0, y0), [Pt](x1, y1)}. The returned
// rectangle has minimum and maximum coordinates swapped if necessary so that
// it is well-formed.
new_rect :: proc(x0, y0, x1, y1: int) -> Rect {
	x0 := x0;y0 := y0;x1 := x1;y1 := y1

	if x0 > x1 {
		x0, x1 = x1, x0
	}
	if y0 > y1 {
		y0, y1 = y1, y0
	}
	return Rect{Point{x0, y0}, Point{x1, y1}}
}

rect_size :: proc(r: Rect) -> Size {
	return {r.max.x - r.min.x, r.max.y - r.min.y}
}

// bounding_rect calculates the up-right bounding rectangle of a point set.
//
// For further details, please see:
// https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gacb413ddce8e48ff3ca61ed7cf626a366
bounding_rect :: proc(contour: PointVector) -> Rect {
	r := BoundingRect(contour)
	return new_rect(cast(int)r.x, cast(int)r.y, cast(int)r.width, cast(int)r.height)
}

RotatedRect :: struct {
	pts:           []Point,
	bounding_rect: Rect,
	center:        Point,
	size:          Size,
	angle:         f64,
}

// box_points finds the four vertices of a rotated rect. Useful to draw the rotated rectangle.
//
// For further Details, please see:
// https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gaf78d467e024b4d7936cf9397185d2f5c
box_points :: proc(rect: RotatedRect, pts: Mat) {
	rRect := CRect {
		cast(c.int)rect.bounding_rect.min.x,
		cast(c.int)rect.bounding_rect.min.y,
		cast(c.int)(rect_size(rect.bounding_rect).width),
		cast(c.int)(rect_size(rect.bounding_rect).height),
	}

	rCenter := CPoint{cast(c.int)rect.center.x, cast(c.int)rect.center.y}

	rSize := CSize{cast(c.int)rect.size.width, cast(c.int)rect.size.height}

	r := CRotatedRect {
		pts          = {cast([^]CPoint)&rect.pts[0], cast(c.int)len(rect.pts)},
		boundingRect = rRect,
		center       = rCenter,
		size         = rSize,
		angle        = rect.angle,
	}

	BoxPoints(r, pts)
}

Point2f :: distinct [2]f32

to_cpoints_2f :: proc(pts: []Point2f) -> CPoints2f {
	return {cast([^]CPoint2f)&pts[0], cast(c.int)len(pts)}
}

Size2f :: struct {
	width, height: f32,
}

RotatedRect2f :: struct {
	pts:           []Point2f,
	bounding_rect: Rect,
	center:        Point2f,
	size:          Size2f,
	angle:         f64,
}

// box_points_2f finds the four vertices of a rotated rect. Useful to draw the rotated rectangle.
//
// For further Details, please see:
// https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#gaf78d467e024b4d7936cf9397185d2f5c
box_points_2f :: proc(rect: RotatedRect2f, pts: Mat) {
	rRect := CRect {
		c.int(rect.bounding_rect.min.x),
		c.int(rect.bounding_rect.min.y),
		c.int(rect.bounding_rect.max.x - rect.bounding_rect.min.x),
		c.int(rect.bounding_rect.max.y - rect.bounding_rect.min.y),
	}

	r := CRotatedRect2f {
		pts          = to_cpoints_2f(rect.pts),
		boundingRect = rRect,
		center       = cast(CPoint2f)rect.center,
		size         = cast(CSize2f)rect.size,
		angle        = rect.angle,
	}

	BoxPoints2f(r, pts)
}

// contour_area calculates a contour area.
//
// For further details, please see:
// https://docs.opencv.org/3.3.0/d3/dc0/group__imgproc__shape.html#ga2c759ed9f497d4a618048a2f56dc97f1
contour_area :: proc(contour: PointVector) -> f64 {
	result := ContourArea(contour)
	return f64(result)
}

// to_points converts CPoints to []Point
to_points :: proc(cpoints: CPoints) -> (pts: []Point) {
	p_array := cpoints.points
	p_length := int(cpoints.length)

	pts = make([]Point, p_length)
	for pt, idx in p_array[:p_length] {
		pts[idx] = {int(pt.x), int(pt.y)}
	}

	return
}

// to_points_2f converts CPoints2f to []Point2f
to_points_2f :: proc(cpoints: CPoints2f) -> (pts: []Point2f) {
	p_array := cpoints.points
	p_length := int(cpoints.length)

	pts = make([]Point2f, p_length)
	for pt, idx in p_array[:p_length] {
		pts[idx] = cast(Point2f)pt
	}
	return
}

// min_area_rect finds a rotated rectangle of the minimum area enclosing the input 2D point set.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga3d476a3417130ae5154aea421ca7ead9
min_area_rect :: proc(points: PointVector) -> RotatedRect {
	result := MinAreaRect(points)
	defer points_close(result.pts)

	return RotatedRect {
		pts = to_points(result.pts),
		bounding_rect = new_rect(
			int(result.boundingRect.x),
			int(result.boundingRect.y),
			int(result.boundingRect.x + result.boundingRect.width),
			int(result.boundingRect.y + result.boundingRect.height),
		),
		center = {int(result.center.x), int(result.center.y)},
		size = {int(result.size.width), int(result.size.height)},
		angle = f64(result.angle),
	}
}

// min_area_rect_2f finds a rotated rectangle of the minimum area enclosing the input 2D point set.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga3d476a3417130ae5154aea421ca7ead9
min_area_rect_2f :: proc(points: PointVector) -> RotatedRect2f {
	result := MinAreaRect2f(points)
	defer points2f_close(result.pts)

	return RotatedRect2f {
		pts = to_points_2f(result.pts),
		bounding_rect = new_rect(
			int(result.boundingRect.x),
			int(result.boundingRect.y),
			int(result.boundingRect.x + result.boundingRect.width),
			int(result.boundingRect.y + result.boundingRect.height),
		),
		center = cast(Point2f)result.center,
		size = cast(Size2f)result.size,
		angle = result.angle,
	}
}

// fit_ellipse Fits an ellipse around a set of 2D points.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaf259efaad93098103d6c27b9e4900ffa
fit_ellipse :: proc(pts: PointVector) -> RotatedRect {
	result := FitEllipse(pts)
	defer points_close(result.pts)

	return RotatedRect {
		pts = to_points(result.pts),
		bounding_rect = new_rect(
			int(result.boundingRect.x),
			int(result.boundingRect.y),
			int(result.boundingRect.x) + int(result.boundingRect.width),
			int(result.boundingRect.y) + int(result.boundingRect.height),
		),
		center = {int(result.center.x), int(result.center.y)},
		size = {int(result.size.width), int(result.size.height)},
		angle = f64(result.angle),
	}
}

// min_enclosing_circle finds a circle of the minimum area enclosing the input 2D point set.
//
// For further details, please see:
// https://docs.opencv.org/3.4/d3/dc0/group__imgproc__shape.html#ga8ce13c24081bbc7151e9326f412190f1
min_enclosing_circle :: proc(pts: PointVector) -> (x, y, radius: f32) {
	cCenterPoint: Point2f
	cRadius: c.float
	MinEnclosingCircle(pts, &cCenterPoint, &cRadius)
	x, y = cCenterPoint.x, cCenterPoint.y
	radius = cRadius
	return x, y, radius
}

// find_contours finds contours in a binary image.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga95f5b48d01abc7c2e0732db24689837b
find_contours :: proc(
	src: Mat,
	mode: RetrievalMode,
	method: ContourApproximationMode,
) -> PointsVector {
	hierarchy := new_mat()
	defer delete_mat(hierarchy)
	return find_contours_with_params(src, hierarchy, mode, method)
}

// find_contours_with_params finds contours in a binary image.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga17ed9f5d79ae97bd4c7cf18403e1689a
find_contours_with_params :: proc(
	src: Mat,
	hierarchy: Mat,
	mode: RetrievalMode,
	method: ContourApproximationMode,
) -> PointsVector {
	return FindContours(src, hierarchy, cast(c.int)mode, cast(c.int)method)
}

// point_polygon_test performs a point-in-contour test.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga1a539e8db2135af2566103705d7a5722
point_polygon_test :: proc(pts: PointVector, pt: Point, measureDist: bool) -> f64 {
	cp := CPoint{c.int(pt.x), c.int(pt.y)}
	return f64(PointPolygonTest(pts, cp, c.bool(measureDist)))
}

// CCL_AlgorithmType specifies the type for ConnectedComponents
CCL_AlgorithmType :: enum c.int {
	WU, // SAUF algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity.
	DEFAULT, // BBDT algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity.
	GRANA, // BBDT algorithm for 8-way connectivity, SAUF algorithm for 4-way connectivity
}

// connected_components computes the connected components labeled image of boolean image.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaedef8c7340499ca391d459122e51bef5
connected_components :: proc(src, labels: Mat) -> int {
	return int(ConnectedComponents(src, labels, 8, .CV_32S, .DEFAULT))
}

// connected_components_with_params computes the connected components labeled image of boolean image.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#gaedef8c7340499ca391d459122e51bef5
connected_components_with_params :: proc(
	src, labels: Mat,
	conn: int,
	ltype: Mat_Type,
	ccltype: CCL_AlgorithmType,
) -> int {
	return int(ConnectedComponents(src, labels, c.int(conn), ltype, ccltype))
}

// Connected Components StatTypes are the connected components algorithm output formats
CCL_StatTypes :: enum {
	LEFT, //The leftmost (x) coordinate which is the inclusive start of the bounding box in the horizontal direction.
	TOP, //The topmost (y) coordinate which is the inclusive start of the bounding box in the vertical direction.
	WIDTH, // The horizontal size of the bounding box.
	HEIGHT, // The vertical size of the bounding box.
	AREA, // The total area (in pixels) of the connected component.
	MAX,
}

// connected_components_with_stats computes the connected components labeled image of boolean
// image and also produces a statistics output for each label.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga107a78bf7cd25dec05fb4dfc5c9e765f
connected_components_with_stats :: proc(src, labels, stats, centroids: Mat) -> int {
	return int(ConnectedComponentsWithStats(src, labels, stats, centroids, 8, .CV_32S, .DEFAULT))
}

// connected_components_with_stats_with_params computes the connected components labeled image of boolean
// image and also produces a statistics output for each label.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga107a78bf7cd25dec05fb4dfc5c9e765f
connected_components_with_stats_with_params :: proc(
	src, labels, stats, centroids: Mat,
	conn: int,
	ltype: Mat_Type,
	ccltype: CCL_AlgorithmType,
) -> int {
	return int(
		ConnectedComponentsWithStats(src, labels, stats, centroids, c.int(conn), ltype, ccltype),
	)
}

// TemplateMatchMode is the type of the template matching operation.
TemplateMatchMode :: enum {
	TmSqdiff, // TmSqdiff maps to TM_SQDIFF
	TmSqdiffNormed, // TmSqdiffNormed maps to TM_SQDIFF_NORMED
	TmCcorr, // TmCcorr maps to TM_CCORR
	TmCcorrNormed, // TmCcorrNormed maps to TM_CCORR_NORMED
	TmCcoeff, // TmCcoeff maps to TM_CCOEFF
	TmCcoeffNormed, // TmCcoeffNormed maps to TM_CCOEFF_NORMED
}

// match_template compares a template against overlapped image regions.
//
// For further details, please see:
// https://docs.opencv.org/master/df/dfb/group__imgproc__object.html#ga586ebfb0a7fb604b35a23d85391329be
match_template :: proc(image, templ, result: Mat, method: TemplateMatchMode, mask: Mat) {
	MatchTemplate(image, templ, result, method, mask)
}

// moments calculates all of the moments up to the third order of a polygon
// or rasterized shape.
//
// For further details, please see:
// https://docs.opencv.org/master/d3/dc0/group__imgproc__shape.html#ga556a180f43cab22649c23ada36a8a139
moments :: proc(src: Mat, binaryImage: bool) -> map[string]f64 {
	r := Moments(src, c.bool(binaryImage))

	result := make(map[string]f64)
	result["m00"] = f64(r.m00)
	result["m10"] = f64(r.m10)
	result["m01"] = f64(r.m01)
	result["m20"] = f64(r.m20)
	result["m11"] = f64(r.m11)
	result["m02"] = f64(r.m02)
	result["m30"] = f64(r.m30)
	result["m21"] = f64(r.m21)
	result["m12"] = f64(r.m12)
	result["m03"] = f64(r.m03)
	result["mu20"] = f64(r.mu20)
	result["mu11"] = f64(r.mu11)
	result["mu02"] = f64(r.mu02)
	result["mu30"] = f64(r.mu30)
	result["mu21"] = f64(r.mu21)
	result["mu12"] = f64(r.mu12)
	result["mu03"] = f64(r.mu03)
	result["nu20"] = f64(r.nu20)
	result["nu11"] = f64(r.nu11)
	result["nu02"] = f64(r.nu02)
	result["nu30"] = f64(r.nu30)
	result["nu21"] = f64(r.nu21)
	result["nu12"] = f64(r.nu12)
	result["nu03"] = f64(r.nu03)

	return result
}

// pyr_down blurs an image and downsamples it.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaf9bba239dfca11654cb7f50f889fc2ff
pyr_down :: proc(src: Mat, ksize: Point, borderType: BorderType) -> (dst: Mat) {
	dst = new_mat()
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}
	PyrDown(src, dst, pSize, borderType)
	return
}

// pyr_up upsamples an image and then blurs it.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gada75b59bdaaca411ed6fee10085eb784
pyr_up :: proc(src: Mat, ksize: Point, borderType: BorderType) -> (dst: Mat) {
	dst = new_mat()
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}
	PyrUp(src, dst, pSize, borderType)
	return
}

// morphology_default_border_value returns "magic" border value for erosion and dilation.
// It is automatically transformed to Scalar::all(-DBL_MAX) for dilation.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga94756fad83d9d24d29c9bf478558c40a
morphology_default_border_value :: proc() -> Scalar {
	return MorphologyDefaultBorderValue()
}

// morphology_ex performs advanced morphological transformations.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga67493776e3ad1a3df63883829375201f
morphology_ex :: proc(src: Mat, op: MorphType, kernel: Mat) -> (dst: Mat) {
	dst = new_mat()
	MorphologyEx(src, dst, op, kernel)
	return
}

// morphology_ex_with_params performs advanced morphological transformations.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga67493776e3ad1a3df63883829375201f
morphology_ex_with_params :: proc(
	src: Mat,
	op: MorphType,
	kernel: Mat,
	iterations, borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	pt := CPoint{-1, -1}
	MorphologyExWithParams(src, dst, op, kernel, pt, iterations, borderType)
	return
}

// MorphShape is the shape of the structuring element used for Morphing operations.
MorphShape :: enum {
	Rect, // MorphRect is the rectangular morph shape.
	Cross, // MorphCross is the cross morph shape.
	Ellipse, // MorphEllipse is the ellipse morph shape.
}

// get_structuring_element returns a structuring element of the specified size
// and shape for morphological operations.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac342a1bb6eabf6f55c803b09268e36dc
get_structuring_element :: proc(shape: MorphShape, ksize: Point) -> Mat {
	sz := CSize{c.int(ksize.x), c.int(ksize.y)}
	return GetStructuringElement(c.int(shape), sz)
}

// MorphType type of morphological operation.
MorphType :: enum {
	Erode, // MorphErode operation
	Dilate, // MorphDilate operation
	Open, // MorphOpen operation
	Close, // MorphClose operation
	Gradient, // MorphGradient operation
	Tophat, // MorphTophat operation
	Blackhat, // MorphBlackhat operation
	Hitmiss, // MorphHitmiss operation
}

// gaussian_blur blurs an image Mat using a Gaussian filter.
// The function convolves the src Mat image into the dst Mat using
// the specified Gaussian kernel params.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaabe8c836e97159a9193fb0b11ac52cf1
gaussian_blur :: proc(
	src: Mat,
	ksize: Point,
	sigmaX, sigmaY: f64,
	borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	pSize := CSize{c.int(ksize.x), c.int(ksize.y)}

	GaussianBlur(src, dst, pSize, sigmaX, sigmaY, borderType)
	return
}

// get_gaussian_kernel returns Gaussian filter coefficients.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac05a120c1ae92a6060dd0db190a61afa
get_gaussian_kernel :: proc(ksize: int, sigma: f64) -> (m: Mat) {
	return GetGaussianKernel(c.int(ksize), sigma, .CV_64F)
}

// get_gaussian_kernel_with_params returns Gaussian filter coefficients.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gac05a120c1ae92a6060dd0db190a61afa
get_gaussian_kernel_with_params :: proc(ksize: int, sigma: f64, ktype: Mat_Type) -> Mat {
	return GetGaussianKernel(c.int(ksize), sigma, ktype)
}

// sobel calculates the first, second, third, or mixed image derivatives using an extended Sobel operator
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gacea54f142e81b6758cb6f375ce782c8d
sobel :: proc(
	src: Mat,
	ddepth: Mat_Type,
	dx, dy, ksize: int,
	scale, delta: f64,
	borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	Sobel(src, dst, ddepth, c.int(dx), c.int(dy), c.int(ksize), scale, delta, borderType)
	return
}

// spatial_gradient calculates the first order image derivative in both x and y using a Sobel operator.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga405d03b20c782b65a4daf54d233239a2
spatial_gradient :: proc(src, dx, dy: Mat, ksize: Mat_Type, borderType: BorderType) {
	SpatialGradient(src, dx, dy, ksize, borderType)
}

// laplacian calculates the Laplacian of an image.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gad78703e4c8fe703d479c1860d76429e6
laplacian :: proc(
	src: Mat,
	dDepth: Mat_Type,
	size: int,
	scale, delta: f64,
	borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	Laplacian(src, dst, dDepth, c.int(size), scale, delta, borderType)
	return
}

// scharr calculates the first x- or y- image derivative using Scharr operator.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#gaa13106761eedf14798f37aa2d60404c9
scharr :: proc(
	src: Mat,
	dDepth: Mat_Type,
	dx, dy: int,
	scale, delta: f64,
	borderType: BorderType,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	Scharr(src, dst, dDepth, c.int(dx), c.int(dy), scale, delta, borderType)
	return
}

// median_blur blurs an image using the median filter.
//
// For further details, please see:
// https://docs.opencv.org/master/d4/d86/group__imgproc__filter.html#ga564869aa33e58769b4469101aac458f9
median_blur :: proc(src: Mat, ksize: int) -> (dst: Mat) {
	dst = new_mat()
	MedianBlur(src, dst, c.int(ksize))
	return
}

// canny finds edges in an image using the Canny algorithm.
// The function finds edges in the input image image and marks
// them in the output map edges using the Canny algorithm.
// The smallest value between threshold1 and threshold2 is used
// for edge linking. The largest value is used to
// find initial segments of strong edges.
// See http://en.wikipedia.org/wiki/Canny_edge_detector
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga04723e007ed888ddf11d9ba04e2232de
canny :: proc(src, edges: Mat, t1, t2: f64) {
	Canny(src, edges, t1, t2)
}

// corner_sub_pix Refines the corner locations. The function iterates to find
// the sub-pixel accurate location of corners or radial saddle points.
//
// For further details, please see:
// https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga354e0d7c86d0d9da75de9b9701a9a87e
corner_sub_pix :: proc(img, corners: Mat, winSize, zeroZone: Point, criteria: TermCriteria) {
	winSz := CSize{c.int(winSize.x), c.int(winSize.y)}
	zeroSz := CSize{c.int(zeroZone.x), c.int(zeroZone.y)}

	CornerSubPix(img, corners, winSz, zeroSz, criteria)
}

// good_features_to_track determines strong corners on an image. The function
// finds the most prominent corners in the image or in the specified image region.
//
// For further details, please see:
// https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga1d6bb77486c8f92d79c8793ad995d541
good_features_to_track :: proc(img, corners: Mat, maxCorners: int, quality, minDist: f64) {
	GoodFeaturesToTrack(img, corners, c.int(maxCorners), quality, minDist)
}

// GrabCutMode is the flag for GrabCut algorithm.
GrabCutMode :: enum {
	// GCInitWithRect makes the function initialize the state and the mask using the provided rectangle.
	// After that it runs the itercount iterations of the algorithm.
	InitWithRect,
	// GCInitWithMask makes the function initialize the state using the provided mask.
	// GCInitWithMask and GCInitWithRect can be combined.
	// Then all the pixels outside of the ROI are automatically initialized with GC_BGD.
	InitWithMask,
	// GCEval means that the algorithm should just resume.
	Eval,
	// GCEvalFreezeModel means that the algorithm should just run a single iteration of the GrabCut algorithm
	// with the fixed model
	EvalFreezeModel,
}

// grab_cut runs the GrabCut algorithm.
// The function implements the GrabCut image segmentation algorithm.
// For further details, please see:
// https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga909c1dda50efcbeaa3ce126be862b37f
grab_cut :: proc(
	img, mask: Mat,
	r: Rect,
	bgdModel, fgdModel: Mat,
	iterCount: int,
	mode: GrabCutMode,
) {
	cRect := CRect {
		x      = c.int(r.min.x),
		y      = c.int(r.min.y),
		width  = c.int(r.max.x - r.min.x),
		height = c.int(r.max.y - r.min.y),
	}

	GrabCut(img, mask, cRect, bgdModel, fgdModel, c.int(iterCount), mode)
}

// HoughMode is the type for Hough transform variants.
HoughMode :: enum {
	// HoughStandard is the classical or standard Hough transform.
	Standard,
	// HoughProbabilistic is the probabilistic Hough transform (more efficient
	// in case if the picture contains a few long linear segments).
	Probabilistic,
	// HoughMultiScale is the multi-scale variant of the classical Hough
	// transform.
	MultiScale,
	// HoughGradient is basically 21HT, described in: HK Yuen, John Princen,
	// John Illingworth, and Josef Kittler. Comparative study of hough
	// transform methods for circle finding. Image and Vision Computing,
	// 8(1):71–77, 1990.
	Gradient,
}

// hough_circles finds circles in a grayscale image using the Hough transform.
// The only "method" currently supported is HoughGradient. If you want to pass
// more parameters, please see `HoughCirclesWithParams`.
//
// For further details, please see:
// https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga47849c3be0d0406ad3ca45db65a25d2d
hough_circles :: proc(src, circles: Mat, method: HoughMode, dp, minDist: f64) {
	HoughCircles(src, circles, method, dp, minDist)
}

// hough_circles_with_params finds circles in a grayscale image using the Hough
// transform. The only "method" currently supported is HoughGradient.
//
// For further details, please see:
// https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga47849c3be0d0406ad3ca45db65a25d2d
hough_circles_with_params :: proc(
	src, circles: Mat,
	method: HoughMode,
	dp, minDist, param1, param2: f64,
	minRadius, maxRadius: int,
) {
	HoughCirclesWithParams(
		src,
		circles,
		method,
		dp,
		minDist,
		param1,
		param2,
		c.int(minRadius),
		c.int(maxRadius),
	)
}

// hough_lines implements the standard or standard multi-scale Hough transform
// algorithm for line detection. For a good explanation of Hough transform, see:
// http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga46b4e588934f6c8dfd509cc6e0e4545a
hough_lines :: proc(src, lines: Mat, rho, theta: f64, threshold: int) {
	HoughLines(src, lines, rho, theta, c.int(threshold))
}

// hough_lines_p implements the probabilistic Hough transform
// algorithm for line detection. For a good explanation of Hough transform, see:
// http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
//
// For further details, please see:
// http://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga8618180a5948286384e3b7ca02f6feeb
hough_lines_p :: proc(src, lines: Mat, rho, theta: f64, threshold: int) {
	HoughLinesP(src, lines, rho, theta, c.int(threshold))
}

hough_lines_p_with_params :: proc(
	src, lines: Mat,
	rho, theta: f64,
	threshold: int,
	minLineLength, maxLineGap: f64,
) {
	HoughLinesPWithParams(src, lines, rho, theta, c.int(threshold), minLineLength, maxLineGap)
}

// hough_lines_point_set implements the Hough transform algorithm for line
// detection on a set of points. For a good explanation of Hough transform, see:
// http://homepages.inf.ed.ac.uk/rbf/HIPR2/hough.htm
//
// For further details, please see:
// https://docs.opencv.org/master/dd/d1a/group__imgproc__feature.html#ga2858ef61b4e47d1919facac2152a160e
hough_lines_point_set :: proc(
	pts, lines: Mat,
	linesMax, threshold: int,
	minRho, maxRho, rhoStep, minTheta, maxTheta, thetaStep: f64,
) {
	HoughLinesPointSet(
		pts,
		lines,
		c.int(linesMax),
		c.int(threshold),
		minRho,
		maxRho,
		rhoStep,
		minTheta,
		maxTheta,
		thetaStep,
	)
}

// integral calculates one or more integral images for the source image.
// For further details, please see:
// https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga97b87bec26908237e8ba0f6e96d23e28
integral :: proc(src, sum, sqsum, tilted: Mat) {
	integral(src, sum, sqsum, tilted)
}

// ThresholdType type of threshold operation.
ThresholdType :: enum {
	Binary, // ThresholdBinary threshold type
	BinaryInv, // ThresholdBinaryInv threshold type
	Trunc, // ThresholdTrunc threshold type
	ToZero, // ThresholdToZero threshold type
	ToZeroInv, // ThresholdToZeroInv threshold type
	Mask, // ThresholdMask threshold type
	Otsu, // ThresholdOtsu threshold type
	Triangle, // ThresholdTriangle threshold type
}

// threshold applies a fixed-level threshold to each array element.
//
// For further details, please see:
// https://docs.opencv.org/3.3.0/d7/d1b/group__imgproc__misc.html#gae8a4a146d1ca78c626a53577199e9c57
threshold :: proc(
	src: Mat,
	thresh, maxvalue: f64,
	typ: ThresholdType,
) -> (
	dst: Mat,
	threshold: f64,
) {
	dst = new_mat()
	threshold = Threshold(src, dst, thresh, maxvalue, typ)
	return
}

// AdaptiveThresholdType type of adaptive threshold operation.
AdaptiveThresholdType :: enum {
	Mean,
	Gaussian,
}

// adaptive_threshold applies a fixed-level threshold to each array element.
//
// For further details, please see:
// https://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga72b913f352e4a1b1b397736707afcde3
adaptive_threshold :: proc(
	src: Mat,
	maxValue: f64,
	adaptiveTyp: AdaptiveThresholdType,
	typ: ThresholdType,
	blockSize: int,
	const: f64,
) -> (
	dst: Mat,
) {
	dst = new_mat()
	AdaptiveThreshold(src, dst, maxValue, c.int(adaptiveTyp), c.int(typ), c.int(blockSize), const)
	return
}

// arrowed_line draws a arrow segment pointing from the first point
// to the second one.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga0a165a3ca093fd488ac709fdf10c05b2
arrowed_line :: proc(img: Mat, pt1, pt2: Point, const: RGBA, thickness: int) {
	sp1 := CPoint{c.int(pt1.x), c.int(pt1.y)}
	sp2 := CPoint{c.int(pt2.x), c.int(pt2.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}
	ArrowedLine(img, sp1, sp2, sColor, c.int(thickness))
}

// circle draws a circle.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf10604b069374903dbd0f0488cb43670
circle :: proc(img: Mat, center: Point, radius: int, const: RGBA, thickness: int) {
	pc := CPoint{c.int(center.x), c.int(center.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}
	Circle(img, pc, c.int(radius), sColor, c.int(thickness))
}

// circle_with_params draws a circle.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#gaf10604b069374903dbd0f0488cb43670
circle_with_params :: proc(
	img: Mat,
	center: Point,
	radius: int,
	const: RGBA,
	thickness: int,
	lineType: LineType,
	shift: int,
) {
	pc := CPoint{c.int(center.x), c.int(center.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}

	CircleWithParams(
		img,
		pc,
		c.int(radius),
		sColor,
		c.int(thickness),
		c.int(lineType),
		c.int(shift),
	)
}

// ellipse draws a simple or thick elliptic arc or fills an ellipse sector.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga28b2267d35786f5f890ca167236cbc69
ellipse :: proc(
	img: Mat,
	center, axes: Point,
	angle, startAngle, endAngle: f64,
	const: RGBA,
	thickness: int,
) {
	pc := CPoint{c.int(center.x), c.int(center.y)}
	pa := CPoint{c.int(axes.x), c.int(axes.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}
	Ellipse(img, pc, pa, angle, startAngle, endAngle, sColor, c.int(thickness))
}

// ellipse_with_params draws a simple or thick elliptic arc or fills an ellipse sector.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga28b2267d35786f5f890ca167236cbc69
ellipse_with_params :: proc(
	img: Mat,
	center, axes: Point,
	angle, startAngle, endAngle: f64,
	const: RGBA,
	thickness: int,
	lineType: LineType,
	shift: int,
) {
	pc := CPoint{c.int(center.x), c.int(center.y)}
	pa := CPoint{c.int(axes.x), c.int(axes.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}

	EllipseWithParams(
		img,
		pc,
		pa,
		angle,
		startAngle,
		endAngle,
		sColor,
		c.int(thickness),
		c.int(lineType),
		c.int(shift),
	)
}

// line draws a line segment connecting two points.
//
// For further details, please see:
// https://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga7078a9fae8c7e7d13d24dac2520ae4a2
line :: proc(img: Mat, pt1, pt2: Point, const: RGBA, thickness: int) {
	sp1 := CPoint{c.int(pt1.x), c.int(pt1.y)}
	sp2 := CPoint{c.int(pt2.x), c.int(pt2.y)}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}
	Line(img, sp1, sp2, sColor, c.int(thickness))
}

// Rectangle draws a simple, thick, or filled up-right rectangle.
// It renders a rectangle with the desired characteristics to the target Mat image.
//
// For further details, please see:
// http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga346ac30b5c74e9b5137576c9ee9e0e8c
rectangle :: proc(img: Mat, r: Rect, const: RGBA, thickness: int) {
	cRect := CRect {
		c.int(r.min.x),
		c.int(r.min.y),
		c.int(rect_size(r).width),
		c.int(rect_size(r).height),
	}
	sColor := Scalar{c.double(const.b), c.double(const.g), c.double(const.r), c.double(const.a)}
	Rectangle(img, cRect, sColor, c.int(thickness))
}

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
// 	offset := Point{
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
// 	C.FillPolyWithParams(img, pts, sColor, c.int(lineType), C.int(shift), offset)
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

// HersheyFont are the font libraries included in OpenCV.
// Only a subset of the available Hershey fonts are supported by OpenCV.
//
// For more information, see:
// http://sources.isc.org/utils/misc/hershey-font.txt
HersheyFont :: enum {
	Simplex, // FontHersheySimplex is normal size sans-serif font.
	Plain, // FontHersheyPlain issmall size sans-serif font.
	Duplex, // FontHersheyDuplex normal size sans-serif font (more complex than FontHersheySIMPLEX).
	Complex, // FontHersheyComplex i a normal size serif font.
	Triplex, // FontHersheyTriplex is a normal size serif font (more complex than FontHersheyCOMPLEX).
	ComplexSmall, // FontHersheyComplexSmall is a smaller version of FontHersheyCOMPLEX.
	ScriptSimplex, // FontHersheyScriptSimplex is a hand-writing style font.
	ScriptComplex, // FontHersheyScriptComplex is a more complex variant of FontHersheyScriptSimplex.
	Italic = 16, // FontItalic is the flag for italic font.
}

// LineType are the line libraries included in OpenCV.
//
// For more information, see:
// https://vovkos.github.io/doxyrest-showcase/opencv/sphinx_rtd_theme/enum_cv_LineTypes.html
LineType :: enum {
	Filled      = -1, // Filled line
	Four        = 4, // 4-connected line
	Eigth       = 8, // 8-connected line
	Antialiased = 16, // kntialiased line
}

// get_text_size calculates the width and height of a text string.
// It returns an image.Point with the size required to draw text using
// a specific font face, scale, and thickness.
//
// For further details, please see:
// http://docs.opencv.org/master/d6/d6e/group__imgproc__draw.html#ga3d2abfcb995fd2db908c8288199dba82
get_text_size :: proc(
	text: string,
	fontFace: HersheyFont,
	fontScale: f64,
	thickness: int,
) -> Point {
	c_text := strings.clone_to_cstring(text)
	defer delete(c_text)


	sz := GetTextSize(c_text, fontFace, fontScale, c.int(thickness))
	return {int(sz.width), int(sz.height)}
}

// // GetTextSizeWithBaseline calculates the width and height of a text string including the baseline of the text.
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
// 	offset := Point{
// 		x: c.int(offset.X),
// 		y: c.int(offset.Y),
// 	}
//
// 	C.DrawContoursWithParams(img, contours, c.int(contourIdx), sColor, C.int(thickness), C.int(lineType), hierarchy, C.int(maxLevel), offset)
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
