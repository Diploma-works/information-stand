
class StorageException  implements Exception{
  String message;
  dynamic exception;
  StackTrace? stackTrace;

  StorageException(this.message, this.exception, this.stackTrace);

  @override
  String toString() {
    return 'StorageException{message: $message,'
        ' exception: $exception, stackTrace: $stackTrace}';
  }
}
