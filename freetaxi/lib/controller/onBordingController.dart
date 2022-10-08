import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OnBordingController extends GetxController {
  late RiveAnimationController controller;

  @override
  void onInit() {
    super.onInit();
    togglePlay();
  }

  bool _isPlaying = true;
  bool get isPlaying => controller.isActive;

  togglePlay() {
    controller = OneShotAnimation(
      'ibo',
      autoplay: false,
      onStart: () {
        if (_isPlaying == false) {
          _isPlaying = true;
        } else {}
      },
    );

    update();
  }
}
