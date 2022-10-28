import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freetaxi/controller/authviewModel.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/constant/colors/textColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:freetaxi/widget/otptextformfield.dart';
import 'package:freetaxi/widget/primaryButton.dart';
import 'package:get/get.dart';

import '../../main.dart';

class Verfication extends StatelessWidget {
  const Verfication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_white,
      body: GetBuilder<AuthviewModel>(
        init: AuthviewModel(),
        builder: (controller) => ListView(
          children: [
            SizedBox(
              height: Get.height * .07,
            ),
            Form(
              key: controller.OTPformkey,
              child: Column(children: [
                CustomText(
                  fontsize: 18,
                  text: 'رمز التحقق',
                  color: text_5,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                // this most be changed
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomText(
                    text: 'تم ارسال رمز التحقق الئ الرقم',
                    color: text_2,
                  ),
                  CustomText(
                    text: box.read('phone'),
                    color: primary,
                    fontsize: 16,
                  ),
                ]),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(() => Center(
                      child: CustomText(
                        text: controller.time.value,
                        alignment: Alignment.center,
                        fontsize: 32,
                      ),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OtpTextformFiled(
                          onChanged: (value) {
                            Get.closeCurrentSnackbar();
                            // FocusScope.of(context).nextFocus();
                          },
                          validator: (value) {
                            controller.validateOtp(value);
                          },
                          controller: controller.otpController4!,
                          color: primary),
                      OtpTextformFiled(
                          onChanged: (value) {
                            Get.closeCurrentSnackbar();

                            //  FocusScope.of(context).nextFocus();
                          },
                          validator: (value) {
                            controller.validateOtp(value);
                          },
                          controller: controller.otpController3!,
                          color: primary),
                      OtpTextformFiled(
                          onChanged: (value) {
                            Get.closeCurrentSnackbar();

                            // FocusScope.of(context).nextFocus();
                          },
                          validator: (value) {
                            controller.validateOtp(value);
                          },
                          controller: controller.otpController2!,
                          color: primary),
                      OtpTextformFiled(
                          onChanged: (value) {
                            Get.closeCurrentSnackbar();

                            // FocusScope.of(context).nextFocus();
                          },
                          validator: (value) {
                            controller.validateOtp(value);
                          },
                          controller: controller.otpController1!,
                          color: primary),
                    ]),

                SizedBox(
                  height: Get.height * .06,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomText(text: 'لم يصلك الرمز بعد ؟'),
                  Obx(
                    () => GestureDetector(
                        onTap: controller.time != "00:00"
                            ? null
                            : () {
                                Get.closeCurrentSnackbar();
                                controller.resend();
                                print('error');
                              },
                        child: CustomText(
                          text: 'اعادة ارسال الرمز',
                          color: primary,
                        )),
                  ),
                ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                PrimaryButton(
                    onPressed: () {
                      Get.closeCurrentSnackbar();

                      controller.verfication();
                    },
                    color: bg_white,
                    fontsize: 16,
                    text: 'تأكيد الرمز',
                    btColor: primary)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
