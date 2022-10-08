import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCheckbox extends StatelessWidget {
  var value;
  var onChanged;
  final Color color;
  CustomCheckbox(
      {required this.value, required this.color, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: color,
      ),
    );
  }
}
