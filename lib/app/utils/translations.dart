import 'package:get/get.dart';
import 'package:uffmobileplus/app/utils/base_translation_keys.dart';


class International extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': _translation(
      // PersistentTabView
      shortcuts: 'Shortcuts',
      // External Modules Page
      modules: 'Modules',
      // External Modules Controller
      restaurant: 'Restaurant',
      // Restaurant Modules Page
      universityCafeteria: 'University Cafeteria',
      // Restaurant Modules Controller
      onlineTurnstile: 'Online Turnstile',
      // Settings Page
      settings: 'Settings',
      about: 'About',
      aboutDescription: 'Application details',
      langDescription: 'Change App language',
      // About Page
      aboutAppBarPageTitle: 'About',
      versionName: 'Version name',
      versionCode: 'Version code',
      device: 'Device',
    ),
    'pt_BR': _translation(
      // PersistentTabView
      shortcuts: 'Atalhos',
      // External Modules Page
      modules: 'Módulos',
      // External Modules Controller
      restaurant: 'Restaurante',
      // Restaurant Modules Page
      universityCafeteria: 'Restaurante Universitário',
      // Restaurant Modules Controller
      onlineTurnstile: 'Catraca Online',
      // Settings page
      settings: 'Configurações',
      about: 'Sobre',
      aboutDescription: 'Detalhes do aplicativo',
      langDescription: 'Alterar idioma do aplicativo',
      // About Page
      aboutAppBarPageTitle: 'Sobre',
      versionName: 'Nome da versão',
      versionCode: 'Código da versão',
      device: 'Dispositivo',
    ),
     'it_IT': _translation(
      // PersistentTabView
    shortcuts: 'Scorciatoie',
    // External Modules Page
    modules: 'Moduli',
    // External Modules Controller
    restaurant: 'Ristorante',
    // Restaurant Modules Page
    universityCafeteria: 'Mensa Universitaria',
    // Restaurant Modules Controller
    onlineTurnstile: 'Tornello Online',
    // Settings page
    settings: 'Impostazioni',
    about: 'Informazioni', 
    aboutDescription: "Dettagli dell'app",
    langDescription: "Cambia la lingua dell'app",
    aboutAppBarPageTitle: 'Informazioni',
    versionName: 'Versione',
    versionCode: 'Codice build',
    device: 'Dispositivo',
  ),
  };

  // TODO: fazer um método do tipo para cada página e depois concatenar todos???
  // TODO: será que é melhor que as traduções fiquem na sua página correspondente?
  /// Para cada tradução, deve-se adicionar neste método um parâmetro p obrigatório
  /// bem como um par chave-valor correspondente no retorno da função, onde a 
  /// chave é dada por uma constante, definida em base_translation_keys.dart e
  /// o valor é p. A idéia é o desenvolvedor receber erro de compilação nas
  /// chamadas deste método sempre que ele esquecer de adicionar uma tradução 
  /// para uma determinada locale.
  Map<String, String> _translation({
    // PersistentTabView
    required String shortcuts,
    // External Modules Page
    required String modules,
    // External Modules Controller
    required String restaurant,
    // Restaurant Modules Page
    required String universityCafeteria,
    // Restaurant Modules Controller
    required String onlineTurnstile,
    // Settings Page
    required String settings,
    required String about,
    required String aboutDescription,
    required String langDescription,
    // About Page
    required String aboutAppBarPageTitle,
    required String versionName,
    required String versionCode,
    required String device,
  }) {
    return {
      // PersistentTabView
      BaseTranslationKeys.shortcuts: shortcuts,
      // External Modules
      BaseTranslationKeys.modules: modules,
      // External Modules Controller
      BaseTranslationKeys.restaurant: restaurant,
      // Restaurant Modules Page
      BaseTranslationKeys.universityCafeteria: universityCafeteria,
      // Restaurant Modules Controller
      BaseTranslationKeys.onlineTurnstile: onlineTurnstile,
      // Settings Page
      BaseTranslationKeys.settings: settings,
      BaseTranslationKeys.about: about,
      BaseTranslationKeys.aboutDescription: aboutDescription,
      BaseTranslationKeys.langDescription: langDescription,
      // About Page
      BaseTranslationKeys.aboutAppBarPageTitle: aboutAppBarPageTitle,
      BaseTranslationKeys.versionName: versionName,
      BaseTranslationKeys.versionCode: versionCode,
      BaseTranslationKeys.device: device,
    };
  }
}
