import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:radio_player/radio_player.dart';
import 'package:uffmobileplus/app/modules/external_modules/radio/controller/radio_controller.dart';
import 'package:uffmobileplus/app/utils/color_pallete.dart';

class Radio extends StatelessWidget {
  const Radio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.darkBlueToBlackGradient(),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              foregroundColor: Colors.white,
              // TODO: traduzir?
              // TODO: essa string deveria vir de outro lugar?
              title: Text("Radio Pop Goiaba"),
              centerTitle: true,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: AppColors.appBarTopGradient()),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.question_mark)
                ),
              ],
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Track(),
                    PlayPauseButton(),
                    Track()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayPauseButton extends GetView<RadioController> {
  const PlayPauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.toggleState(),
      child: Obx(() => Icon(
        controller.playbackState.value == PlaybackState.playing
        ? Icons.pause
        : Icons.play_arrow,
        color: Colors.white,
        size: 120
      )
      )
    );
  }
}

class Track extends GetView<RadioController> {
  const Track({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 100,
        child: Marquee(
          text: controller.showMetadata(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white, 
            //fontWeight: FontWeight.bold
          ),
          blankSpace: 100,
        ),
      )
    );
  }
}