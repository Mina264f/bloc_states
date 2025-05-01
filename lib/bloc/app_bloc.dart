import 'dart:async';
import 'dart:developer';
import 'app_events.dart';
import 'app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<DownloadFileEvent>(_downloadFile);
    on<UploadFileEvent>(_uploadFile);
    on<PickFileEvent>(_pickFile);
    on<ClearFileEvent>(_clearFile);
  }

  FutureOr<void> _downloadFile(
    DownloadFileEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(downloadStatus: DownloadStatus.loading));
      await Future.delayed(Duration(seconds: 5));
      emit(state.copyWith(downloadStatus: DownloadStatus.loaded));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), downloadStatus: DownloadStatus.error));
    }
  }

  FutureOr<void> _uploadFile(
    UploadFileEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      log(state.filepath.toString());
      if (state.filepath == null) return;
      emit(state.copyWith(uploadStatus: UploadStatus.loading));
      await Future.delayed(Duration(seconds: 5));
      emit(state.copyWith(uploadStatus: UploadStatus.loaded));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), uploadStatus: UploadStatus.error));
    }
  }

  FutureOr<void> _pickFile(PickFileEvent event, Emitter<AppState> emit) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        emit(state.copyWith(filepath: result.files.single.path));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }




  FutureOr<void> _clearFile(ClearFileEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(filepath: null));
  }
}
