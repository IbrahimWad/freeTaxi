import 'package:flutter/material.dart';
import 'package:freetaxi/screen/auth/createAccount.dart';
import 'package:freetaxi/screen/auth/login.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/borderColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:freetaxi/widget/primaryButton.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../controller/onBordingController.dart';

class OnBording extends GetWidget<OnBordingController> {
  const OnBording({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: RiveAnimation.asset(
              'assets/animation/taxifree-intro.riv',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              onInit: controller.togglePlay(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          CustomText(
            fontsize: 24,
            text: 'مرحباً بك 👋',
            alignment: Alignment.center,
            fontWeight: FontWeight.normal,
            color: primary,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
          ),
          PrimaryButton(
            onPressed: () {
              Get.off(CreateAccount());
            },
            color: bg_white,
            fontsize: 18,
            text: 'انشاء الحساب',
            btColor: primary,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          PrimaryButton(
            onPressed: () {
              Get.off(Login());
            },
            color: primary,
            fontsize: 18,
            text: 'تسجيل الدخول',
            btColor: br_secndory,
          )
        ],
      ),
    );
  }
}
