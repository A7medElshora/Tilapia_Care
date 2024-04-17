import 'package:get/get.dart';


class UserController extends RxController {
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;

  void sendData(String userName ,String userEmail, String userPhone) async {

    name = userName.obs;
    email = userEmail.obs;
    phone = userPhone.obs;
  }
}
