import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/controller/auth_iduff_controller.dart';
import 'package:uffmobileplus/app/utils/ui_components/custom_progress_display.dart';

class AuthIduffPage extends GetView<AuthIduffController> {
  const AuthIduffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CustomProgressDisplay())
            : const SizedBox.shrink(),
      ),
    );
  }
}
