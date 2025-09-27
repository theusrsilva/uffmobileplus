import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/controller/home_page_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/ui/pages/external_modules_page.dart';
import 'package:uffmobileplus/app/modules/internal_modules/dashboard/ui/pages/settings_page.dart';
import 'package:uffmobileplus/app/utils/base_translation_keys.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: AppColors.darkBlue(),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            // Menu hambúrguer - por enquanto sem ação
          },
        ),
        title: Center(child: Text('UM +', style: TextStyle(color: Colors.white))),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white,),
            onPressed: () {
              // Interrogação - por enquanto sem ação
            },
          ),
        ],
      ),*/
      body: PersistentTabView(
        context,
        controller: controller.tabController,
        screens: [
          Container(child: Center(child: Text('Atalhos'))),
          ExternalModulesPage(),
          SettingsPage(),
        ],
        items: [
          // Tela Principal
          PersistentBottomNavBarItem(
            icon: Icon(Icons.phonelink_setup),
            title: BaseTranslationKeys.shortcuts.tr,
            activeColorPrimary: AppColors.lightBlue(),
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.black,
          ),

          // Tela de Serviços
          PersistentBottomNavBarItem(
            icon: Icon(Icons.business),
            title: BaseTranslationKeys.modules.tr,
            activeColorPrimary: AppColors.lightBlue(),
            inactiveColorPrimary: Colors.black,
            activeColorSecondary: Colors.black,
          ),

          // Tela de Configurações
          PersistentBottomNavBarItem(
            icon: Icon(Icons.settings),
            title: BaseTranslationKeys.settings.tr,
            activeColorPrimary: AppColors.lightBlue(),
            inactiveColorPrimary: Colors.grey,
            activeColorSecondary: Colors.black,
          ),
        ],
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }
}
