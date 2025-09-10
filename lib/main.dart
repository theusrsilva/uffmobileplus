import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/data/models/auth_model.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/data/models/user_auth_model.dart';
import 'package:uffmobileplus/app/routes/app_pages.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();
  // Registrar adapters
  Hive.registerAdapter(AuthInformationModelAdapter());
  Hive.registerAdapter(UserAuthModelAdapter());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: true,

      title: "UFF Mobile Plus",
      initialRoute: Routes.SPLASH, //Rota inicial
      defaultTransition: Transition.fade, // Transição de telas padrão

      //theme: pickCurrentAppTheme() , //Tema personalizado app
      getPages: AppPages
          .pages, // Seu array de navegação contendo as rotas e suas pages

      /*
    locale: localeStr == null
        ? Get.deviceLocale
        : Locale(localeStr), // Língua padrão é a do dispositivo

    fallbackLocale: const Locale('pt', 'BR'),
    translations: International(),
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      SfGlobalLocalizations.delegate
    ],
    supportedLocales: const [
      Locale('pt'),
      Locale('en'),
      Locale('it'),
      Locale('fr'),
      Locale('es'),
    ],
    */
    ),
  );
}
