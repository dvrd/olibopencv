package cv

import "core:c"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

Mat_Channel1 :: 0
Mat_Channel2 :: 8
Mat_Channel3 :: 16
Mat_Channel4 :: 24

// Wrapper for std::vector<string>
CStrings :: struct {
	strs:   [^]cstring,
	length: c.int,
}

// Wrapper for std::vector<char>
ByteArray :: struct {
	data:   [^]byte,
	length: c.int,
}

// Wrapper for std::vector<int>
IntVector :: struct {
	val:    [^]c.int,
	length: c.int,
}

// Wrapper for std::vector<float>
FloatVector :: struct {
	val:    [^]c.float,
	length: c.int,
}

RawData :: struct {
	width:  c.int,
	height: c.int,
	data:   ByteArray,
}

// Wrapper for an individual cv::Point2f
Point2f :: struct {
	x: c.float,
	y: c.float,
}

Point3f :: struct {
	x: c.float,
	y: c.float,
	z: c.float,
}

// Wrapper for an individual cv::cvPoint
Point :: struct {
	x: c.int,
	y: c.int,
}

// Wrapper for the vector of Point structs aka std::vector<Point>
Points :: struct {
	points: [^]Point,
	length: c.int,
}

// Wrapper for the vector of Point2f structs aka std::vector<Point2f>
Points2f :: struct {
	points: [^]Point2f,
	length: c.int,
}

Points3f :: struct {
	points: [^]Point3f,
	length: c.int,
}

// Contour is alias for Points
Contour :: Points

// Contour2f is alias for Points2f
Contour2f :: Points2f

Contours2f :: struct {
	points: [^]Contour2f,
	length: c.int,
}

// Contour3f is alias for Points3f
Contour3f :: Points3f

// Wrapper for the vector of Points3f vectors aka std::vector<
// std::vector<Point3f> >
Contours3f :: struct {
	points: [^]Contours3f,
	length: c.int,
}

// Wrapper for the vector of Points vectors aka std::vector< std::vector<Point>
// >
Contours :: struct {
	points: [^]Contours,
	length: c.int,
}

// Wrapper for an individual cv::cvRect
Rect :: struct {
	x:      c.int,
	y:      c.int,
	width:  c.int,
	height: c.int,
}

// Wrapper for the vector of Rect struct aka std::vector<Rect>
Rects :: struct {
	points: [^]Rect,
	length: c.int,
}

// Wrapper for an individual cv::cvSize
Size :: struct {
	width:  c.int,
	height: c.int,
}

// Wrapper for an individual cv::cvSize
Size2f :: struct {
	width:  c.float,
	height: c.float,
}

// Wrapper for an individual cv::RotatedRect
RotatedRect :: struct {
	pts:          Points,
	boundingRect: Rect,
	center:       Point,
	size:         Size,
	angle:        c.double,
}

// Wrapper for an individual cv::RotatedRect
RotatedRect2f :: struct {
	pts:          Points2f,
	boundingRect: Rect,
	center:       Point2f,
	size:         Size2f,
	angle:        c.double,
}

// Wrapper for an individual cv::cvScalar
Scalar :: struct {
	val1: c.double,
	val2: c.double,
	val3: c.double,
	val4: c.double,
}

// Wrapper for a individual cv::KeyPoint
KeyPoint :: struct {
	x:        c.double,
	y:        c.double,
	size:     c.double,
	angle:    c.double,
	response: c.double,
	octave:   c.int,
	classID:  c.int,
}

// Wrapper for the vector of KeyPoint struct aka std::vector<KeyPoint>
KeyPoints :: struct {
	keypoints: [^]KeyPoint,
	length:    c.int,
}

// Wrapper for SimpleBlobDetectorParams aka SimpleBlobDetector::Params
SimpleBlobDetectorParams :: struct {
	blobColor:           c.uchar,
	filterByArea:        c.bool,
	filterByCircularity: c.bool,
	filterByColor:       c.bool,
	filterByConvexity:   c.bool,
	filterByInertia:     c.bool,
	maxArea:             c.float,
	maxCircularity:      c.float,
	maxConvexity:        c.float,
	maxInertiaRatio:     c.float,
	maxThreshold:        c.float,
	minArea:             c.float,
	minCircularity:      c.float,
	minConvexity:        c.float,
	minDistBetweenBlobs: c.float,
	minInertiaRatio:     c.float,
	minRepeatability:    c.size_t,
	minThreshold:        c.float,
	thresholdStep:       c.float,
}

// Wrapper for an individual cv::DMatch
DMatch :: struct {
	queryIdx: c.int,
	trainIdx: c.int,
	imgIdx:   c.int,
	distance: c.float,
}

// Wrapper for the vector of DMatch struct aka std::vector<DMatch>
DMatches :: struct {
	dmatches: [^]DMatch,
	length:   c.int,
}

// Wrapper for the vector vector of DMatch struct aka
// std::vector<std::vector<DMatch>>
MultiDMatches :: struct {
	dmatches: [^]DMatches,
	length:   c.int,
}

// Wrapper for an individual cv::Moment
Moment :: struct {
	m00:  c.double,
	m10:  c.double,
	m01:  c.double,
	m20:  c.double,
	m11:  c.double,
	m02:  c.double,
	m30:  c.double,
	m21:  c.double,
	m12:  c.double,
	m03:  c.double,
	mu20: c.double,
	mu11: c.double,
	mu02: c.double,
	mu30: c.double,
	mu21: c.double,
	mu12: c.double,
	mu03: c.double,
	nu20: c.double,
	nu11: c.double,
	nu02: c.double,
	nu30: c.double,
	nu21: c.double,
	nu12: c.double,
	nu03: c.double,
}

