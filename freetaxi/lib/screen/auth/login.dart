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
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .1,
                ),
                Center(child: SvgPicture.asset('assets/images/phone-hand.svg')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                CustomText(
                  text: 'الرجاء قم بادخال رقم هاتفك للوصول الى خدمات',
                  fontWeight: FontWeight.normal,
                  color: text_2,
                  fontsize: 16,
                  alignment: Alignment.bottomRight,
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
                Form(
                    child: Column(children: [
                  CustomTextFormFild(
                      onsave: (value) {
                        controller.phone = value;
                      },
                      validator: (value) {
                        return controller.validatePhone(value);
                      },
                      controller: controller.phoneController!,
                      keyboardType: TextInputType.number,
                      text: 'رقم الهاتف',
                      hint: '07500000000',
                      iconsax: Iconsax.mobile,
                      color: primary,
                      maxLength: 11)
                ])),
                SizedBox(
                  height: Get.height * .1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    CustomText(
                      text: 'لا تملك حساب؟',
                      alignment: Alignment.center,
                      color: text_1,
                      fontsize: 16,
                      height: 1,
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
                    Get.off(Verfication());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
