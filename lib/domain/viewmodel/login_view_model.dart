import 'package:technologies_login_example/di/components/service_locator.dart';
import 'package:technologies_login_example/domain/enums/view_state.dart';
import 'package:technologies_login_example/domain/models/login/login_request.dart';
import 'package:technologies_login_example/domain/repositories/user_repository.dart';
import 'package:technologies_login_example/domain/viewmodel/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final UserRepository _userRepository = getIt<UserRepository>();
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    setState(ViewState.BUSY);
    var success = await _userRepository
        .loginUser(LoginRequest(email: email, password: password));
    setState(ViewState.IDLE);
    if (success.data?.user?.id != null) {
      _userRepository.insertUser(success.data!.user!);
      return true;
    } else {
      errorMessage = "Invalid credentials";
      return false;
    }
  }
}
