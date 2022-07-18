import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:move_ticketing_app/view_models/home_view_model.dart';
import 'package:move_ticketing_app/views/takeing_seat_views/visa_form_view.dart';

import '../../helper/constans.dart';

class CinemaView extends GetWidget<HomeViewModel> {
  CinemaView({
    Key? key,
  }) : super(key: key);
  @override
  final controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Choose Seat',
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
          actions: [
            Image.asset(
              'assets/images/clock.png',
              color: primaryColor,
            )
          ],
        ),
        body: GetBuilder<HomeViewModel>(builder: (cont) {
          return SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 110 * 812 / Get.height,
                          width: Get.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image:
                                AssetImage('assets/images/cimaScreenShadw.png'),
                          )),
                        ),
                        top: 42 * 812 / Get.height,
                      ),
                      Positioned(
                        top: 0 * 812 / Get.height,
                        child: Container(
                          height: 110 * 812 / Get.height,
                          width: Get.width,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text('Cinema Screen',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17 * 375 / Get.width)),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/cimaScreen.png'),
                          )),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: SizedBox(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: Get.width * .05,
                                width: Get.width * .05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                'Available',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14 * 375 / Get.width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: Get.width * .05,
                                width: Get.width * .05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffCCCCCC),
                                ),
                              ),
                              Text(
                                'Unavailable',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14 * 375 / Get.width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: Get.width * .05,
                                width: Get.width * .05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: cont.color,
                                ),
                              ),
                              Text(
                                'Selected',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14 * 375 / Get.width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 1.5,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 220),
                              child: SizedBox(
                                height: 310 * 812 / Get.height,
                                child: GridView.builder(
                                    itemCount: 90,
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 50,
                                      crossAxisCount: 10,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if (controller.indexs
                                              .contains(index)) {
                                            controller.indexs.remove(index);
                                          } else {
                                            controller.indexs.add(index);
                                          }
                                          controller.cinemaPrice;
                                          controller.update();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: controller.indexs
                                                    .contains(index)
                                                ? controller.color
                                                : primaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              controller.char(index),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      14 * 375 / Get.width,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 240 * 812 / Get.height,
                        width: Get.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/location.png',
                                      color: primaryColor),
                                  SizedBox(
                                    width: 5 * 375 / Get.width,
                                  ),
                                  Text(
                                    controller.dropdownValue!,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16 * 375 / Get.width,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5 * 812 / Get.height,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.selectedDate!.day} ${cont.month(controller.selectedDate!.month)}',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5 * 375 / Get.width,
                                    ),
                                    RotatedBox(
                                        quarterTurns: 1,
                                        child: SizedBox(
                                            width: 30 * 375 / Get.width,
                                            child: Divider(
                                              thickness: 1,
                                              color:
                                                  primaryColor.withOpacity(.5),
                                            ))),
                                    SizedBox(
                                      width: 5 * 375 / Get.width,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Hour',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5 * 375 / Get.width,
                                        ),
                                        Text(
                                          controller.hour!,
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5 * 375 / Get.width,
                                    ),
                                    RotatedBox(
                                        quarterTurns: 1,
                                        child: SizedBox(
                                            width: 30 * 375 / Get.width,
                                            child: Divider(
                                              thickness: 1,
                                              color:
                                                  primaryColor.withOpacity(.5),
                                            ))),
                                    SizedBox(
                                      width: 5 * 375 / Get.width,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Seats',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 15 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5 * 812 / Get.height,
                                        ),
                                        Text(
                                          '${cont.listchar()}'
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20 * 375 / Get.width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15 * 375 / Get.width,
                                ),
                              ),
                              Text(
                                '\$ ${cont.indexs.length * controller.cinemaPrice}.000',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 30 * 375 / Get.width,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Children (2 years old or above) are required to purchase ticket.',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12 * 375 / Get.width,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (cont.indexs.isEmpty) {
                      Get.snackbar('Something Missing !',
                          'please Choose pick seats first',
                          colorText: Colors.red,
                          backgroundColor: Colors.white,
                          duration: const Duration(seconds: 4));
                    } else {
                      Get.to(VisaFormView(
                        cinemaPrice: controller.cinemaPrice,
                        indexs_length: cont.indexs.length,
                      ));
                    }
                  },
                  child: Container(
                    width: Get.width,
                    height: 60 * 812 / Get.height,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        'Pay now',
                        style: TextStyle(
                            fontSize: 20 * 375 / Get.width,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