Mat :: distinct rawptr
TermCriteria :: distinct rawptr
RNG :: distinct rawptr
PointVector :: distinct rawptr
PointsVector :: distinct rawptr
Point2fVector :: distinct rawptr
Points2fVector :: distinct rawptr
Point3fVector :: distinct rawptr
Points3fVector :: distinct rawptr

Mats :: struct {
	mats:   [^]Mat,
	length: c.int,
}

Mat_Type :: enum {
	CV_8U    = 0, // MatTypeCV8U is a Mat of 8-bit unsigned in
	CV_8S    = 1, // CV8S is a Mat of 8-bit signed in
	CV_16U   = 2, // CV16U is a Mat of 16-bit unsigned in
	CV_16S   = 3, // CV16S is a Mat of 16-bit signed in
	CV_16SC2 = CV_16S + Mat_Channel2, // CV16SC2 is a Mat of 16-bit signed int with 2 channel
	CV_32S   = 4, // CV32S is a Mat of 32-bit signed in
	CV_32F   = 5, // CV32F is a Mat of 32-bit floa
	CV_64F   = 6, // CV64F is a Mat of 64-bit floa
	CV_8UC1  = CV_8U + Mat_Channel1, // CV8UC1 is a Mat of 8-bit unsigned int with a single channe
	CV_8UC2  = CV_8U + Mat_Channel2, // CV8UC2 is a Mat of 8-bit unsigned int with 2 channel
	CV_8UC3  = CV_8U + Mat_Channel3, // CV8UC3 is a Mat of 8-bit unsigned int with 3 channel
	CV_8UC4  = CV_8U + Mat_Channel4, // CV8UC4 is a Mat of 8-bit unsigned int with 4 channel
	CV_8SC1  = CV_8S + Mat_Channel1, // CV8SC1 is a Mat of 8-bit signed int with a single channe
	CV_8SC2  = CV_8S + Mat_Channel2, // CV8SC2 is a Mat of 8-bit signed int with 2 channel
	CV_8SC3  = CV_8S + Mat_Channel3, // CV8SC3 is a Mat of 8-bit signed int with 3 channel
	CV_8SC4  = CV_8S + Mat_Channel4, // CV8SC4 is a Mat of 8-bit signed int with 4 channel
	CV_16UC1 = CV_16U + Mat_Channel1, // CV16UC1 is a Mat of 16-bit unsigned int with a single channe
	CV_16UC2 = CV_16U + Mat_Channel2, // CV16UC2 is a Mat of 16-bit unsigned int with 2 channel
	CV_16UC3 = CV_16U + Mat_Channel3, // CV16UC3 is a Mat of 16-bit unsigned int with 3 channel
	CV_16UC4 = CV_16U + Mat_Channel4, // CV16UC4 is a Mat of 16-bit unsigned int with 4 channel
	CV_16SC1 = CV_16S + Mat_Channel1, // CV16SC1 is a Mat of 16-bit signed int with a single channe
	CV_16SC3 = CV_16S + Mat_Channel3, // CV16SC3 is a Mat of 16-bit signed int with 3 channel
	CV_16SC4 = CV_16S + Mat_Channel4, // CV16SC4 is a Mat of 16-bit signed int with 4 channel
	CV_32SC1 = CV_32S + Mat_Channel1, // CV32SC1 is a Mat of 32-bit signed int with a single channe
	CV_32SC2 = CV_32S + Mat_Channel2, // CV32SC2 is a Mat of 32-bit signed int with 2 channel
	CV_32SC3 = CV_32S + Mat_Channel3, // CV32SC3 is a Mat of 32-bit signed int with 3 channel
	CV_32SC4 = CV_32S + Mat_Channel4, // CV32SC4 is a Mat of 32-bit signed int with 4 channel
	CV_32FC1 = CV_32F + Mat_Channel1, // CV32FC1 is a Mat of 32-bit float int with a single channe
	CV_32FC2 = CV_32F + Mat_Channel2, // CV32FC2 is a Mat of 32-bit float int with 2 channel
	CV_32FC3 = CV_32F + Mat_Channel3, // CV32FC3 is a Mat of 32-bit float int with 3 channel
	CV_32FC4 = CV_32F + Mat_Channel4, // CV32FC4 is a Mat of 32-bit float int with 4 channel
	CV_64FC1 = CV_64F + Mat_Channel1, // CV64FC1 is a Mat of 64-bit float int with a single channe
	CV_64FC2 = CV_64F + Mat_Channel2, // CV64FC2 is a Mat of 64-bit float int with 2 channel
	CV_64FC3 = CV_64F + Mat_Channel3, // CV64FC3 is a Mat of 64-bit float int with 3 channel
	CV64FC4  = CV_64F + Mat_Channel4, // CV64FC4 is a Mat of 64-bit float int with 4 channel
}

