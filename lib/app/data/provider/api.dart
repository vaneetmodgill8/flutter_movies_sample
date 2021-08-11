import 'package:dio/dio.dart';
import 'package:movies_title/app/data/model/movies_model.dart';

import 'APIError.dart';

/// The service responsible for networking requests
class Api {
  static const endpointPre = 'http://api.themoviedb.org/3/';
  static const endpoint = endpointPre + 'search/';
  static const access_key = "6753d9119b9627493ae129f3c3c99151";
  final moviesUrl = endpoint + "movie";

  Dio dio = new Dio();

  Api() {
    // Set default configs
    dio.options.baseUrl = endpoint;
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 30000;
    dio.options.headers = _getHeaders();
  }

  Map<String, String> _getHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<dynamic> getMovies(Map<String, dynamic> requestBody) async {
    try {
      requestBody["api_key"] = access_key;
      var response = await dio.get(moviesUrl, queryParameters: requestBody);
      if (response.data['errors'] == null) {
        final images = DataMoviesList.fromJson(response.data);
        return images;
      } else {
        return _handleInternalError(response);
      }
    } on DioError catch (e) {
      return _handleDioError(e);
    }
  }

  APIError _handleInternalError(dynamic response) {
    List<String> errors = response.data['errors'];
    var message = "Unexpected error occurred";
    if (errors.length > 0) {
      message = errors.first;
    }
    Map<String, dynamic> value = {"error": message};
    APIError apiError = APIError.fromJson(value);
    return apiError;
  }

  APIError _handleDioError(DioError error) {
    String errorDescription = "Unexpected error occurred";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription = "Unexpected error occurred";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    APIError apiError = APIError();
    apiError.error = errorDescription;
    apiError.statusCode = 500;
    return apiError;
  }
}
