part of 'services.dart';

class MovieService {
  static Future<Either<String, String>> fetchMovie() async {
    final response = await ApiHelper.get(Enpoints.nowPlaying,
        param: {'api_key': Commons.getApiKey()});
    return response.fold(
        (l) => left(l), (r) => right('Success')); //TODO change into our model
  }
}
