import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:freetaxi/main.dart';
import 'package:get/get.dart';
import '../screen/auth/verfication.dart';

class AuthviewModel extends GetxController {
  var value = false.obs;
  var selctedvalue = ''.obs;
  var items = [
    'ذكر',
    'انثى',
  ];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController? phoneController,
      nameController,
      otpController1,
      otpController2,
      otpController3,
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void SignUp() {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formkey.currentState!.save();
    Get.off(Verfication());
    startTimer();
    printError();
    print('error here');
  }

  // onChanged(String? newValue) async {
  //   selctedvalue = '$newValue' as RxString;
  // }

  // Validator

  String? validatePhone(String value) {
    if (value.length != 11) {
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

  static const maxSeconds = 60;
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
