// ignore: file_names
import 'package:flutter/material.dart';
import 'package:freetaxi/controller/authviewModel.dart';
import 'package:freetaxi/screen/auth/login.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/constant/colors/textColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:freetaxi/widget/customTextFormFild.dart';
import 'package:freetaxi/widget/customeCheackBox.dart';
import 'package:freetaxi/widget/primaryButton.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccount extends GetWidget<AuthviewModel> {
  CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_white,
      body: Form(
        key: controller.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                  CustomTextFormFild(
                    controller: controller.nameController!,
                    onsave: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      return controller.validatename(value);
                    },
                    text: 'الاسم الكامل',
                    hint: 'ع.م احمد علي',
                    iconsax: Iconsax.user,
                    color: primary,
                    maxLength: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextFormFild(
                    controller: controller.phoneController!,
                    keyboardType: TextInputType.number,
                    text: 'رقم الهاتف',
                    hint: 'ادخل رقم الهاتف',
                    iconsax: Iconsax.mobile,
                    color: primary,
                    maxLength: 10,
                    onsave: (value) {
                      controller.phone = value;
                    },
                    validator: (value) {
                      return controller.validatePhone(value);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: Get.width,
                    child: CustomText(
                      text: 'تحديد الجنس',
                      alignment: Alignment.centerRight,
                      fontsize: 14,
                      color: text_1,
                    ),
                  ),
                  Obx(() => DropdownButtonHideUnderline(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 70,
                          width: Get.width - 30,
                          decoration: BoxDecoration(
                            color: bg_input,
                            border: Border.all(color: text_2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(12),
                            icon: CustomText(
                              fontWeight: FontWeight.normal,
                              color: text_3,
                              text: controller.selctedvalue.value == ''
                                  ? 'اختار الجنس'
                                  : controller.selctedvalue.value,
                              alignment: Alignment.center,
                            ),
                            isExpanded: true,
                            hint: Icon(Icons.keyboard_arrow_down),
                            alignment: Alignment.bottomCenter,
                            items: controller.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                                alignment: AlignmentDirectional.center,
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.selctedvalue.value = '$newValue';
                              print(newValue);
                            },
                          ),
                        ),
                      )),
                  Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomText(
                          text: controller.selctedvalue.value == ''
                              ? 'الرجاء قم بتحديد نوع الجنس'
                              : '',
                          color: danger,
                          alignment: Alignment.centerRight,
                          fontWeight: FontWeight.normal,
                          fontsize: 14,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'هل تملك حساب؟',
                    alignment: Alignment.center,
                    color: text_1,
                    fontsize: 16,
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(Login());
                    },
                    child: CustomText(
                      text: 'تسجيل الدخول',
                      alignment: Alignment.center,
                      color: primary,
                      fontsize: 16,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              PrimaryButton(
                onPressed: () {
                  controller.SignUp();
                },
                color: bg_white,
                fontsize: 18,
                text: 'انشاء حساب',
                btColor: primary,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(() => CustomText(
                    text: controller.value.value == false
                        ? 'يرجى الموافقة على شروط الاتفاق'
                        : '',
                    color: danger,
                    fontsize: 14,
                    fontWeight: FontWeight.normal,
                    alignment: Alignment.center,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => CustomCheckbox(
                        value: controller.value.value,
                        color: primary,
                        onChanged: (val) {
                          controller.value.value = !controller.value.value;
                        },
                      )),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  CustomText(
                    text: 'بمجرد انشاء حسابك انت توافق على',
                    alignment: Alignment.center,
                  ),
                ],
              ),
              CustomText(
                text: 'شروط الاتفاق',
                alignment: Alignment.center,
                color: primary,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
