
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/views/takeing_seat_views/summry_view.dart';

import '../../helper/constans.dart';

import '../../view_models/home_view_model.dart';
import '../../widgets/custom_text_form.dart';

class VisaFormView extends GetWidget<HomeViewModel> {
  VisaFormView(
      {Key? key, required this.cinemaPrice, required this.indexs_length})
      : super(key: key);

  final controller = Get.put(HomeViewModel());

  int cinemaPrice;
  int indexs_length;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Payment Method',
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 40 * 812 / Get.height,
                          color: Color(0xffDDDDDD),
                          child: Center(
                            child: Text(
                              ' Finish your payment in 06:55',
                              style: TextStyle(
                                  color: Colors.red, fontSize: 15 * 375 / Get.width),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5 * 812 / Get.height,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Regular Seat'),
                                Row(
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                          fontSize: 16 * 375 / Get.width,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '$cinemaPrice.000 ',
                                      style: TextStyle(
                                          fontSize: 16 * 375 / Get.width,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'X $indexs_length',
                                      style: TextStyle(
                                          fontSize: 12 * 375 / Get.width,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Convenience Fee'),
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
                                      'X $indexs_length',
                                      style: TextStyle(
                                          fontSize: 12 * 375 / Get.width,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xff333333),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Actual Pay'),
                                Row(
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                          fontSize: 20 * 375 / Get.width,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${(indexs_length * cinemaPrice) + (indexs_length * 2)}.000',
                                      style: TextStyle(
                                          fontSize: 20 * 375 / Get.width,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5 * 812 / Get.height,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Payment Method',
                                  style: TextStyle(
                                      fontSize: 20 * 375 / Get.width,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(''),
                              ]),
                        ),
                        SizedBox(
                          height: 10 * 812 / Get.height,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.snackbar(
                                'No Balance',
                                'Please Recharge the Balance',
                                backgroundColor: Colors.white,
                                colorText: Colors.red,
                              );
                            },
                            child: Container(
                              height: 60 * 812 / Get.height,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 25 * 812 / Get.height,
                                        width: 25 * 812 / Get.height,
                                        decoration: BoxDecoration(
                                            color: Colors.grey, shape: BoxShape.circle),
                                        child: Center(
                                          child: Container(
                                            height: 8 * 812 / Get.height,
                                            width: 8 * 812 / Get.height,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8 * 375 / Get.width,
                                      ),
                                      Text(
                                        'Account Balance',
                                        style: TextStyle(
                                            fontSize: 15 * 375 / Get.width,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20 * 375 / Get.width,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '0.000',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20 * 375 / Get.width,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10 * 812 / Get.height,
                        ),
                        buildPadding(
                          text: 'Card Numper',
                          hText: 'xxxx xxxx xxxx xxxx',
                          con2: controller.visanumcont,
                          vald: (value) {
                            if (value != null) {
                              if (value.length == 0) {
                                return 'please enter Card Numper';
                              } else if (value.length < 19) {
                                return 'Card Numper Cant be less than 19';
                              } else if (value.length > 19) {
                                return 'Card Numper Cant be more than 19';
                              }
                            }
                          },
                          con1: controller.visanumcont1,
                          type: TextInputType.number,
                          image: Image.asset(
                            'assets/images/visa.png',
                            scale: 1.1,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10 * 812 / Get.height,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * .5,
                              child: buildPadding(
                                con2: controller.expdatecont,
                                text: 'Expired Date',
                                hText: '02/19',
                                vald: (value) {
                                  if (value != null) {
                                    if (value.length == 0) {
                                      return 'please enter Expire Date';
                                    } else if (value.length < 5) {
                                      return 'Expired Date Cant be less than 4 num';
                                    } else if (value.length > 5) {
                                      return 'Expired Date Cant be more than 4 num';
                                    } else if (value.contains('/') != true) {
                                      return 'this isn,t a date';
                                    }
                                  }
                                },
                                con1: controller.expdatecont1,
                                type: TextInputType.number,
                                image: Image.asset(
                                  'assets/images/exp.png',
                                  scale: 1.3,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .5,
                              child: buildPadding(
                                con2: controller.cvvcont,
                                text: 'CVV',
                                hText: '555',
                                vald: (value) {
                                  if (value != null) {
                                    if (value.length == 0) {
                                      return 'please enter cvv';
                                    } else if (value.length < 3) {
                                      return 'CVV Cant be less than 3 num';
                                    } else if (value.length > 3) {
                                      return 'CVV Cant be more than 3 num';
                                    }
                                  }
                                },
                                con1: controller.cvvcont1,
                                type: TextInputType.number,
                                image: Image.asset(
                                  'assets/images/cvv.png',
                                  scale: 1.3,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * 812 / Get.height,
                        ),
                        buildPadding1(
                          text: 'Card Holder',
                          hText: 'Ahmed Atty',
                          vald: (value) {
                            if (value != null) {
                              if (value.length == 0) {
                                return 'please enter your name';
                              } else if (value.length < 3) {
                                return 'name cant be that short';
                              } else if (value.length > 20) {
                                return 'name cant be that long';
                              } else if (!RegExp(r'^[a-z A-Z]+$')
                                  .hasMatch(value)) {
                                return 'name cant contain numbers or signs';
                              }
                            }
                          },
                          con1: controller.holdercont1,
                          type: TextInputType.name,
                          image: Image.asset(
                            'assets/images/holder.png',
                            scale: 1.2,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // Get.snackbar('Finaly !!', 'your visa is added');
                  Get.to(SummaryView());
                }
              },
              child: Container(
                width: Get.width,
                height: 60 * 812 / Get.height,
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Order Summary',
                    style: TextStyle(
                        fontSize: 20 * 375 / Get.width, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