@(default_calling_convention = "c")
foreign cv {
	// Mat_New creates a new empty Mat
	@(link_name = "Mat_New")
	new_mat :: proc() -> Mat ---

	// Mat_NewWithSize creates a new Mat with a specific size dimension and number
	// of channels.
	Mat_NewWithSize :: proc(rows, cols: c.int, type: Mat_Type) -> Mat ---

	// Mat_NewWithSizes creates a new Mat with specific dimension sizes and number
	// of channels.
	Mat_NewWithSizes :: proc(sizes: []c.int, type: Mat_Type) -> Mat ---

	// Mat_NewFromScalar creates a new Mat from a Scalar. Intended to be used
	// for Mat comparison operation such as InRange.
	Mat_NewFromScalar :: proc(ar: Scalar, type: Mat_Type) -> Mat ---

	// Mat_NewWithSizeFromScalar creates a new Mat from a Scalar with a specific
	// size dimension and number of channels
	Mat_NewWithSizeFromScalar :: proc(ar: Scalar, rows, cols: c.int, type: Mat_Type) -> Mat ---

	Mat_NewFromBytes :: proc(rows, cols: c.int, type: Mat_Type, buf: ByteArray) -> Mat ---

	// Mat_NewWithSizesFromScalar creates multidimensional Mat from a scalar
	Mat_NewWithSizesFromScalar :: proc(sizes: IntVector, type: Mat_Type, ar: Scalar) -> Mat ---

	// Mat_NewWithSizesFromBytes creates multidimensional Mat from a bytes
	Mat_NewWithSizesFromBytes :: proc(sizes: IntVector, type: Mat_Type, buf: ByteArray) -> Mat ---

	Eye :: proc(rows, cols: c.int, type: Mat_Type) -> Mat ---

	Zeros :: proc(rows, cols: c.int, type: Mat_Type) -> Mat ---

	Ones :: proc(rows, cols: c.int, type: Mat_Type) -> Mat ---

	@(link_name = "Mat_FromPtr")
	mat_from_ptr :: proc(m: Mat, rows, cols: c.int, type: Mat_Type, prow, pcol: c.int) -> Mat ---

	// Mat_Close deletes an existing Mat
	@(link_name = "Mat_Close")
	delete_mat :: proc(m: Mat) ---

	// Mat_IsContinuous tests if a Mat is continuous
	@(link_name = "Mat_IsContinuous")
	mat_is_continuous :: proc(m: Mat) -> c.bool ---

	// Mat_Empty tests if a Mat is empty
	@(link_name = "Mat_Empty")
	mat_empty :: proc(m: Mat) -> c.bool ---

	@(link_name = "Mat_Inv")
	mat_inv :: proc(m: Mat) ---

	@(link_name = "Mat_Col")
	mat_col :: proc(m: Mat) -> Mat ---

	@(link_name = "Mat_Row")
	mat_row :: proc(m: Mat) -> Mat ---

	// Mat_Clone returns a clone of this Mat
	@(link_name = "Mat_Clone")
	mat_clone :: proc(m: Mat) -> Mat ---

	// Mat_CopyTo copies this Mat to another Mat.
	@(link_name = "Mat_CopyTo")
	mat_copy_to :: proc(m, dst: Mat) ---

	// Mat_CopyToWithMask copies this Mat to another Mat while applying the mask
	@(link_name = "Mat_CopyToWithMask")
	mat_copy_to_with_mask :: proc(m, dst, mask: Mat) ---

	@(link_name = "Mat_ConvertTo")
	mat_convert_to :: proc(m, dst: Mat, type: Mat_Type) ---

	@(link_name = "Mat_ConvertToWithParams")
	mat_convert_to_with_params :: proc(m, dst: Mat, type: Mat_Type, alpha, beta: c.float) ---

	// Mat_ToBytes returns the bytes representation of the underlying data.
	Mat_ToBytes :: proc(m: Mat) -> ByteArray ---

	Mat_DataPtr :: proc(m: Mat) -> ByteArray ---

	// Mat_Region returns a Mat of a region of another Mat
	@(link_name = "Mat_Region")
	mat_region :: proc(m: Mat, r: Rect) -> Mat ---

	@(link_name = "Mat_Reshape")
	mat_reshape :: proc(m: Mat, cn, rows: c.int) -> Mat ---

	@(link_name = "Mat_PatchNaNs")
	patch_NaNs :: proc(m: Mat) ---

	@(link_name = "Mat_ConvertFp16")
	convert_fp16 :: proc(m: Mat) -> Mat ---

	@(link_name = "Mat_Sqrt")
	sqrt :: proc(m: Mat) -> Mat ---

	@(link_name = "Mat_Mean")
	mean :: proc(m: Mat) -> Scalar ---

	@(link_name = "Mat_MeanWithMask")
	mean_with_mask :: proc(m, mask: Mat) -> Scalar ---

	@(link_name = "LUT")
	lut :: proc(src, lut, dst: Mat) -> Mat ---

	// Mat_Rows returns how many rows in this Mat.
	Mat_Rows :: proc(m: Mat) -> c.int ---

	// Mat_Cols returns how many columns in this Mat.
	Mat_Cols :: proc(m: Mat) -> c.int ---

	// Mat_Channels returns how many channels in this Mat.
	Mat_Channels :: proc(m: Mat) -> c.int ---

	// Mat_Type returns how many channels in this Mat.
	@(link_name = "Mat_Type")
	mat_type :: proc(m: Mat) -> Mat_Type ---

	// Mat_Step returns the number of bytes each matrix row occupies.
	@(link_name = "Mat_Step")
	mat_step :: proc(m: Mat) -> c.int ---

	@(link_name = "Mat_Total")
	mat_total :: proc(m: Mat) -> c.int ---

	@(link_name = "Mat_ElemSize")
	mat_elem_size :: proc(m: Mat) -> c.int ---

	Mat_Size :: proc(m: Mat, res: ^IntVector) ---

	// Mat_GetUChar returns a specific row/col value from this Mat expecting
	// each element to contain a schar aka CV_8U.
	Mat_GetUChar :: proc(m: Mat, row, col: c.int) -> c.uint8_t ---

	@(link_name = "Mat_GetUChar3")
	mat_get_uchar3 :: proc(m: Mat, x, y, z: c.int) -> c.uint8_t ---

	// Mat_GetSChar returns a specific row/col value from this Mat expecting
	// each element to contain a schar aka CV_8S.
	@(link_name = "Mat_GetSChar")
	mat_get_schar :: proc(m: Mat, row, col: c.int) -> c.int8_t ---

	@(link_name = "Mat_GetSChar3")
	mat_get_schar3 :: proc(m: Mat, x, y, z: c.int) -> c.int8_t ---

	// Mat_GetShort returns a specific row/col value from this Mat expecting
	// each element to contain a short aka CV_16S.
	@(link_name = "Mat_GetShort")
	mat_get_short :: proc(m: Mat, row, col: c.int) -> c.int16_t ---

	@(link_name = "Mat_GetShort3")
	mat_get_short3 :: proc(m: Mat, x, y, z: c.int) -> c.int16_t ---

	// Mat_GetInt returns a specific row/col value from this Mat expecting
	// each element to contain an int aka CV_32S.
	@(link_name = "Mat_GetInt")
	mat_get_int :: proc(m: Mat, row, col: c.int) -> c.int32_t ---

	@(link_name = "Mat_GetInt3")
	mat_get_int3 :: proc(m: Mat, x, y, z: c.int) -> c.int32_t ---

	// Mat_GetFloat returns a specific row/col value from this Mat expecting
	// each element to contain a float aka CV_32F.
	@(link_name = "Mat_GetFloat")
	mat_get_float :: proc(m: Mat, row, col: c.int) -> c.float ---

	Mat_GetFloat3 :: proc(m: Mat, x, y, z: c.int) -> c.float ---

	// Mat_GetDouble returns a specific row/col value from this Mat expecting
	// each element to contain a double aka CV_64F.
	@(link_name = "Mat_GetDouble")
	mat_get_double :: proc(m: Mat, row, col: c.int) -> c.double ---

	@(link_name = "Mat_GetDouble3")
	mat_get_double3 :: proc(m: Mat, x, y, z: c.int) -> c.double ---

	@(link_name = "Mat_SetTo")
	mat_set_to :: proc(m: Mat, value: Scalar) -> c.double ---

	// Mat_GetUChar returns a specific row/col value from this Mat expecting
	// each element to contain a schar aka CV_8U.
	@(link_name = "Mat_SetUChar")
	mat_set_uchar :: proc(m: Mat, row, col: c.int) -> c.uint8_t ---

	@(link_name = "Mat_SetUChar3")
	mat_set_uchar3 :: proc(m: Mat, x, y, z: c.int) -> c.uint8_t ---

	// Mat_SetSChar returns a specific row/col value from this Mat expecting
	// each element to contain a schar aka CV_8S.
	@(link_name = "Mat_SetSChar")
	mat_set_schar :: proc(m: Mat, row, col: c.int, val: c.int8_t) ---

	@(link_name = "Mat_SetSChar3")
	mat_set_schar3 :: proc(m: Mat, x, y, z: c.int, val: c.int8_t) ---

	// Mat_SetShort returns a specific row/col value from this Mat expecting
	// each element to contain a short aka CV_16S.
	@(link_name = "Mat_SetShort")
	mat_set_short :: proc(m: Mat, row, col: c.int, val: c.int16_t) ---

	@(link_name = "Mat_SetShort3")
	mat_set_short3 :: proc(m: Mat, x, y, z: c.int, val: c.int16_t) ---

	// Mat_SetInt set a specific row/col value from this Mat expecting
	// each element to contain an int aka CV_32S.
	@(link_name = "Mat_SetInt")
	mat_set_int :: proc(m: Mat, row, col: c.int, val: c.int32_t) ---

	@(link_name = "Mat_SetInt3")
	mat_set_int3 :: proc(m: Mat, x, y, z: c.int, val: c.int32_t) ---

	// Mat_SetFloat returns a specific row/col value from this Mat expecting
	// each element to contain a float aka CV_32F.
	@(link_name = "Mat_SetFloat")
	mat_set_float :: proc(m: Mat, row, col: c.int, val: c.float) ---

	@(link_name = "Mat_SetFloat3")
	mat_set_float3 :: proc(m: Mat, x, y, z: c.int, val: c.float) ---

	// Mat_SetDouble returns a specific row/col value from this Mat expecting
	// each element to contain a double aka CV_64F.
	@(link_name = "Mat_SetDouble")
	mat_set_double :: proc(m: Mat, row, col: c.int, val: c.double) ---

	@(link_name = "Mat_SetDouble3")
	mat_set_double3 :: proc(m: Mat, x, y, z: c.int, val: c.double) ---

	@(link_name = "Mat_AddUChar")
	mat_add_uchar :: proc(m: Mat, val: c.uint8_t) ---

	@(link_name = "Mat_SubtractUChar")
	mat_sub_uchar :: proc(m: Mat, val: c.uint8_t) ---

	@(link_name = "Mat_MultiplyUChar")
	mat_mul_uchar :: proc(m: Mat, val: c.uint8_t) ---

	@(link_name = "Mat_DivideUChar")
	mat_div_uchar :: proc(m: Mat, val: c.uint8_t) ---

	@(link_name = "Mat_AddFloat")
	mat_add_float :: proc(m: Mat, val: c.float) ---

	@(link_name = "Mat_SubtractFloat")
	mat_sub_float :: proc(m: Mat, val: c.float) ---

	@(link_name = "Mat_MultiplyFloat")
	mat_mul_float :: proc(m: Mat, val: c.float) ---

	@(link_name = "Mat_DivideFloat")
	mat_div_float :: proc(m: Mat, val: c.float) ---

	@(link_name = "Mat_MultiplyMatrix")
	mat_mul :: proc(x, y: Mat) ---

	@(link_name = "Mat_T")
	mat_t :: proc(x: Mat) ---

	@(link_name = "Mat_AbsDiff")
	abs_diff :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_Add")
	add :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_AddWeighted")
	add_weighted :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_BitwiseAnd")
	bitwise_and :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_BitwiseAndWithMask")
	bitwise_and_with_mask :: proc(src1, src2, dst, mask: Mat) ---

	@(link_name = "Mat_BitwiseNot")
	bitwise_not :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_BitwiseNotWithMask")
	bitwise_not_with_mask :: proc(src1, src2, dst, mask: Mat) ---

	@(link_name = "Mat_BitwiseOr")
	bitwise_or :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_BitwiseOrWithMask")
	bitwise_or_with_mask :: proc(src1, src2, dst, mask: Mat) ---

	@(link_name = "Mat_BitwiseXor")
	bitwise_xor :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_BitwiseXorWithMask")
	bitwise_xor_with_mask :: proc(src1, src2, dst, mask: Mat) ---

	@(link_name = "Mat_BatchDistance")
	batch_distance :: proc(src1, src2, dist: Mat, dtype: Mat_Type, nidx: Mat, normType, K: c.int, mask: Mat, update: c.int, crosscheck: c.bool) ---

	@(link_name = "Mat_BorderInterpolate")
	border_interpolate :: proc(p, len, bordertype: Mat_Type) -> c.int ---

	@(link_name = "Mat_CalcCovarMatrix")
	calc_covar_matrix :: proc(samples, covar, mean: Mat, flags, ctype: Mat_Type) ---

	@(link_name = "Mat_CartToPolar")
	cart_to_polar :: proc(x, y, magnitude, angle: Mat, angleInDegrees: c.bool) ---

	@(link_name = "Mat_CheckRange")
	check_range :: proc(m: Mat) -> c.bool ---

	@(link_name = "Mat_Compare")
	compare :: proc(src1, src2, dst: Mat, ct: c.int) ---

	@(link_name = "Mat_CountNonZero")
	count_non_zero :: proc(src: Mat) -> c.int ---

	@(link_name = "Mat_CompleteSymm")
	complete_symm :: proc(m: Mat, lowerToUpper: c.bool) ---

	@(link_name = "Mat_ConvertScaleAbs")
	convert_scale_abs :: proc(src, dst: Mat, alpha, beta: c.double) ---

	@(link_name = "Mat_CopyMakeBorder")
	copy_make_border :: proc(src, dst: Mat, top, bottom, left, right, bordertype: Mat_Type, value: Scalar) ---

	@(link_name = "Mat_DCT")
	dct :: proc(src, dst: Mat, flags: c.int) ---

	@(link_name = "Mat_Determinant")
	determinant :: proc(m: Mat) -> c.double ---

	@(link_name = "Mat_DFT")
	dft :: proc(src, dst: Mat, flags: c.int) ---

	@(link_name = "Mat_Divide")
	divide :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_Eigen")
	eigen :: proc(src, eigenvalues, eigenvectors: Mat) -> c.bool ---

	@(link_name = "Mat_EigenNonSymmetric")
	eigen_non_symmetric :: proc(src, eigenvalues, eigenvectors: Mat) ---

	@(link_name = "Mat_PCABackProject")
	pca_back_project :: proc(data, mean, eigenvectors, result: Mat, maxComponents: c.int) ---

	@(link_name = "Mat_PCACompute")
	pca_compute :: proc(src, mean, eigenvectors, eigenvalues: Mat, maxComponents: c.int) ---

	@(link_name = "Mat_PCAProject")
	pca_project :: proc(data, mean, eigenvectors, result: Mat) ---

	@(link_name = "PSNR")
	psnr :: proc(src1, src2: Mat) -> c.double ---

	@(link_name = "SVBackSubst")
	sv_back_subst :: proc(w, u, vt, rhs, dst: Mat) ---

	@(link_name = "SVDecomp")
	sv_decomp :: proc(src, w, u, vt: Mat) ---

	@(link_name = "Mat_Exp")
	exp :: proc(src, dst: Mat) ---

	@(link_name = "Mat_ExtractChannel")
	extract_channel :: proc(src, dst: Mat, coi: c.int) ---

	@(link_name = "Mat_FindNonZero")
	find_non_zero :: proc(src, idx: Mat) ---

	@(link_name = "Mat_Flip")
	flip :: proc(src, idx: Mat, flipCode: c.int) ---

	@(link_name = "Mat_Gemm")
	gemm :: proc(src1, src2: Mat, alpha: c.double, src3: Mat, beta: c.double, dst: Mat, flags: c.int) ---

	@(link_name = "Mat_GetOptimalDFTSize")
	get_optimal_dft_size :: proc(vecsize: c.int) -> c.int ---

	@(link_name = "Mat_Hconcat")
	hconcat :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_Vconcat")
	vconcat :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Rotate")
	rotate :: proc(src, dst: Mat, rotateCode: c.int) ---

	@(link_name = "Mat_Idct")
	idct :: proc(src, dst: Mat, flags: c.int) ---

	@(link_name = "Mat_Idft")
	idft :: proc(src, dst: Mat, flags, nonzeroRows: c.int) ---

	@(link_name = "Mat_InRange")
	in_range :: proc(src, lowerb, upperb, dst: Mat) ---

	@(link_name = "Mat_InRangeWithScalar")
	in_range_with_scalar :: proc(src: Mat, lowerb, upperb: Scalar, dst: Mat) ---

	@(link_name = "Mat_InsertChannel")
	insert_channel :: proc(src, dst: Mat, coi: c.int) ---

	@(link_name = "Mat_Invert")
	invert :: proc(src, dst: Mat, flags: c.int) -> c.double ---

	@(link_name = "KMeans")
	kmeans :: proc(data: Mat, k: c.int, bestLabels: Mat, criteria: TermCriteria, attempts, flags: c.int, centers: Mat) -> c.double ---

	@(link_name = "KMeansPoints")
	kmeans_points :: proc(points: PointVector, k: c.int, bestLabels: Mat, criteria: TermCriteria, attempts, flags: c.int, centers: Mat) -> c.double ---

	@(link_name = "Mat_Log")
	log :: proc(src, dst: Mat) ---

	@(link_name = "Mat_Magnitude")
	magnitude :: proc(x, y, magnitued: Mat) ---

	@(link_name = "Mat_Mahalanobis")
	mahalanobis :: proc(v1, v2, icovar: Mat) -> c.double ---

	@(link_name = "MulTransposed")
	mul_transposed :: proc(src, dest: Mat, ata: c.bool) ---

	@(link_name = "Mat_Max")
	max :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_MeanStdDev")
	mean_std_dev :: proc(src, dstMean, dstStdDev: Mat) ---

	@(link_name = "Mat_Merge")
	merge :: proc(mats: Mats, dst: Mat) ---

	@(link_name = "Mat_Min")
	min :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_MinMaxIdx")
	min_max_idx :: proc(m: Mat, minVal, maxVal: ^c.double, minIdx, maxIdx: ^c.int) ---

	@(link_name = "Mat_MinMaxLoc")
	min_max_loc :: proc(m: Mat, minVal: ^c.double, maxVal: ^c.double, minLoc, maxLoc: ^Point) ---

	@(link_name = "Mat_MinMaxLocWithMask")
	min_max_loc_with_mask :: proc(m: Mat, minVal: ^c.double, maxVal: ^c.double, minLoc, maxLoc: ^Point, mask: Mat) ---

	@(link_name = "Mat_MixChannels")
	mix_channels :: proc(src, dst: Mats, fromTo: IntVector) ---

	@(link_name = "Mat_MulSpectrums")
	mul_spectrums :: proc(a, b, c: Mat, flags: i32) ---

	@(link_name = "Mat_Multiply")
	multiply :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_MultiplyWithParams")
	multiply_with_params :: proc(src1, src2, dst: Mat, scale: c.double, dtype: Mat_Type) ---

	@(link_name = "Mat_Normalize")
	normalize :: proc(src, dst: Mat, alpha, beta: c.double, typ: c.int) ---

	@(link_name = "Norm")
	norm :: proc(src1: Mat, normtype: Mat_Type) -> c.double ---

	@(link_name = "NormWithMats")
	norm_with_mats :: proc(src1, src2: Mat, normtype: Mat_Type) -> c.double ---

	@(link_name = "Mat_PerspectiveTransform")
	perspective_transform :: proc(src, dst, tm: Mat) ---

	@(link_name = "Mat_Solve")
	solve :: proc(src1, src2, dst: Mat, flags: c.int) -> c.bool ---

	@(link_name = "Mat_SolveCubic")
	solve_cubic :: proc(coeffs, roots: Mat) -> c.int ---

	@(link_name = "Mat_SolvePoly")
	solve_poly :: proc(coeffs, roots: Mat, maxIters: c.int) -> c.double ---

	@(link_name = "Mat_Reduce")
	reduce :: proc(src, dst: Mat, dim, rType, dtype: Mat_Type) ---

	@(link_name = "Mat_ReduceArgMax")
	reduce_arg_max :: proc(src, dst: Mat, axis: c.int, lastIndex: c.bool) ---

	@(link_name = "Mat_ReduceArgMin")
	reduce_arg_min :: proc(src, dst: Mat, axis: c.int, lastIndex: c.bool) ---

	@(link_name = "Mat_Repeat")
	repeat :: proc(src: Mat, nY, nX: c.int, dst: Mat) ---

	@(link_name = "Mat_ScaleAdd")
	scale_add :: proc(src1: Mat, alpha: c.double, src2, dst: Mat) ---

	@(link_name = "Mat_SetIdentity")
	set_identity :: proc(src: Mat, scalar: c.double) ---

	@(link_name = "Mat_Sort")
	sort :: proc(src, dst: Mat, flags: c.int) ---

	@(link_name = "Mat_SortIdx")
	sort_idx :: proc(src, dst: Mat, flags: c.int) ---

	Mat_Split :: proc(src: Mat, mats: ^Mats) ---

	@(link_name = "Mat_Subtract")
	subtract :: proc(src1, src2, dst: Mat) ---

	@(link_name = "Mat_Trace")
	trace :: proc(src: Mat) -> Scalar ---

	@(link_name = "Mat_Transform")
	transform :: proc(src, dst, tm: Mat) ---

	@(link_name = "Mat_Transpose")
	transpose :: proc(src, dst: Mat) ---

	@(link_name = "Mat_PolarToCart")
	polar_to_cart :: proc(magnitude, degree, x, y: Mat, angleInDegrees: c.bool) ---

	@(link_name = "Mat_Pow")
	pow :: proc(src: Mat, power: c.double, dst: Mat) ---

	@(link_name = "Mat_Phase")
	phase :: proc(x, y, angle: Mat, angleInDegrees: c.bool) ---

	@(link_name = "Mat_Sum")
	sum :: proc(src: Mat) -> Scalar ---

	@(link_name = "TermCriteria_New")
	termcriteria_new :: proc(typ, maxCount: c.int, epsilon: c.double) -> TermCriteria ---

	@(link_name = "Contours_Close")
	contours_close :: proc(cs: Contours) ---

	@(link_name = "CStrings_Close")
	cstrings_close :: proc(cstrs: CStrings) ---

	@(link_name = "KeyPoints_Close")
	keypoints_close :: proc(ks: KeyPoints) ---

	@(link_name = "Points_Close")
	points_close :: proc(ps: Points) ---

	@(link_name = "Point_Close")
	point_close :: proc(p: Point) ---

	@(link_name = "Points2f_Close")
	points2f_close :: proc(ps: Points2f) ---

	@(link_name = "Point2f_Close")
	point2f_close :: proc(p: Point2f) ---

	@(link_name = "Rects_Close")
	delete_rects :: proc(rs: Rects) ---

	@(link_name = "DMatches_Close")
	dmatches_close :: proc(ds: DMatches) ---

	@(link_name = "MultiDMatches_Close")
	multidmatches_close :: proc(mds: MultiDMatches) ---

	@(link_name = "MultiDMatches_get")
	multidmatches_get :: proc(mds: MultiDMatches, index: c.int) -> DMatches ---

	@(link_name = "Mats_get")
	mats_get :: proc(mats: Mats, i: c.int) -> Mat ---

	@(link_name = "Mats_Close")
	mats_close :: proc(mats: Mats) ---

	@(link_name = "ByteArray_Release")
	bytearray_release :: proc(buf: ByteArray) ---

	@(link_name = "toByteArray")
	to_byte_array :: proc(buf: [^]byte, len: c.int) -> ByteArray ---

	@(link_name = "GetCVTickCount")
	get_tick_count :: proc() -> c.int64_t ---

	@(link_name = "GetTickFrequency")
	get_tick_frequency :: proc() -> c.double ---

	@(link_name = "Mat_rowRange")
	mat_rowrange :: proc(m: Mat, startrow, endrow: c.int) -> Mat ---

	@(link_name = "Mat_colRange")
	mat_colrange :: proc(m: Mat, startrow, endrow: c.int) -> Mat ---

	@(link_name = "PointVector_New")
	point_vector_new :: proc() -> PointVector ---

	@(link_name = "PointVector_NewFromPoints")
	point_vector_new_from_points :: proc(points: Contour) -> PointVector ---

	@(link_name = "PointVector_NewFromMat")
	point_vector_new_from_mat :: proc(mat: Mat) -> PointVector ---

	@(link_name = "PointVector_At")
	point_vector_at :: proc(pv: PointVector, idx: c.int) -> Point ---

	@(link_name = "PointVector_Append")
	point_vector_append :: proc(pv: PointVector, p: Point) ---

	@(link_name = "PointVector_Size")
	point_vector_size :: proc(p: PointVector) -> c.int ---

	@(link_name = "PointVector_Close")
	point_vector_close :: proc(p: PointVector) ---

	@(link_name = "PointsVector_New")
	points_vector_new :: proc() -> PointsVector ---

	@(link_name = "PointsVector_NewFromPoints")
	points_vector_newfrompoints :: proc(points: Contours) -> PointsVector ---

	@(link_name = "PointsVector_Size")
	points_vector_size :: proc(ps: PointsVector) -> int ---

	@(link_name = "PointsVector_At")
	points_vector_at :: proc(ps: PointsVector, idx: c.int) -> PointVector ---

	@(link_name = "PointsVector_Append")
	points_vector_append :: proc(psv: PointsVector, pv: PointVector) ---

	@(link_name = "PointsVector_Close")
	points_vector_close :: proc(ps: PointsVector) ---

	@(link_name = "Point2fVector_New")
	point2f_vector_new :: proc() -> Point2fVector ---

	@(link_name = "Point2fVector_NewFromPoints")
	point2f_vector_newfrompoints :: proc(points: Contour2f) -> Point2fVector ---

	@(link_name = "Point2fVector_NewFromMat")
	point2f_vector_newfrommat :: proc(mat: Mat) -> Point2fVector ---

	@(link_name = "Point2fVector_At")
	point2f_vector_at :: proc(pfv: Point2fVector, idx: c.int) -> Point2f ---

	@(link_name = "Point2fVector_Size")
	point2f_vector_size :: proc(pfv: Point2fVector) -> c.int ---

	@(link_name = "Point2fVector_Close")
	point2f_vector_close :: proc(pv: Point2fVector) ---

	@(link_name = "IntVector_Close")
	int_vector_close :: proc(ivec: IntVector) ---

	@(link_name = "TheRNG")
	the_rng :: proc() -> RNG ---

	@(link_name = "SetRNGSeed")
	set_rng_seed :: proc(seed: c.int) ---

	@(link_name = "RNG_Fill")
	rng_fill :: proc(rng: RNG, mat: Mat, disttype: Mat_Type, a: c.double, b: c.double, saturateRange: c.bool) ---

	@(link_name = "RNG_Gaussian")
	rng_gaussian :: proc(rng: RNG, sigma: c.double) -> c.double ---

	@(link_name = "RNG_Next")
	rng_next :: proc(rng: RNG) -> c.uint ---

	@(link_name = "RandN")
	randn :: proc(mat: Mat, mean, stddev: Scalar) ---

	@(link_name = "RandShuffle")
	rand_shuffle :: proc(mat: Mat) ---

	@(link_name = "RandShuffleWithParams")
	rand_shuffle_with_params :: proc(mat: Mat, iterFactor: c.double, rng: RNG) ---

	@(link_name = "RandU")
	rand_u :: proc(mat: Mat, low, high: Scalar) ---

	@(link_name = "copyPointVectorToPoint2fVector")
	copy_point_vector_to_point2f_vector :: proc(src, dest: Point2fVector) ---

	@(link_name = "StdByteVectorInitialize")
	std_byte_vector_initialize :: proc(data: rawptr) ---

	@(link_name = "StdByteVectorFree")
	std_byte_vector_free :: proc(data: rawptr) ---

	@(link_name = "StdByteVectorLen")
	std_byte_vector_len :: proc(data: rawptr) -> c.size_t ---

	@(link_name = "StdByteVectorData")
	std_byte_vector_data :: proc(data: rawptr) -> ^c.uint8_t ---

	@(link_name = "Points2fVector_New")
	points2f_vector_new :: proc() -> Points2fVector ---

	@(link_name = "Points2fVector_NewFromPoints")
	points2f_vector_new_from_points :: proc(points: Contours2f) -> Points2fVector ---

	@(link_name = "Points2fVector_Size")
	points2f_vector_size :: proc(ps: Points2fVector) -> c.int ---

	@(link_name = "Points2fVector_At")
	points2f_vector_at :: proc(ps: Points2fVector, idx: c.int) -> Point2fVector ---

	@(link_name = "Points2fVector_Append")
	points2f_vector_append :: proc(psv, pv: Point2fVector) ---

	@(link_name = "Points2fVector_Close")
	points2f_vector_close :: proc(ps: Points2fVector) ---

	@(link_name = "Point3fVector_New")
	point3f_vector_new :: proc() -> Point3fVector ---

	@(link_name = "Point3fVector_NewFromPoints")
	point3f_vector_newfrompoints :: proc(points: Contour3f) -> Point3fVector ---

	@(link_name = "Point3fVector_NewFromMat")
	point3f_vector_newfrommat :: proc(mat: Mat) -> Point3fVector ---

	@(link_name = "Point3fVector_At")
	point3f_vector_at :: proc(pfv: Point3fVector, idx: c.int) -> Point3f ---

	@(link_name = "Point3fVector_Append")
	point3f_vector_append :: proc(pfv: Point3fVector, point: Point3f) ---

	@(link_name = "Point3fVector_Size")
	point3f_vector_size :: proc(pfv: Point3fVector) -> c.int ---

	@(link_name = "Point3fVector_Close")
	point3f_vector_close :: proc(pv: Point3fVector) ---

	@(link_name = "Points3fVector_New")
	points3f_vector_new :: proc() -> Points3fVector ---

	@(link_name = "Points3fVector_NewFromPoints")
	points3f_vector_newfrompoints :: proc(points: Contours3f) -> Points3fVector ---

	@(link_name = "Points3fVector_Size")
	points3f_vector_size :: proc(ps: Points3fVector) -> c.int ---

	@(link_name = "Points3fVector_At")
	points3f_vector_at :: proc(ps: Points3fVector, idx: c.int) -> Point3fVector ---

	@(link_name = "Points3fVector_Append")
	points3f_vector_append :: proc(psv: Points3fVector, pv: Point3fVector) ---

	@(link_name = "Points3fVector_Close")
	points3f_vector_close :: proc(ps: Points3fVector) ---

	@(link_name = "SetNumThreads")
	set_num_threads :: proc(n: c.int) ---

	@(link_name = "GetNumThreads")
	get_num_threads :: proc() -> c.int ---
}

