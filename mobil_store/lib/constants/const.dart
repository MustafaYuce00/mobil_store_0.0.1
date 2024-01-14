import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mobil_store/login/flutter_login.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class Const {
  RxBool accountAvailable = true.obs;
  static LoginData? loginData;
  static MotionTabBarController? motionTabBarController;
}
