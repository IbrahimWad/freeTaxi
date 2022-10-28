import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freetaxi/widget/constant/colors/textColor.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.text,
      this.alignment = Alignment.bottomLeft,
      this.color = text_1,
      this.fontsize = 16,
      this.height = 1,
      this.fontWeight = FontWeight.bold})
      : super(key: key);
  final String text;
  final Alignment alignment;
  final Color color;
  final double fontsize, height;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: fontsize,
          height: height,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
