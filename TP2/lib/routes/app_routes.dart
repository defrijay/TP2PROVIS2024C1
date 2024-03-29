import 'package:flutter/material.dart';
import '../presentation/sign_up_sign_in_screen/sign_up_sign_in_screen.dart';

class AppRoutes {
  static const String signUpSignInScreen = '/sign_up_sign_in_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        signUpSignInScreen: SignUpSignInScreen.builder,
        initialRoute: SignUpSignInScreen.builder
      };
}
