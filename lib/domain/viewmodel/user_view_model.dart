import 'package:technologies_login_example/di/components/service_locator.dart';
import 'package:technologies_login_example/domain/enums/view_state.dart';
import 'package:technologies_login_example/domain/models/login/login_response.dart';
import 'package:technologies_login_example/domain/repositories/user_repository.dart';
import 'package:technologies_login_example/domain/viewmodel/base_view_model.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository _userRepository = getIt<UserRepository>();
  late User? user;

  Future<bool> isUserLoggedIn() async {
    setState(ViewState.BUSY);
    var success = await _userRepository.getUser();
    setState(ViewState.IDLE);
    if (success.first.id != null) {
      user = success.first;
      return true;
    } else {
      user = User();
      return false;
    }
  }
}
