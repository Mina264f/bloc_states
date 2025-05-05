

enum DownloadStatus {
  initial,
  loading,
  loaded,
  error,
}


enum UploadStatus {
  initial,
  loading,
  loaded,
  error,
}


extension AppStausX on AppState {
  bool get isDownloadLoading => downloadStatus == DownloadStatus.loading ;
  bool get isUploadLoading => uploadStatus == UploadStatus.loading ;
  bool get isDownloadError => downloadStatus == DownloadStatus.error ;
  bool get isUploadError => uploadStatus == UploadStatus.error ;
  bool get isDownloadSuccess => downloadStatus == DownloadStatus.loaded ;
  bool get isUploadSuccess => uploadStatus == UploadStatus.loaded ;
}


class AppState {
 final DownloadStatus? downloadStatus ;
  final UploadStatus ?uploadStatus ;
  final String ?errorMessage ;
  final String ?filepath;


  AppState({this.downloadStatus=DownloadStatus.initial,  this.uploadStatus=UploadStatus.initial, this.errorMessage, this.filepath});


  AppState copyWith({
    DownloadStatus? downloadStatus,
    UploadStatus? uploadStatus,
    String ?errorMessage,
    String ?filepath,
  }) {
    return AppState(
      downloadStatus: downloadStatus ?? this.downloadStatus,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      filepath: filepath
    );
  }




}

