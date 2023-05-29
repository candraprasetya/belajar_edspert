part of 'services.dart';

class UserService {
  static Future<Either<String, UserModel>> regis(
    String name,
    String email,
    String password,
  ) async {
    final response = await ApiHelper.post(Enpoints.users, param: {
      "name": name,
      "email": email,
      "password": password,
      "avatar":
          "https://www.blibli.com/friends-backend/wp-content/uploads/2022/11/biodata-maudy-ayunda.jpg"
    });
    return response.fold((l) => left(l), (r) => right(userModelFromMap(r)));
  }

  static Future<Either<String, String>> login() async {
    final response = await ApiHelper.post(Enpoints.userLogin, param: {
      "email": "candra@gmail.com",
      "password": "12345",
    });
    print(response);
    return response.fold(
        (l) => left(l), (r) => right('Success')); //TODO change into our model
  }

  static Future<Either<String, UserModel>> profile() async {
    final response = await ApiHelper.get(Enpoints.profile);

    return response.fold((l) => left(l),
        (r) => right(userModelFromMap(r))); //TODO change into our model
  }
}
