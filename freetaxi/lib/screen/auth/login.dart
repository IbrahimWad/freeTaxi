import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freetaxi/controller/authviewModel.dart';
import 'package:freetaxi/screen/auth/createAccount.dart';
import 'package:freetaxi/screen/auth/verfication.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/constant/colors/textColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:freetaxi/widget/customTextFormFild.dart';
import 'package:freetaxi/widget/primaryButton.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Login extends GetWidget<AuthviewModel> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: controller.loginKey,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Center(
                      child: SvgPicture.asset('assets/images/phone-hand.svg')),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  CustomText(
                    text: 'الرجاء قم بادخال رقم هاتفك للوصول الى خدمات',
                    fontWeight: FontWeight.normal,
                    color: text_2,
                    fontsize: 16,
                    alignment: Alignment.centerRight,
                  ),
                  CustomText(
                    text: 'التطبيق',
                    fontWeight: FontWeight.normal,
                    color: text_2,
                    fontsize: 16,
                    alignment: Alignment.bottomRight,
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  Column(children: [
                    Stack(
                      children: [
                        CustomTextFormFild(
                            onsave: (value) {
                              controller.phone = value;
                            },
                            validator: (value) {
                              if (value.length != 10 || value == null) {
                                return 'الرجاء ادخال رقم هاتف صحيح';
                              } else if (value.isNotEmpty) {
                                return null;
                              }
                            },
                            controller: controller.phoneLoginController!,
                            keyboardType: TextInputType.number,
                            text: 'رقم الهاتف',
                            hint: '7500000000',
                            iconsax: Iconsax.mobile,
                            color: primary,
                            maxLength: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 46),
                          child: CustomText(
                            alignment: Alignment.centerLeft,
                            text: '+964',
                            color: primary,
                          ),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'لا تملك حساب؟',
                        alignment: Alignment.center,
                        color: text_1,
                        fontsize: 16,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(Login());
                        },
                        child: InkWell(
                          onTap: () {
                            Get.off(CreateAccount());
                          },
                          child: CustomText(
                            text: 'انشاء حساب',
                            alignment: Alignment.center,
                            color: primary,
                            fontsize: 16,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  PrimaryButton(
                    btColor: primary,
                    text: 'تسجيل الدخول',
                    color: bg_white,
                    fontsize: 18,
                    onPressed: () {
                      controller.login();
                      Get.closeCurrentSnackbar();
                      // Get.off(Verfication());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