new_mat_with_size :: proc(rows, cols: int, type: Mat_Type) -> Mat {
	return Mat_NewWithSize(c.int(rows), c.int(cols), type)
}

new_mat_with_sizes :: proc(sizes: []int, type: Mat_Type) -> Mat {
	c_sizes := make([]c.int, len(sizes))
	for s, i in sizes {
		c_sizes[i] = c.int(s)
	}

	return Mat_NewWithSizes(c_sizes, type)
}

new_mat_from_scalar :: proc(ar: Scalar, type: Mat_Type) -> Mat {
	return Mat_NewFromScalar(ar, type)
}

new_mat_with_size_from_scalar :: proc(ar: Scalar, rows, cols: int, type: Mat_Type) -> Mat {
	return Mat_NewWithSizeFromScalar(ar, c.int(rows), c.int(cols), type)
}

new_mat_from_bytes :: proc(rows, cols: int, type: Mat_Type, buf: []byte) -> (m: Mat, ok: bool) {
	if len(buf) <= 0 do return

	m = Mat_NewFromBytes(c.int(rows), c.int(cols), type, {cast([^]byte)&buf[0], c.int(len(buf))})
	if m != nil do ok = true

	return
}

new_mat_with_sizes_from_scalar :: proc(sizes: []int, type: Mat_Type, ar: Scalar) -> Mat {
	c_sizes := make([]c.int, len(sizes))
	for s, i in sizes {
		c_sizes[i] = c.int(s)
	}

	return Mat_NewWithSizesFromScalar({cast([^]c.int)&c_sizes[0], c.int(len(c_sizes))}, type, ar)
}

