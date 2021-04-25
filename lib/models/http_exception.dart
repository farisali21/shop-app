
class HttpException implements Exception {

  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
    ///instead of return this message i will return my own message;;
    // return super.toString();
  }

}