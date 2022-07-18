import 'package:get/get.dart';

import 'package:move_ticketing_app/view_models/home_view_model.dart';



import '../view_models/ticket_view_model.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => TicketViewModel());
  }
}
