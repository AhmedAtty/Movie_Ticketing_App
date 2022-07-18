import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/helper/constans.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:move_ticketing_app/views/takeing_seat_views/cinema_view.dart';

import '../../view_models/home_view_model.dart';

// ignore: must_be_immutable
class MovieView extends GetWidget<HomeViewModel> {
  MovieView({
    Key? key,
  }) : super(key: key);

  @override
  final controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 280 * 812 / Get.height,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 260 * 812 / Get.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w600_and_h900_bestv2${controller.movieList[controller.superIndex!].backdrop_path}"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      top: 50 * 812 / Get.height,
                      child: IconButton(
                        icon: Icon(
                          Icons.star_border_outlined,
                          color: Colors.white,
                          size: 35 * 375 / Get.width,
                        ),
                        onPressed: () {},
                      )),
                  Positioned(
                    left: 20,
                    top: 50 * 812 / Get.height,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 35 * 375 / Get.width,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Positioned(
                    top: 90 * 812 / Get.height,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15 * 375 / Get.width),
                      child: SizedBox(
                        height: 812 * 160 / Get.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              controller.movieList[controller.superIndex!].title
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 26 * 375 / Get.width,
                                  color: fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffF99601),
                                ),
                                Text(
                                  '  ${controller.movieList[controller.superIndex!].vote_average} /10 from IMDb',
                                  style: TextStyle(
                                      fontSize: 16 * 375 / Get.width,
                                      color: fontColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                controller.movieList[controller.superIndex!]
                                            .popularity >
                                        50
                                    ? Container(
                                        height: 812 * 32 / Get.height,
                                        width: 375 * 93 / Get.width,
                                        child: Center(
                                          child: Text(
                                            'Action',
                                            style: TextStyle(
                                                fontSize: 16 * 375 / Get.width,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      )
                                    : Container(
                                        height: 812 * 32 / Get.height,
                                        width: 375 * 93 / Get.width,
                                        child: Center(
                                          child: Text(
                                            'Drama',
                                            style: TextStyle(
                                                fontSize: 16 * 375 / Get.width,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                SizedBox(
                                  width: 5 * 375 / Get.width,
                                ),
                                Container(
                                  height: 812 * 32 / Get.height,
                                  width: 375 * 93 / Get.width,
                                  child: Center(
                                    child: Text(
                                      controller
                                          .movieList[controller.superIndex!]
                                          .original_language,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18 * 375 / Get.width),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 15 * 375 / Get.width,
                ),
                Container(
                  width: 100 * 375 / Get.width,
                  height: 150 * 812 / Get.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2${controller.movieList[controller.superIndex!].poster_path}"),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 15 * 375 / Get.width,
                ),
                SizedBox(
                  height: 150 * 812 / Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original Laguge',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Release Date',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Popularity',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Vote Average',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5 * 375 / Get.width,
                ),
                SizedBox(
                  height: 150 * 812 / Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ': ${controller.movieList[controller.superIndex!].original_language}',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ': ${controller.movieList[controller.superIndex!].release_date}',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ': ${controller.movieList[controller.superIndex!].popularity}',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ': ${controller.movieList[controller.superIndex!].vote_average}',
                        style: TextStyle(
                            fontSize: 14 * 375 / Get.width,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GetBuilder<HomeViewModel>(
              builder: (cont) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0 * 375 / Get.width),
                    child: BottomNavigationBar(
                      currentIndex: cont.currentIndex1,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      elevation: 0,
                      onTap: (value) {
                        cont.currentIndex1 = value;
                        cont.update();
                      },
                      items: [
                        BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Text(
                                'Schedule',
                                style: TextStyle(
                                    fontSize: 18 * 375 / Get.width,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(thickness: 2, color: primaryColor),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                          icon: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Schedule',
                                style: TextStyle(
                                    fontSize: 18 * 375 / Get.width,
                                    color: primaryColor),
                              ),
                              const Divider(thickness: 1, color: primaryColor),
                            ],
                          ),
                          label: 'Schedule',
                        ),
                        BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              Text(
                                'Synopsis',
                                style: TextStyle(
                                    fontSize: 18 * 375 / Get.width,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(thickness: 2, color: primaryColor),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                          icon: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Synopsis',
                                style: TextStyle(
                                    fontSize: 18 * 375 / Get.width,
                                    color: primaryColor),
                              ),
                              const Divider(thickness: 1, color: primaryColor),
                            ],
                          ),
                          label: 'Schedule',
                        ),
                      ],
                    ),
                  ),
                  cont.currentIndex1 == 0
                      ? Container(
                          height: 75 * 812 / Get.height,
                          color: Colors.white,
                          child: DatePicker(
                            DateTime.now(),
                            initialSelectedDate: cont.selectedDate,
                            selectionColor: primaryColor,
                            width: 75 * 375 / Get.width,
                            height: 75 * 375 / Get.width,
                            onDateChange: (newDate) {
                              cont.selectedDate = newDate;
                              cont.update();
                            },
                            dateTextStyle: TextStyle(
                                fontSize: 12 * 375 / Get.width,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            dayTextStyle: TextStyle(
                                fontSize: 18 * 375 / Get.width,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                            monthTextStyle: TextStyle(
                                fontSize: 12 * 375 / Get.width,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            height: 75 * 812 / Get.height,
                            child: SingleChildScrollView(
                                child: Center(
                                    child: Text(controller
                                        .movieList[controller.superIndex!]
                                        .overview))),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 8.0 * 375 / Get.width,
                        top: 12 * 812 / Get.height),
                    child: const Text('Select Cinema'),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0 * 375 / Get.width,
                          right: 8 * 375 / Get.width),
                      child: DropdownButton<String>(
                        value: cont.dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: primaryColor,
                        ),
                        onChanged: (String? newValue) {
                          cont.dropdownValue = newValue!;
                          cont.cinemaPriceSelection();
                          cont.update();
                        },
                        items: <String>[
                          'Cinema XXI Ambarukm Plaza',
                          'Century Cinema - Bandar Maadi',
                          'VOX Cinemas - City Centre Almaza',
                          'Cinema Century Grand Nile Tower',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8 * 375 / Get.width),
                        child: const Text('REGULAR 2D'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8 * 375 / Get.width),
                        child: Text('\$ ${controller.cinemaPrice}.000'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0 * 375 / Get.width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            height: 50 * 812 / Get.height,
                            width: 110 * 812 / Get.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryColor),
                                color: cont.colorHourCont1
                                    ? primaryColor
                                    : Colors.white),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '7:00 PM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14 * 375 / Get.width,
                                        color: cont.colorHourCont1
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                  Text(
                                    '${90 - cont.indexs.length} seat available',
                                    style: TextStyle(
                                        fontSize: 10 * 375 / Get.width,
                                        color: cont.colorHourCont1
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (cont.colorHourCont1 == false) {
                              cont.colorHourCont1 = true;
                              cont.colorHourCont2 = false;
                              cont.colorHourCont3 = false;

                              cont.hour = '7:00 PM';
                            } else {
                              cont.colorHourCont1 = false;
                              cont.colorHourCont2 = false;
                              cont.colorHourCont3 = false;
                              cont.hour = null;
                            }
                            cont.update();
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: 50 * 812 / Get.height,
                            width: 110 * 812 / Get.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryColor),
                                color: cont.colorHourCont2
                                    ? primaryColor
                                    : Colors.white),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '10:00 PM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14 * 375 / Get.width,
                                        color: cont.colorHourCont2
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                  Text(
                                    '${90 - cont.indexs.length} seat available',
                                    style: TextStyle(
                                        fontSize: 10 * 375 / Get.width,
                                        color: cont.colorHourCont2
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (cont.colorHourCont2 == false) {
                              cont.colorHourCont1 = false;
                              cont.colorHourCont2 = true;
                              cont.colorHourCont3 = false;

                              cont.hour = '10:00 PM';
                            } else {
                              cont.colorHourCont1 = false;
                              cont.colorHourCont2 = false;
                              cont.colorHourCont3 = false;
                              cont.hour = null;
                            }
                            cont.update();
                          },
                        ),
                        InkWell(
                          child: Container(
                            height: 50 * 812 / Get.height,
                            width: 110 * 812 / Get.height,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primaryColor),
                                color: cont.colorHourCont3
                                    ? primaryColor
                                    : Colors.white),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1:00 AM',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14 * 375 / Get.width,
                                        color: cont.colorHourCont3
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                  Text(
                                    '${90 - cont.indexs.length} seat available',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: cont.colorHourCont3
                                            ? Colors.white
                                            : primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            if (cont.colorHourCont3 == false) {
                              cont.colorHourCont1 = false;
                              cont.colorHourCont2 = false;
                              cont.colorHourCont3 = true;

                              cont.hour = '1:00 AM';
                            } else {
                              cont.colorHourCont1 = false;
                              cont.colorHourCont2 = false;
                              cont.colorHourCont3 = false;
                              cont.hour = null;
                            }
                            cont.update();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (controller.hour == null) {
                  Get.snackbar('Something Missing !', 'please Choose an Hour',
                      colorText: Colors.red,
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 4));
                } else if (controller.dropdownValue == null) {
                  Get.snackbar(
                      'Something Missing !', 'please Choose the Cinema',
                      colorText: Colors.red,
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 4));
                } else if (controller.selectedDate == null) {
                  Get.snackbar(
                      'Something Missing !', 'please Choose the Date to watch',
                      colorText: Colors.red,
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 4));
                } else {
                  Get.to(CinemaView());
                }
              },
              child: Container(
                width: Get.width,
                height: 60 * 812 / Get.height,
                color: primaryColor,
                child: Center(
                  child: Text(
                    'Take a seat',
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

//<editor-fold desc="Data Methods">

}
