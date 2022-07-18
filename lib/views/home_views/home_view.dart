import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/helper/constans.dart';
import 'package:move_ticketing_app/views/home_views/account_view.dart';

import 'tichet_view.dart';
import 'explore_view.dart';

int currentIndex = 0;

bool promo = true;
List<Widget> bodyList = [
  ExploreView(),
  const AccountView(),
   TicketView(),
];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            promo
                ? Container(
                    color: Colors.white,
                    height: Get.height * .2,
                    width: Get.width,
                  )
                : Container(
                    height: 0,
                  ),
            promo
                ? Container(
                    height: Get.height * .2,
                    width: Get.width * .9,
                    margin: EdgeInsets.only(bottom: 33 * 375 / Get.width),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/imageBotHome.png',
                            ),
                            fit: BoxFit.cover)),
                  )
                : Container(
                    height: 0,
                  ),
            promo
                ? Positioned(
                    bottom: Get.height * .13,
                    left: Get.width * .1,
                    child: Text(
                      '''SAVE 50% WITH
BCA CREDIT CARD''',
                      style: TextStyle(
                          fontSize: 26 * 375 / Get.width, color: Colors.white),
                    ))
                : Container(
                    height: 0,
                  ),
            Padding(
              padding: EdgeInsets.only(
                  top: 100 * 812 / Get.height, bottom: 10 * 375 / Get.width),
              child: Container(
                height: Get.height * .1,
                width: Get.width * .91,
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
                  padding: EdgeInsets.all(15 * 375 / Get.width),
                  child: BottomNavigationBar(
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                        if (currentIndex != 0) {
                          setState(() {
                            promo = false;
                          });
                        } else {
                          setState(() {
                            promo = true;
                          });
                        }
                      });
                    },
                    // selectedFontSize:25 ,
                    // unselectedItemColor: Colors.blue,
                    // selectedIconTheme: IconThemeData(size: 30),
                    // selectedItemColor:Colors.red ,
                    currentIndex: currentIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    backgroundColor: Colors.white,

                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/homeSelected.png',
                                color: primaryColor,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 14 * 375 / Get.width,
                                    color: primaryColor),
                              )
                            ],
                          ),
                          icon:
                              Image.asset('assets/images/homeNotSelected.png'),
                          label: "Home"),
                      BottomNavigationBarItem(
                          activeIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/iconMid.png',
                                color: primaryColor,
                              ),
                              Text(
                                'Account',
                                style: TextStyle(
                                    fontSize: 14 * 375 / Get.width,
                                    color: primaryColor),
                              )
                            ],
                          ),
                          icon: Image.asset('assets/images/iconMid.png'),
                          label: "Cart"),
                      BottomNavigationBarItem(
                          activeIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/tecketSelected.png',
                                color: primaryColor,
                              ),
                              Text(
                                'Tecket',
                                style: TextStyle(
                                    fontSize: 14 * 375 / Get.width,
                                    color: primaryColor),
                              )
                            ],
                          ),
                          icon: Image.asset(
                              'assets/images/tecketNotSelected.png'),
                          label: "Tecket"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: bodyList[currentIndex],
    );
  }
}
