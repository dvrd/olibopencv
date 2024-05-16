package cv

import "core:c"

when ODIN_OS == .Darwin {
	foreign import cv "libcv.dylib"
}

BackgroundSubtractorMOG2 :: distinct rawptr
BackgroundSubtractorKNN :: distinct rawptr

@(default_calling_convention = "c")
foreign cv {
	BackgroundSubtractorMOG2_Create :: proc() -> BackgroundSubtractorMOG2 ---
	BackgroundSubtractorMOG2_CreateWithParams :: proc(history: c.int, varThreshold: c.double, detectShadows: c.bool) -> BackgroundSubtractorMOG2 ---
	BackgroundSubtractorMOG2_Close :: proc(b: BackgroundSubtractorMOG2) ---
	BackgroundSubtractorMOG2_Apply :: proc(b: BackgroundSubtractorMOG2, src, dst: Mat) ---
	BackgroundSubtractorKNN_Create :: proc() -> BackgroundSubtractorKNN ---
	BackgroundSubtractorKNN_CreateWithParams :: proc(history: c.int, dist2Threshold: c.double, detectShadows: c.bool) -> BackgroundSubtractorKNN ---
	BackgroundSubtractorKNN_Close :: proc(b: BackgroundSubtractorKNN) ---
	BackgroundSubtractorKNN_Apply :: proc(b: BackgroundSubtractorKNN, src, dst: Mat) ---
	CalcOpticalFlowPyrLK :: proc(prevImg, nextImg, prevPts, nextPts, status, err: Mat) ---
	CalcOpticalFlowPyrLKWithParams :: proc(prevImg, nextImg, prevPts, nextPts, status, err: Mat, winSize: Size, maxLevel: c.int, criteria: TermCriteria, flags: c.int, minEigThreshold: c.double) ---
	CalcOpticalFlowFarneback :: proc(prevImg, nextImg, flow: Mat, pyrScale: c.double, levels, winsize, iterations, polyN: c.int, polySigma: c.double, flags: c.int) ---
	FindTransformECC :: proc(templateImage, inputImage, warpMatrix: Mat, motionType: c.int, criteria: TermCriteria, inputMask: Mat, gaussFiltSize: c.int) -> c.double ---
	// Tracker_Init :: proc(Tracker self, Mat image, Rect boundingBox) -> bool ---
	// Tracker_Update :: proc(Tracker self, Mat image, Rect *boundingBox) -> bool ---
	// TrackerMIL_Create :: proc() -> TrackerMIL ---
	// TrackerMIL_Close :: proc(TrackerMIL self) ---
	// KalmanFilter_New :: proc(int dynamParams, int measureParams) -> KalmanFilter ---
	// KalmanFilter_NewWithParams :: proc(int dynamParams, int measureParams, int controlParams, int type) -> KalmanFilter ---
	// KalmanFilter_Close :: proc(KalmanFilter kf) ---
	// KalmanFilter_Init :: proc(KalmanFilter kf, int dynamParams, int measureParams) ---
	// KalmanFilter_InitWithParams :: proc(KalmanFilter kf, int dynamParams, int measureParams, int controlParams, int type) ---
	// KalmanFilter_Predict :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_PredictWithParams :: proc(KalmanFilter kf, Mat control) -> Mat ---
	// KalmanFilter_Correct :: proc(KalmanFilter kf, Mat measurement) -> Mat ---
	// KalmanFilter_GetStatePre :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetStatePost :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTransitionMatrix :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetControlMatrix :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetMeasurementMatrix :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetProcessNoiseCov :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetMeasurementNoiseCov :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetErrorCovPre :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetGain :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetErrorCovPost :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTemp1 :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTemp2 :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTemp3 :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTemp4 :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_GetTemp5 :: proc(KalmanFilter kf) -> Mat ---
	// KalmanFilter_SetStatePre :: proc(KalmanFilter kf, Mat statePre) ---
	// KalmanFilter_SetStatePost :: proc(KalmanFilter kf, Mat statePost) ---
	// KalmanFilter_SetTransitionMatrix :: proc(KalmanFilter kf, Mat transitionMatrix) ---
	// KalmanFilter_SetControlMatrix :: proc(KalmanFilter kf, Mat controlMatrix) ---
	// KalmanFilter_SetMeasurementMatrix :: proc(KalmanFilter kf, Mat measurementMatrix) ---
	// KalmanFilter_SetProcessNoiseCov :: proc(KalmanFilter kf, Mat processNoiseCov) ---
	// KalmanFilter_SetMeasurementNoiseCov :: proc(KalmanFilter kf, Mat measurementNoiseCov) ---
	// KalmanFilter_SetErrorCovPre :: proc(KalmanFilter kf, Mat errorCovPre) ---
	// KalmanFilter_SetGain :: proc(KalmanFilter kf, Mat gain) ---
	// KalmanFilter_SetErrorCovPost :: proc(KalmanFilter kf, Mat errorCovPost) ---
}
