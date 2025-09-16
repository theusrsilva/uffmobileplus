import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/online_turnstile/ui/online_turnstile_page.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/ui/restaurant_modules_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/bindings/home_page_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/bindings/lock_develop_mode_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/binding/login_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/bindings/auth_iduff.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/ui/auth_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/splash/bindings/splash_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/bindings/user_bindings.dart';
import 'package:uffmobileplus/app/modules/internal_modules/web_view/bindings/webview_binding.dart';
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
        SplashBinding(),
        LockDevelopModeBinding(),
        AuthBinding(),
        UserBindings(),
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
      bindings: [LoginBinding()],
    ),

    GetPage(name: Routes.AUTH, page: () => AuthPage(), binding: AuthBinding()),

    GetPage(
      name: Routes.WEB_VIEW,
      page: () => WebViewPage(),
      binding: WebViewBinding(),
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
