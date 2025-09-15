import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uffmobileplus/app/modules/external_modules/restaurante/modules/online_turnstile/controller/online_turnstile_controller.dart';

class OnlineTurnstilePage extends GetView<OnlineTurnstilePageController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('OnlineTurnstilePage')),

    body: SafeArea(
      child: Text('OnlineTurnstilePageController'))
    );
  }
}