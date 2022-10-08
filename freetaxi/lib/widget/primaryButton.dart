import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freetaxi/widget/customText.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.fontsize,
      required this.text,
      required this.btColor})
      : super(key: key);
  final Function() onPressed;
  final Color color, btColor;
  final double fontsize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      // width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .06,
      child: FlatButton(
        color: btColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          child: CustomText(
            alignment: Alignment.center,
            color: color,
            fontsize: fontsize,
            height: 1,
            text: text,
          ),
        ),
      ),
    );
  }
}
