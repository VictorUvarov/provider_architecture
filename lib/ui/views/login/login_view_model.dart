import 'package:pedantic/pedantic.dart';
import 'package:provider_start/core/constant/view_routes.dart';
import 'package:provider_start/core/exceptions/auth_exception.dart';
import 'package:provider_start/core/mixins/validators.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/utils/logger.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> login(String email, String password) async {
    setBusy(true);
    try {
      await _authService.signInWithEmailAndPassword(email, password);
      unawaited(_navigationService.popAllAndPushNamed(ViewRoutes.main));
    } on AuthException catch (e) {
      Logger.e(e.message);
      setBusy(false);
    }
  }
}