new_mat_with_sizes_from_bytes :: proc(
	sizes: []int,
	type: Mat_Type,
	buf: []byte,
) -> (
	m: Mat,
	ok: bool,
) {
	if len(buf) <= 0 do return

	c_sizes := make([]c.int, len(sizes))
	for s, i in sizes {
		c_sizes[i] = c.int(s)
	}

	m = Mat_NewWithSizesFromBytes(
		{cast([^]c.int)&c_sizes[0], c.int(len(c_sizes))},
		type,
		{cast([^]byte)&buf[0], c.int(len(buf))},
	)
	if m != nil do ok = true

	return
}

eye :: proc(rows, cols: int, type: Mat_Type) -> Mat {
	return Eye(c.int(rows), c.int(cols), type)
}

zeros :: proc(rows, cols: int, type: Mat_Type) -> Mat {
	return Zeros(c.int(rows), c.int(cols), type)
}

ones :: proc(rows, cols: int, type: Mat_Type) -> Mat {
	return Ones(c.int(rows), c.int(cols), type)
}

mat_to_bytes :: proc(m: Mat) -> []byte {
	arr := Mat_ToBytes(m)
	return arr.data[:arr.length]
}

mat_data_ptr :: proc(m: Mat) -> []byte {
	arr := Mat_DataPtr(m)
	return arr.data[:arr.length]
}

mat_size :: proc(m: Mat) -> (dims: []int) {
	res: IntVector
	Mat_Size(m, &res)

	dims = make([]int, res.length)
	for i in 0 ..< res.length {
		dims[i] = int(res.val[i])
	}

	return
}

mat_channels :: proc(m: Mat) -> int {
	return cast(int)Mat_Channels(m)
}

mat_get_float_at3 :: proc(m: Mat, x, y, z: int) -> f32 {
	return cast(f32)Mat_GetFloat3(m, c.int(x), c.int(y), c.int(z))
}

mat_get_uchar :: proc(m: Mat, x, y: int) -> u8 {
	return cast(u8)Mat_GetUChar(m, c.int(x), c.int(y))
}

mat_rows :: proc(m: Mat) -> int {
	return cast(int)Mat_Rows(m)
}

mat_cols :: proc(m: Mat) -> int {
	return cast(int)Mat_Cols(m)
}

split :: proc(src: Mat) -> []Mat {
	c_mats: Mats
	Mat_Split(src, &c_mats)
	mats := make([]Mat, int(c_mats.length))
	for mat, i in c_mats.mats[:c_mats.length] {
		mats[i] = mat
	}
	return mats
}
