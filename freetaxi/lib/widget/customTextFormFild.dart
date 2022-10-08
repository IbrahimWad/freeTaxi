import 'package:flutter/material.dart';
import 'package:freetaxi/widget/constant/colors/mainColor.dart';
import 'package:freetaxi/widget/constant/colors/textColor.dart';
import 'package:freetaxi/widget/customText.dart';
import 'package:flutter/services.dart';

class CustomTextFormFild extends StatelessWidget {
  final String text;
  var validator;
  var onsave;
  var onTap;
  final Color color;
  final IconData iconsax;
  final String hint;
  final int maxLength;
  final TextInputType keyboardType;
  final TextEditingController controller;

  CustomTextFormFild({
    Key? key,
    required this.text,
    required this.hint,
    required this.iconsax,
    this.onsave,
    this.validator,
    this.onTap,
    required this.color,
    required this.maxLength,
    this.keyboardType = TextInputType.name,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CustomText(
            text: text,
            fontsize: 14,
            color: text_1,
            alignment: Alignment.topRight,
            height: 1,
          ),
          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
            ],
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            validator: validator,
            onSaved: onsave,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color),
              ),
              prefixIcon: Container(
                margin: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      iconsax,
                      color: text_1,
                    ),
                    CustomText(
                      fontsize: 24,
                      text: '|',
                      color: text_4,
                    ),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: hint,
            ),
          )
        ],
      ),
    );
  }
}
