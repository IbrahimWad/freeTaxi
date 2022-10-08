import 'package:freetaxi/controller/authviewModel.dart';
import 'package:freetaxi/controller/onBordingController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBordingController());
    Get.lazyPut(() => AuthviewModel(), fenix: true);
  }
}
