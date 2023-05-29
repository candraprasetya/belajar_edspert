part of 'utilities.dart';

class ApiHelper {
  static Future<Either<String, dynamic>> get(String endPoint,
      {Map<String, dynamic>? param}) async {
    final uri = Uri.https(Commons.getBaseUrl(), endPoint, param);
    late http.Response response;
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjM3LCJpYXQiOjE2ODUzNTg4ODUsImV4cCI6MTY4NzA4Njg4NX0.GZWX0c3IYXlAz5iTZiNvKNjhjNkhyAWueUl4EpuiBlE';
    try {
      response = await http.get(
        uri,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    } on SocketException {
      throw left(FetchDataException('No Internet'));
    } on FormatException {
      throw left(FetchDataException('Bad Response'));
    }

    return returnResponse(response);
  }

  static Future<Either<String, dynamic>> post(String endPoint,
      {Map<String, dynamic>? param}) async {
    final uri = Uri.https(Commons.getBaseUrl(), endPoint);
    late http.Response response;
    try {
      response = await http.post(uri,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode(param));
    } on SocketException {
      throw left(FetchDataException('No Internet'));
    } on FormatException {
      throw left(FetchDataException('Bad Response'));
    }

    return returnResponse(response);
  }
}

Either<String, dynamic> returnResponse(http.Response response) {
  String responseJson = response.body;
  final jsonResponse = json.decode(responseJson);
  switch (response.statusCode) {
    case 200:
      return right(responseJson);
    case 201:
      return right(responseJson);
    case 500:
    default:
      throw left(jsonResponse['message'] ?? 'Error Guys');
  }
}
