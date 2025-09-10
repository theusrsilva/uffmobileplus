import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/bindings/home_page_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/lock_develop_mode/bindings/lock_develop_mode_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/binding/login_binding.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/bindings/auth_bindings.dart';
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
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.YOU_SHALL_NOT_PASS,
      page: () => LockDevelopModePage(),
      binding: LockDevelopModeBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      bindings: [LoginBinding(), AuthBinding()],
    ),

    GetPage(
      name: Routes.AUTH,
      page: () => AuthPage(),
      bindings: [AuthBinding(), UserBindings()],
    ),

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
  ];
}
