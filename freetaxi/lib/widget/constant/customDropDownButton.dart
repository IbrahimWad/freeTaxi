import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freetaxi/main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customText.dart';

class CustomDropDownButton extends StatelessWidget {
  final Color color;
  final Color color2;
  final String text;
  var items;
  var onChanged;
  String selectedValue;

  CustomDropDownButton({
    required this.color,
    required this.color2,
    required this.text,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: Get.height * 0.073,
          width: Get.width - 30,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            // isExpanded: true,
            hint: CustomText(
              fontWeight: FontWeight.normal,
              color: color2,
              text: text,
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
