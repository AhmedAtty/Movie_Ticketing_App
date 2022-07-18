import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:move_ticketing_app/view_models/home_view_model.dart';
import 'package:move_ticketing_app/widgets/movie_data_widget.dart';

import '../takeing_seat_views/movie_view.dart';

class ExploreView extends GetWidget<HomeViewModel> {
  ExploreView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 812 * 440 / Get.height,
                    child: Image.asset(
                      'assets/images/Vector.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20 * 375 / Get.width),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Rp 50.000",
                                  style:
                                      TextStyle(fontSize: 16 * 375 / Get.width),
                                ),
                                Container(
                                  height: 812 * 40 / Get.height,
                                  width: 812 * 125 / Get.height,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'California',
                                    style: TextStyle(
                                        fontSize: 16 * 375 / Get.width),
                                  )),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.notifications_active))
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30 * 375 / Get.width),
                              child: Text(
                                'Playing',
                                style:
                                    TextStyle(fontSize: 26 * 375 / Get.width),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30 * 375 / Get.width),
                              child: Text(
                                'see all>',
                                style:
                                    TextStyle(fontSize: 16 * 375 / Get.width),
                              ),
                            ),
                          ],
                        ),
                        GetBuilder<HomeViewModel>(builder: (cont) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10 * 812 / Get.height,
                              ),
                              cont.movieList.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CarouselSlider.builder(
                                      options: CarouselOptions(
                                          enlargeCenterPage: true,
                                          autoPlay: false,
                                          autoPlayAnimationDuration:
                                              const Duration(seconds: 6),
                                          enableInfiniteScroll: false,
                                          enlargeStrategy:
                                              CenterPageEnlargeStrategy.height,
                                          height: 250 * 812 / Get.height,
                                          viewportFraction: .48,
                                          onScrolled: (value) {
                                            if (value! % 1 == 0) {
                                              cont.v = value.toInt();
                                              cont.update();
                                            }
                                          }),
                                      itemCount: cont.movieList.length,
                                      itemBuilder: (context, index, realIndex) {
                                        return InkWell(
                                          onTap: () {
                                            controller.superIndex=index;
                                            Get.to(MovieView());
                                          },
                                          child: Container(
                                            width: 220 * 812 / Get.height,
                                            height: 250 * 812 / Get.height,
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://image.tmdb.org/t/p/w600_and_h900_bestv2${cont.movieList[index].poster_path}"),
                                                    fit: BoxFit.fill),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        );
                                      },
                                    ),
                              Column(
                                children: [
                                  cont.v != null
                                      ? MovieDataWidget(
                                          title: cont.movieList[cont.v!].title,
                                          release_date: cont
                                              .movieList[cont.v!].release_date,
                                          vote_average: cont
                                              .movieList[cont.v!].vote_average,
                                          popularity: cont
                                              .movieList[cont.v!].popularity,
                                        )
                                      : cont.movieList.isEmpty
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : MovieDataWidget(
                                              title: cont.movieList[0].title,
                                              release_date: cont
                                                  .movieList[0].release_date,
                                              vote_average: cont
                                                  .movieList[0].vote_average,
                                              popularity:
                                                  cont.movieList[0].popularity,
                                            ),
                                ],
                              )
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 15 * 375 / Get.width, left: 25 * 375 / Get.width),
                  child: Text(
                    'Promo',
                    style: TextStyle(
                        fontSize: 26 * 375 / Get.width, color: Colors.black),
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
