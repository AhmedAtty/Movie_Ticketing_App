import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/views/takeing_seat_views/movie_view.dart';

import '../views/home_views/home_view.dart';

class CustumNavgaiteBar extends StatelessWidget {
  const CustumNavgaiteBar({
    // required this.ontap1,
    // required this.ontap2,
    // required this.ontap3,
    Key? key,
  }) : super(key: key);

  // Function() ontap1;
  //
  // Function() ontap2;
  //
  // Function() ontap3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white,
          height: Get.height * .2,
          width: Get.width,
        ),
        Container(
          height: Get.height * .2,
          width: Get.width * .9,
          margin: EdgeInsets.only(bottom: 30 * 375 / Get.width),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/imageBotHome.png',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            bottom: Get.height * .13,
            left: Get.width * .1,
            child: Text(
              '''SAVE 50% WITH
BCA CREDIT CARD''',
              style: TextStyle(
                  fontSize: 26 * 375 / Get.width, color: Colors.white),
            )),
        Positioned(
          bottom: 10,
          child: Container(
            width: Get.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(const HomeView());
                        },
                        icon: const Icon(Icons.home)),
                    IconButton(
                        onPressed: () {
                          Get.to(const HomeView());
                        },
                        icon: const Icon(Icons.home)),
                    IconButton(
                        onPressed: () {
                          Get.to(const HomeView());
                        },
                        icon: const Icon(Icons.person)),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
