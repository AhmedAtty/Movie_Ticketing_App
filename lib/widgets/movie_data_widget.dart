import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MovieDataWidget extends StatelessWidget {
  MovieDataWidget({
    required this.title,
    required this.release_date,
    required this.vote_average,
    required this.popularity,
    Key? key,
  }) : super(key: key);
  String title;
  String release_date;
  double vote_average;
  double popularity;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: 15 * 812 / Get.height,
        ),
        popularity > 50
            ? Container(
          height: 812 * 30 / Get.height,
          width: 812 * 60 / Get.height,
          decoration: BoxDecoration(
            color: const Color(0xff0E840C),
            borderRadius:
            BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'HD',
              style: TextStyle(fontSize: 16,
              color: Colors.white),
            ),
          ),
        )
            : Container(
          height: 812 * 30 / Get.height,
          width: 812 * 60 / Get.height,
          decoration: BoxDecoration(
            color: const Color(0xffC02323),
            borderRadius:
            BorderRadius.circular(30),
          ),
          child: const Center(
            child:  Text(
              'wepcam',
              style: TextStyle(fontSize: 12,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 15 * 812 / Get.height,
        ),
        Text(
          title,
          style:  TextStyle(
              fontSize: 24*812 / Get.height,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15 * 812 / Get.height,
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color(0xffF99601),
                ),
                Text(
                    '$vote_average',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(width: 375*30/Get.width,),
            Text(
                release_date,
            style: TextStyle(fontSize: 18),),
            SizedBox(
              height: 15 * 812 / Get.height,
            ),
          ],
        ),
      ],
    );
  }
}

