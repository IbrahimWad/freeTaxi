import 'package:flutter/material.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:freetaxi/widget/constant/colors/borderColor.dart';
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
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
              LengthLimitingTextInputFormatter(maxLength),
            ],
            controller: controller,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
            validator: validator,
            onSaved: onsave,
            decoration: InputDecoration(
              fillColor: bg_input,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color),
              ),
              prefixIcon: Container(
                margin: EdgeInsets.only(right: 15, left: 5),
                padding: EdgeInsets.only(left: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      iconsax,
                      color: text_1,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: divider,
                      child: Text(''),
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
