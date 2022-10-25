import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freetaxi/main.dart';
import 'package:freetaxi/model/auth/authModel.dart';
import 'package:freetaxi/model/auth/sign_otp.dart';
import 'package:freetaxi/screen/home/HomePage.dart';
import 'package:freetaxi/widget/constant/Api/mainUrl.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../screen/auth/login.dart';
import '../screen/auth/verfication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthviewModel extends GetxController {
  var value = true.obs;
  var selctedvalue = ''.obs;
  var items = [
    'ذكر',
    'انثى',
  ];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> OTPformkey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController? phoneController,
      nameController,
      otpController1,
      otpController2,
      otpController3,
      phoneLoginController,
      otpController4;

  var phone = '';
  var name = '';
  var otp1 = '';
  var otp2 = '';
  var otp3 = '';
  var otp4 = '';
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    otpController1 = TextEditingController();
    otpController2 = TextEditingController();
    otpController3 = TextEditingController();
    otpController4 = TextEditingController();
    phoneLoginController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
  }

  selectValue() {
    if (selctedvalue.value == 'ذكر') {
      return 'male';
    } else {
      return 'female';
    }
  }

  final _postSingup = GetConnect();
  void SignUp() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (value.value == false) {
      return;
    }
    if (selctedvalue.value == '') {
      return;
    }
    formkey.currentState!.save();
    print(selctedvalue.value);

    final dio = Dio();
    final res = await dio.post(
      registerUser,
      data: {
        'phone': "+964${phoneController!.value.text}",
        'name': nameController!.value.text,
        'gender': selectValue(),
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    // box.write('phone', "+964${phoneController!.value.text}");
    if (res.data['message'] == 'User Already Registered!') {
      // Get.showSnackbar(
      //   GetBar(
      //     message: 'U alredy',
      //     snackPosition: SnackPosition.TOP,
      //    // titleText: BigText(text: title, color: Colors.white),
      //     backgroundColor: bg_warning,
      //   ),
      // );
    } else {
      final response = await dio.post(signOTP,
          data: {
            'phone': "+964${phoneController!.value.text}",
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
      var responseBody = res.data;
      var responsBody = res.data['otp'];
      box.write('otp', responsBody);
      print(responseBody);
      startTimer();
      Get.off(Verfication());
      printError();

      print('error here');
    }
  }

  login() async {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print("${phoneLoginController!.value.text} also");
    loginKey.currentState!.save();
    final dio = Dio();
    final res = await dio.post(
      signOTP,
      data: {'phone': "+964${phoneLoginController!.value.text}"},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var responseBody = res.data['otp'];
    box.write('phone', '+964${phoneLoginController!.value.text}');
    box.write('otp', responseBody);
    print(responseBody);

    Get.off(Verfication());
    startTimer();
    printError();
  }

  verfication() async {
    final dio = Dio();
    print(
        '${otpController1!.value.text}${otpController2!.value.text}${otpController3!.value.text}${otpController4!.value.text}');
    final res = await dio.post(
      verifyOTP,
      data: {
        'phone': box.read('phone'),
        'hashedOTP': box.read('otp'),
        'otp':
            '${otpController1!.value.text}${otpController2!.value.text}${otpController3!.value.text}${otpController4!.value.text}'
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var responseBody = res.data['token'];
    Get.off(HomePage());

    print(responseBody);
  }

  resend() async {
    final dio = Dio();
    final res = await dio.post(
      signOTP,
      data: {'phone': "+964${phoneLoginController!.value.text}"},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var responseBody = res.data['otp'];
    box.write('phone', '+964${phoneLoginController!.value.text}');
    box.write('otp', responseBody);
  }

  String? validatePhone(String value) {
    if (value.length != 10) {
      return 'الرجاء ادخال رقم هاتف صحيح';
    }
    return null;
  }

  String? validateOtp(String value) {
    if (value.length != 1) {
      return 'الرجاء ادخال رقم هاتف صحيح';
    }
    return null;
  }

  String? validatename(String value) {
    if (value.length < 6) {
      Alignment.centerRight;
      return 'الرجاء قم بادخال الاسم الكامل';
    }
    return null;
  }

  static const maxSeconds = 59;
  var seconds = maxSeconds;
  Timer? timer;

  void startTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        stopTimer(rest: false);
        resetTimer();
      }
    });
    update();
  }

  /// Stop Timer
  void stopTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer?.cancel();
    update();
  }

  /// Reset Timer
  void resetTimer() {
    seconds = maxSeconds;
    update();
  }

  /// is Timer Active?
  bool isTimerRuning() {
    return timer == null ? false : timer!.isActive;
  }

  /// is Timer Completed?
  bool isCompleted() {
    return seconds == maxSeconds || seconds == 0;
  }
}
