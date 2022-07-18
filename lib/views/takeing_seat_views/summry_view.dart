import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/views/home_views/home_view.dart';


import '../../helper/constans.dart';
import '../../view_models/home_view_model.dart';

class SummaryView extends GetWidget<HomeViewModel> {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Order Summary',
          style: TextStyle(fontSize: 20, color: primaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: primaryColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: Get.height * .08,
            left: Get.width * .05,
            right: Get.width * .05,
            child: Image.asset(
              'assets/images/ticketform.png',
            ),
          ),
          Positioned(
            top: Get.height * .08,
            left: Get.width * .05,
            right: Get.width * .05,
            child: Container(
              width: 350 * 375 / Get.width,
              height: 620 * 812 / Get.height,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      20 * 375 / Get.width,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 135 * 375 / Get.width,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 140 * 375 / Get.height,
                              width: 190 * 375 / Get.width,
                              child: Text(
                                controller
                                    .movieList[controller.superIndex!].title,
                                style: TextStyle(
                                    fontSize: 14 * 375 / Get.width,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 60 * 375 / Get.height,
                              width: 170 * 375 / Get.width,
                              child: Text(
                                controller.dropdownValue!,
                                style: TextStyle(
                                    fontSize: 10 * 375 / Get.width,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 90 * 375 / Get.height,
                              width: 170 * 375 / Get.width,
                              child: Text(
                                '${controller.weekday(controller.selectedDate!.weekday)} , ${controller.month(controller.selectedDate!.month)} , ${controller.selectedDate!.year.toString()} , ${controller.hour!}',
                                style: TextStyle(
                                    fontSize: 8 * 375 / Get.width,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35 * 375 / Get.width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40 * 812 / Get.height,
                        ),
                        Text(
                          'Order Number',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10 * 375 / Get.width),
                        ),
                        Text(
                          '1198804794001625088',
                          style: TextStyle(
                              fontSize: 16 * 375 / Get.width,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20 * 812 / Get.height,
                        ),
                        Text(
                          'Seat',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10 * 375 / Get.width),
                        ),
                        Text(
                          '${controller.listchar()}'
                              .replaceAll('[', '')
                              .replaceAll(']', ''),
                          style: TextStyle(
                              fontSize: 16 * 375 / Get.width,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20 * 812 / Get.height,
                        ),
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10 * 375 / Get.width),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                '${controller.holdercont1.text} ',
                                style: TextStyle(
                                    fontSize: 16 * 375 / Get.width,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '(${controller.visanumcont1.text.replaceRange(3, 16, 'x xxxx xxxx x')})',
                                style: TextStyle(
                                    fontSize: 16 * 375 / Get.width,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20 * 812 / Get.height,
                        ),
                        Text(
                          'Regular Seat',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10 * 375 / Get.width),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 16 * 375 / Get.width,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${controller.cinemaPrice}.000 ',
                              style: TextStyle(
                                  fontSize: 16 * 375 / Get.width,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'X ${controller.indexs.length}',
                              style: TextStyle(
                                  fontSize: 12 * 375 / Get.width,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20 * 812 / Get.height,
                        ),
                        Text(
                          'Convenience Fee',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10 * 375 / Get.width),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 16 * 375 / Get.width,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2.000 ',
                              style: TextStyle(
                                  fontSize: 16 * 375 / Get.width,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'X ${controller.indexs.length}',
                              style: TextStyle(
                                  fontSize: 12 * 375 / Get.width,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * .27,
            left: Get.width * .05,
            right: Get.width * .05,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 39 * 375 / Get.width,
              ),
              child: Image.asset(
                'assets/images/div.png',
                color: Colors.grey[300],
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * .22,
            left: Get.width * .05,
            right: Get.width * .05,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 39 * 375 / Get.width,
              ),
              child: const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: Get.height * .03,
            left: Get.width * .15,
            child: Container(
              width: 110 * 375 / Get.width,
              height: 170 * 812 / Get.height,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w600_and_h900_bestv2${controller.movieList[controller.superIndex!].backdrop_path}"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
              bottom: Get.height * .13,
              left: Get.width * .05,
              right: Get.width * .05,
              child: Container(
                height: 85 * 812 / Get.height,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(left: 40 * 375 / Get.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Actual Pay',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 10 * 375 / Get.width),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                                fontSize: 20 * 375 / Get.width,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${(controller.indexs.length * controller.cinemaPrice) + (controller.indexs.length * 2)}.000',
                            style: TextStyle(
                                fontSize: 20 * 375 / Get.width,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                int total =
                    (controller.indexs.length * controller.cinemaPrice) +
                        (controller.indexs.length * 2);
                controller.sendOrder(controller.superIndex!, total);
                Get.to(HomeView());
              },
              child: Container(
                width: Get.width,
                height: 60 * 812 / Get.height,
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Confirm payment',
                    style: TextStyle(
                        fontSize: 20 * 375 / Get.width, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
