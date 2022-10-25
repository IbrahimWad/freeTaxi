import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpTextformFiled extends StatelessWidget {
  final TextEditingController controller;
  var validator;
  var onsave;
  var onChanged;
  final Color color;
  OtpTextformFiled({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.validator,
    required this.color,
    this.onsave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.15,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        validator: validator,
        onChanged: onChanged,
        onSaved: onsave,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: color),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: '*',
        ),
      ),
    );
  }
}
