import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constans.dart';
import '../../view_models/ticket_view_model.dart';

class TicketView extends GetWidget<TicketViewModel> {
  TicketView({Key? key}) : super(key: key);
  final controller = Get.put(TicketViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pocked Tickets',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.orderList.clear();
            controller.getOrders();
            controller.update();
          },
          child: GetBuilder<TicketViewModel>(
            builder: (cont) => ListView.builder(
              itemCount: controller.orderList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: SizedBox(
                    height: 812 * 160 / Get.height,
                    width: 375 * 343 / Get.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:  250 * 375 / Get.width,
                                height: 100 * 375 / Get.height,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    cont.orderList[index].movieName,
                                    style: TextStyle(
                                        fontSize: 22 * 375 / Get.width,
                                        fontWeight: FontWeight.bold,color: primaryColor),
                                  ),
                                ),
                              ),
                              Text(
                                '${cont.orderList[index].seats}'
                                    .replaceAll('[', '')
                                    .replaceAll(']', ''),
                                style: TextStyle(
                                    fontSize: 16 * 375 / Get.width,
                                    fontWeight: FontWeight.bold,color: primaryColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                        fontSize: 26* 375 / Get.width,
                                        fontWeight: FontWeight.bold,color: Color(0xff251977)),
                                  ),
                                  Text(
                                    '${cont.orderList[index].totalPrice}',
                                    style: TextStyle(
                                        fontSize: 26 * 375 / Get.width,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff251977)),
                                  ),
                                ],
                              ),
                              Text(
                                '${cont.orderList[index].timePacked}',
                                style: TextStyle(
                                    fontSize: 14 * 375 / Get.width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 420 * 120 / Get.width,
                          width: 300 * 120 / Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    cont.orderList[index].moviePoster),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 50 * 120 / Get.width,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
