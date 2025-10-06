import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/controller/about_controller.dart';
import 'package:uffmobileplus/app/utils/base_translation_keys.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.darkBlueToBlackGradient(),
        ),
        child: GetBuilder<AboutController>(
          init: AboutController(),
          builder: (controller) {
            return CustomScrollView(
              slivers: [
                _sliverAppBar(BaseTranslationKeys.aboutAppBarPageTitle.tr),
                _aboutItemCard(
                  Icons.home,
                  BaseTranslationKeys.versionName.tr, 
                  controller.versionName,
                ),
                _aboutItemCard(
                  Icons.update,
                  BaseTranslationKeys.versionCode.tr, 
                  controller.versionCode,
                ),
                _aboutItemCard(
                  Icons.phone_android,
                  BaseTranslationKeys.device.tr,
                  controller.device,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // TODO: app bar identica à utilizada na página Configurações, extrair para um componente reutilizável
  Widget _sliverAppBar(String title) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      title: Text(title),
      centerTitle: true,
      elevation: 8,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),

      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: AppColors.appBarTopGradient()),
      ),

      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.question_mark)),
      ],
    );
  }

  // Widget individual para cada item na lista exibida na página "Sobre"
  Widget _aboutItemCard(IconData icon, String title, String description) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
