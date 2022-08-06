class Success {
  int code = 200;
  Object response;
  Success({this.code = 200, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}
