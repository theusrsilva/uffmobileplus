import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/hive_service.dart';
import 'package:uffmobileplus/app/routes/app_pages.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';
import 'package:uffmobileplus/app/utils/translations.dart';
import 'package:uffmobileplus/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await HiveService.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: true,

      title: "UFF Mobile Plus",
      initialRoute: Routes.SPLASH, //Rota inicial
      defaultTransition: Transition.fade, // Transição de telas padrão
      //theme: pickCurrentAppTheme() , //Tema personalizado app
      translations: International(),
      locale: Get.deviceLocale, // Seta o idioma padrão do app como o mesmo do dispositivo
      fallbackLocale: Locale('pt', 'BR'), // Seta o idioma utilizado, caso o do dispositivo não seja suportado 
      getPages: AppPages.pages, // Seu array de navegação contendo as rotas e suas pages
      /*
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
