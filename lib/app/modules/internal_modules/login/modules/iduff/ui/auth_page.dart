import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';
import 'package:uffmobileplus/app/utils/ui_components/custom_progress_display.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        // chama login() assim que o GetBuilder for inicializado 
        initState: (_) => Get.find<AuthController>().login(),
        builder: (_) => Container(
          color: AppColors.lightBlue(),
          child: const Center(child: CustomProgressDisplay()),
        ),
      ),
    );
  }
}
