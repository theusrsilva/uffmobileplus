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
          final double width = Get.width;
          return Stack(
            children: [
              // Gradiente de fundo
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: AppColors.darkBlueToBlackGradient(),
                ),
              ),
              // Imagem centralizada por cima do gradiente
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: height * 0.18), 
                  child: Image.asset(
                    'assets/logos/mini_logo_um+.png',
                    fit: BoxFit.contain,
                    height: height / 8,
                    width: width / 4,
                  ),
                ),
              ),
              // Conteúdo da página
              Container(
                width: width,
                height: height,
                child: Column(
                  children: [
                    // Top Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 75), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/logos/mini_logo_um+.png',
                            width: width / 10,
                            height: height / 12,
                            color: Colors.white,
                          ),
                          Visibility(
                            visible: true,//controller.showQrCode,
                            child: Tooltip(
                              message: "QR Code Carteirinha",
                              child: IconButton(
                                onPressed: controller.goToCarteirinhaPage,
                                icon: const Icon(
                                  Icons.qr_code_2,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 300), // Desce os botões
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Botão IdUFF
                              _LoginButton(
                                text: 'Entrar com IdUFF',
                                icon: Icons.account_circle_outlined,
                                onTap: controller.loginIDUFF,
                              ),
                              const SizedBox(height: 28), // Espaçamento maior entre os botões
                              // Botão Google
                              _LoginButton(
                                text: 'Entrar com Google',
                                icon: Icons.g_mobiledata,
                                onTap: (){},
                                //onTap: controller.loginGoogle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Versão
                    Padding(
                      padding: EdgeInsets.only(bottom: height / 20),
                      child: const Text(
                        '6.0.0',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _LoginButton({
    required this.text,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68, // Aumenta a altura
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24), // Deixa mais largo
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(18), // Mais quadrado
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Passion One',
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
