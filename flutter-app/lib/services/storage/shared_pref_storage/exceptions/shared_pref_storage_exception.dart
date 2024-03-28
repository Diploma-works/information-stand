import '/services/storage/exceptions/storage_exception.dart';

class SharedPrefStorageException implements StorageException {
  @override
  Object? exception;

  @override
  String message;

  @override
  StackTrace? stackTrace;

  SharedPrefStorageException(this.message, {this.exception, this.stackTrace});

  @override
  String toString() {
    return 'SharedPrefStorageException{exception: $exception,'
        ' message: $message, stackTrace: $stackTrace}';
  }
}
