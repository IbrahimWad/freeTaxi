import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:freetaxi/widget/constant/colors/backgrondColor.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              child: Icon(
                Iconsax.setting_2,
                size: 30,
                color: Colors.black,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
