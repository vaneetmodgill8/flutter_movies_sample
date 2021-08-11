class APIError {
  String error;
  dynamic responseBody;
  num statusCode;

  APIError({
    this.error,
    this.responseBody,
    this.statusCode,
  });

  APIError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}
