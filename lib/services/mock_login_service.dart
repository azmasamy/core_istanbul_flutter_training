import 'package:coreapp1/models/response.dart';
import 'package:coreapp1/models/user.dart';

List<User> users = [
  User(
      id: "0",
      name: "Mohammad Saudi",
      email: "mohammad_saudi@gmail.com",
      password: "m.saudi",
      photo:
          "https://www.matthewdevaney.com/wp-content/uploads/2021/08/powerapps-userphoto-featured-1.jpg",
      subsicription: []),
  User(
      id: "1",
      name: "Ahmad Hassan",
      email: "ahmad_hassan@gmail.com",
      password: "a.hassan",
      photo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ0G1MgilJmPDQXV5nduB7P5WMzy0NNeEhjq-L1tT6L6qQD1UEuddmtKLFToak32ZNNqQ&usqp=CAU",
      subsicription: [])
];

class MockLoginService {
  static Future<Response> login(String email, String passwrod) {
    bool emailFound = false;
    User? loginUser;
    for (User user in users) {
      if (user.email == email) {
        emailFound = true;
        if (user.password == passwrod) {
          loginUser = user;
        }
      }
    }

    if (loginUser != null) {
      return _returnFutureResult(
        message: "Login Successful",
        isSuccesful: true,
        user: loginUser,
      );
    } else if (emailFound) {
      return _returnFutureResult(
        message: "Login Failed, incorrect Password",
        isSuccesful: false,
      );
    } else {
      return _returnFutureResult(
        message: "Login Failed, email not found",
        isSuccesful: false,
      );
    }
  }

  static Future<Response> _returnFutureResult(
      {required String message, required bool isSuccesful, User? user}) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => Response(
          message: message, isOperationSuccessful: isSuccesful, data: user),
    );
  }
}
