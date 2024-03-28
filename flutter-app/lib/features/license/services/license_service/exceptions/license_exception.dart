class LicenseException implements Exception {
  String message;
  dynamic exception;
  StackTrace? stackTrace;

  LicenseException(this.message, {this.exception, this.stackTrace});

  @override
  String toString() {
    return 'LicenseException{'
        '\nmessage: $message,'
        '\n exception: $exception,'
        '\n stackTrace: $stackTrace'
        '\n}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicenseException &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          exception == other.exception &&
          stackTrace == other.stackTrace;

  @override
  int get hashCode =>
      message.hashCode ^ exception.hashCode ^ stackTrace.hashCode;
}
