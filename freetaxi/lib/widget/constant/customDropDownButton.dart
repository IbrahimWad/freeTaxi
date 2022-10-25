import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freetaxi/main.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customText.dart';
import 'colors/borderColor.dart';
import 'colors/mainColor.dart';

class CustomDropDownButton extends StatelessWidget {
  var items;
  var onChanged;
  Widget hint;
  String selectedValue;

  CustomDropDownButton({
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: FormBuilderDropdown(
            decoration: InputDecoration(
                filled: true,
                fillColor: bg_input,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: danger),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: danger)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: divider),
                  borderRadius: BorderRadius.circular(12),
                )),
            onChanged: onChanged,
            hint: hint,
            validator: (value) {
              if (value == null) {
                return 'الرجاء قم بتحديد نوع الجنس';
              }
            },
            items: ['ذكر', 'انثى']
                .map((gender) => DropdownMenuItem(
                    // alignment: AlignmentDirectional.topStart,
                    value: gender,
                    alignment: AlignmentDirectional.center,
                    child: CustomText(
                      text: gender,
                      fontWeight: FontWeight.normal,
                      alignment: Alignment.topRight,
                    )))
                .toList(),
            name: 'gender'));
  }
}
