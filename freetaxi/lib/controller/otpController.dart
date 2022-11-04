import 'dart:async';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../screen/home/HomePage.dart';
import '../widget/constant/Api/mainUrl.dart';
import '../widget/constant/colors/backgrondColor.dart';
import '../widget/customText.dart';

class OtpController extends GetxController {
  TextEditingController? otpController1,
      otpController2,
      otpController3,
      otpController4;
  final GlobalKey<FormState> OTPformkey = GlobalKey<FormState>();
  @override
  void onInit() {
    otpController1 = TextEditingController();
    otpController2 = TextEditingController();
    otpController3 = TextEditingController();
    otpController4 = TextEditingController();
    AutofillSms();
    startTimer(60);
    super.onInit();
  }

  String? validateOtp(String value) {
    if (value.length != 1) {
      return 'الرجاء ادخال رقم هاتف صحيح';
    }
    return null;
  }

  Timer? _timer;
  int remainingSeconsd = 1;
  final time = '00:00'.obs;
  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconsd = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconsd == -1) {
        timer.cancel();
      } else {
        int minutes = remainingSeconsd ~/ 60;
        int seconds = (remainingSeconsd % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconsd--;
      }
    });

    update();
  }

  resend() async {
    startTimer(60);
    Get.closeCurrentSnackbar();
    final dio = Dio();
    final res = await dio.post(
      signOTP,
      data: {'phone': box.read('phone')},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var responseBody = res.data['otp'];

    box.write('otp', responseBody);
  }

  SendOtp(String phone, String hashedOTP, String otp) async {
    final dio = Dio();

    dio.post(verifyOTP,
        data: {
          'phone': phone,
          'hashedOTP': hashedOTP,
          'otp': otp,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  verfication() async {
    final dio = Dio();

    print(
        '${otpController1!.value.text}${otpController2!.value.text}${otpController3!.value.text}${otpController4!.value.text}');
    final res = await dio.post(verifyOTP,
        data: {
          'phone': box.read('phone'),
          'hashedOTP': box.read('otp'),
          'otp':
              '${otpController1!.value.text}${otpController2!.value.text}${otpController3!.value.text}${otpController4!.value.text}',
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));

    var check = res.data['message'];
    if (check == 'OTP Is Not Valid!' ||
        res.data['message'] == "\"otp\" is not allowed to be empty") {
      Get.showSnackbar(GetBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: 'الرمز غير صحيح'),
            ],
          ),
          onTap: (SnackBar) {
            Get.closeCurrentSnackbar();
          },
          // colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: bg_warning));
    } else {
      Get.closeCurrentSnackbar();
      Get.off(HomePage());
    }

    update();
  }

  String? _commingSms = 'SignOTP';

  AutofillSms() async {
    final dio = Dio();
    String? commingSms;

    try {
      commingSms = await AltSmsAutofill().listenForSms;
      final res = SendOtp(box.read('phone'), box.read('otp'), '$commingSms');
      Get.off(HomePage());
      print(commingSms);
      Get.closeCurrentSnackbar();
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
      print(commingSms);
    }
    if (Get.routing.current != "/Verfication") return;
    _commingSms = commingSms;
  }
}
