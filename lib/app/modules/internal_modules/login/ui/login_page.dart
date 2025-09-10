import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/controller/login_controller.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          builder: (controller) {
            final double height = Get.height;
            return Stack(children: [
              Image.asset(
                'assets/images/uff_background.jpg',
                fit: BoxFit.cover,
                height: height,
              ),
              IgnorePointer(
                  child: Container(
                width: Get.width,
                height: Get.height,
                color: AppColors.lightBlue(alpha: 75),
              )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Image.asset(
                    'assets/logos/mini_logo_um+.png',
                    width: Get.width / 10,
                    height: Get.height / 3,
                    color: Colors.white,
                  ),
                ),
                Visibility(
                  visible: controller.showQrCode,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Tooltip(
                        message: "QR Code Carteirinha",
                        child: IconButton(
                            onPressed: controller.goToCarteirinhaPage,
                            icon: const Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                              size: 36,
                            )),
                      )),
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),
                  CupertinoButton(
                    onPressed: controller.loginIDUFF,
                    color: AppColors.darkBlue(),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Passion One',
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  const Text(
                    'Teste',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: Get.height / 15,
                  )
                ],
              ),
            ]);
          }),
    );
  }
}
