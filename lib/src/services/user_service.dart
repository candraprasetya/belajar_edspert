part of 'services.dart';

class UserService {
  static Future<Either<String, String>> regis() async {
    final response = await ApiHelper.post(Enpoints.users, param: {
      "name": "Candra",
      "email": "candra@gmail.com",
      "password": "12345",
      "avatar":
          "https://www.blibli.com/friends-backend/wp-content/uploads/2022/11/biodata-maudy-ayunda.jpg"
    });
    return response.fold(
        (l) => left(l), (r) => right('Success')); //TODO change into our model
  }

  static Future<Either<String, String>> login() async {
    final response = await ApiHelper.post(Enpoints.userLogin, param: {
      "email": "candra@gmail.com",
      "password": "12345",
    });
    return response.fold(
        (l) => left(l), (r) => right('Success')); //TODO change into our model
  }

  static Future<Either<String, UserModel>> profile() async {
    final response = await ApiHelper.get(Enpoints.profile);

    return response.fold((l) => left(l),
        (r) => right(userModelFromMap(r))); //TODO change into our model
  }
}
