import 'package:injectable/injectable.dart';
import 'package:technologies_login_example/di/components/service_locator.dart';

import 'injection.config.dart';
@injectableInit
Future<void> configureMainInjection() async {
  await $initGetIt(getIt);
}
