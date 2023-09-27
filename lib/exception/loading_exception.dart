class LoadingException implements Exception {
  String message;
  LoadingException([this.message = 'Something went wrong']) {
    message = 'Loading Exception: $message';
  }

  @override
  String toString() {
    return message;
  }
}
