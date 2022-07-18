import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/ticket_model.dart';

class TicketViewModel extends GetxController {
  List<TicketModel> orderList = [];

  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('tickets');

  Future<void> getOrders() async {
    await orderRef.get().then((value) {
      for (var i in value.docs) {
        orderList.add(TicketModel(
          moviePoster: i['moviePoster'],
          movieName: i['movieName'],
          seats: i['seats'],
          totalPrice: i['totalPrice'],
          timePacked: i['timePacked'],
        ));
      }
      update();
    });
  }
  @override
  void onInit() {
    orderList.clear();
    getOrders();
    super.onInit();
  }
}
