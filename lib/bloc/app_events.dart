sealed class AppEvent {
  const AppEvent();
}



class DownloadFileEvent extends AppEvent {
  const DownloadFileEvent();
}



class UploadFileEvent extends AppEvent {
  const UploadFileEvent();
}


class PickFileEvent extends AppEvent {
  const PickFileEvent();
}


class ClearFileEvent extends AppEvent {
  const ClearFileEvent();
}
