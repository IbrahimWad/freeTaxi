import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freetaxi/main.dart';
import 'package:freetaxi/screen/auth/createAccount.dart';
import 'package:freetaxi/screen/auth/login.dart';
import 'package:freetaxi/screen/home/HomePage.dart';
import 'package:freetaxi/widget/constant/Api/mainUrl.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:get/get.dart';
import '../screen/auth/verfication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';

class AuthviewModel extends GetxController {
  var value = true.obs;
  var selctedvalue = ''.obs;
  var items = [
    'ذكر',
    'انثى',
  ];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController? phoneLoginController, phoneController, nameController;

  var phone = '';
  var name = '';
  var otp1 = '';
  var otp2 = '';
  var otp3 = '';
  var otp4 = '';

  bool isloading = false;
  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    phoneLoginController = TextEditingController();
    //startTimer();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  selectValue() {
    if (selctedvalue.value == 'ذكر') {
      return 'male';
    } else {
      return 'female';
    }
  }

  final _postSingup = GetConnect();

  // ignore: non_constant_identifier_names
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
    isloading = true;
    if (isloading == true) {
      Get.defaultDialog(
          contentPadding: EdgeInsets.all(10),
          barrierDismissible: false,
          backgroundColor: Colors.white.withOpacity(0.4),
          title: 'رجاء الانتظار',
          content: const CircularProgressIndicator(
            color: primary,
          ));
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
    box.write('phone', "+964${phoneController!.value.text}");

    var responseBody = res.data;
    print(responseBody);
    print(res.data['message']);
    isloading = false;
    if (isloading == false) {
      Get.back();
    }

    if (res.data['message'] == 'User Already Registered!') {
      Get.showSnackbar(GetBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: 'انت تمتلك حساب بالفعل'),
              InkWell(
                onTap: () {
                  Get.off(Login());
                  Get.closeCurrentSnackbar();
                },
                child: CustomText(text: 'تسجيل الدخول', color: warning),
              )
            ],
          ),
          // colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          backgroundColor: bg_warning));
      isloading = false;
    } else {
      final response = await dio.post(signOTP,
          data: {
            'phone': "+964${phoneController!.value.text}",
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));

      var responsBody = res.data['otp'];
      box.write('otp', responsBody);

      print(responseBody);

      printError();

      print('error here');

      isloading = false;
      if (isloading == false) {
        Get.back();
        print('hello');
      }
      Get.off(Verfication());
    }

    update();
  }

  login() async {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    isloading = true;

    if (isloading == true) {
      Get.defaultDialog(
          contentPadding: EdgeInsets.all(10),
          barrierDismissible: false,
          backgroundColor: Colors.white.withOpacity(0.4),
          title: 'رجاء الانتظار',
          content: const CircularProgressIndicator(
            color: primary,
          ));
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
    var check = res.data['message'];
    if (check == "SMS Message Sent Successfully!") {
      box.write('phone', '+964${phoneLoginController!.value.text}');
      box.write('otp', responseBody);
      print(responseBody);

      printError();
      isloading = false;
      if (isloading == false) {
        Get.back();
      }
      Get.off(Verfication());
      update();
    }

    String? validatePhone(String value) {
      if (value.length != 10) {
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

    /// Stop Timer
  }
}
