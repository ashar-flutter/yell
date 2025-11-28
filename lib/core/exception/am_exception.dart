class BasicException implements Exception {
  final String message;

  BasicException(this.message);

  @override
  String toString() {
    return message;
  }
}
