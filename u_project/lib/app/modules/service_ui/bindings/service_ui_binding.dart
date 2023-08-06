import 'package:get/get.dart';

import '../controllers/service_ui_controller.dart';

class ServiceUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceUiController>(
      () => ServiceUiController(),
    );
  }
}
