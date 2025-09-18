import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/online_turnstile/ui/online_turnstile_page.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/ui/restaurant_modules_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/bindings/home_page_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/bindings/lock_develop_mode_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/binding/login_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/google/bindings/Auth_Google_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/bindings/auth_iduff_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/ui/auth_iduff_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/bindings/splash_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/bindings/user_auth_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/bindings/user_google_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/bindings/user_umm_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/web_view/bindings/webview_bindings.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/ui/home_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/ui/login_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/ui/splash_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/ui/lock_develop_mode_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/web_view/ui/webview_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      bindings: [
        SplashBindings(),
        LockDevelopModeBinding(),
        AuthIduffBindings(),
        UserAuthBindings(),
        UserUmmBindings(),
        AuthGoogleBindings(),
      ],
    ),

    GetPage(
      name: Routes.YOU_SHALL_NOT_PASS,
      page: () => LockDevelopModePage(),
      binding: LockDevelopModeBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [LoginBindings(), AuthGoogleBindings(), UserGoogleBindings()],
    ),

    GetPage(
      name: Routes.AUTH,
      page: () => AuthIduffPage(),
      bindings: [AuthIduffBindings(), UserUmmBindings(), UserAuthBindings()],
    ),

    GetPage(
      name: Routes.WEB_VIEW,
      page: () => WebViewPage(),
      binding: WebViewBindings(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),

    //Restaurante
    GetPage(
      name: Routes.RESTAURANT_MODULES,
      page: () => RestaurantModulesPage(),
    ),
    GetPage(name: Routes.ONLINE_TURNSTILE, page: () => OnlineTurnstilePage()),
  ];
}
