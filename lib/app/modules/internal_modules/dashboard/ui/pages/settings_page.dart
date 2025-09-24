import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/routes/app_routes.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.darkBlueToBlackGradient(),
        ),
        child: CustomScrollView(
          slivers: [
            _sliverAppBar("Configurações"), // TODO: internacionalizar
            _settingsItem(
              Icons.info_outline,
              "Sobre", // TODO: internacionalizar
              "Informações sobre o aplicativo", // TODO: internacionalizar
              onTap: () {
                Get.toNamed(Routes.ABOUT);
              },
            ),
          ],
        ),
      ),
    );
  }

  // TODO: app bar identica à utilizada na página Sobre, extrair para um componente reutilizável
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

  Widget _settingsItem(
    IconData icon,
    String title,
    String description, {
    VoidCallback? onTap,
  }) {
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
          trailing: Icon(Icons.chevron_right, color: Colors.white70),
          onTap: onTap,
        ),
      ),
    );
  }
}
