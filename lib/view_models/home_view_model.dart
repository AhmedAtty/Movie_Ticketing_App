import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

import '../models/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController {


  CollectionReference ordersRef =
  FirebaseFirestore.instance.collection('tickets');


  final String apiKey = 'ffd45d74f14fca12a6d153a2bd915500';

  List<MovieModel> movieList = [];

  int? v;


  bool schedule = true;

  int? superIndex;


  Future<void> getMovie() async {
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=3");
    var res = await http.get(url);
    var resBody = json.decode(res.body);

    for (var i in resBody["results"]) {
      movieList.add(MovieModel.fromMap(i));

      update();
    }
  }



  Color color = const Color(0xff251977);


  List<int> indexs = [];


  int currentIndex1 = 0;

  DateTime? selectedDate;

  String? hour;

  String? dropdownValue;


  bool colorHourCont1 = false;
  bool colorHourCont2 = false;
  bool colorHourCont3 = false;



  int cinemaPrice = 0;

  MaskedTextController visanumcont = MaskedTextController(mask: '0000 0000 0000 0000',);
  MaskedTextController expdatecont = MaskedTextController(mask: '00/00',);
  MaskedTextController cvvcont = MaskedTextController(mask: '000',);



  TextEditingController visanumcont1 = TextEditingController();
  TextEditingController expdatecont1 = TextEditingController();
  TextEditingController cvvcont1 = TextEditingController();
  TextEditingController holdercont1 = TextEditingController();

  int cinemaPriceSelection() {
    if (dropdownValue == null) {
      cinemaPrice = 0;
    } else if (dropdownValue == 'Cinema XXI Ambarukm Plaza') {
      cinemaPrice = 30;
    } else if (dropdownValue == 'Century Cinema - Bandar Maadi') {
      cinemaPrice = 25;
    } else if (dropdownValue == 'VOX Cinemas - City Centre Almaza') {
      cinemaPrice = 35;
    } else {
      cinemaPrice = 20;
    }
    update();
    return cinemaPrice;
  }

  String char(int index) {
    String char1 = 'A${index + 1}';
    index > 9 && index < 20 ? char1 = 'B${index - 9}' : '';
    index > 19 && index < 30 ? char1 = 'C${index - 19}' : '';
    index > 29 && index < 40 ? char1 = 'D${index - 29}' : '';
    index > 39 && index < 50 ? char1 = 'E${index - 39}' : '';
    index > 49 && index < 60 ? char1 = 'F${index - 49}' : '';
    index > 59 && index < 70 ? char1 = 'J${index - 59}' : '';
    index > 69 && index < 80 ? char1 = 'H${index - 69}' : '';
    index > 79 && index < 100 ? char1 = 'I${index - 79}' : '';
    index > 89 && index < 110 ? char1 = 'K${index - 89}' : '';
    return char1;
  }

  List<String> listchar() {
    List<String> listchar = [];
    for (var i in indexs) {
      listchar.add(char(i));
    }
    return listchar;
  }

  String month(int x) {
    String mon = 'JAN';
    if (x == 2) {
      mon = 'FEB';
    } else if (x == 3) {
      mon = 'MAR';
    } else if (x == 4) {
      mon = 'APR';
    } else if (x == 5) {
      mon = 'MAY';
    } else if (x == 6) {
      mon = 'JUN';
    } else if (x == 7) {
      mon = 'JUL';
    } else if (x == 8) {
      mon = 'AUG';
    } else if (x == 9) {
      mon = 'SEP';
    } else if (x == 10) {
      mon = 'OCT';
    } else if (x == 11) {
      mon = 'NOV';
    } else if (x == 12) {
      mon = 'DEC';
    }
    return mon;
  }
  String weekday(int x) {
    String wek = 'Saturday';
    if (x == 2) {
      wek = 'Sunday';
    } else if (x == 3) {
      wek = 'Monday';
    } else if (x == 4) {
      wek = 'Thursday';
    } else if (x == 5) {
      wek = 'Wednesday';
    } else if (x == 6) {
      wek = 'Thursday';
    } else if (x == 7) {
      wek = 'Friday';
    }
    return wek;
  }


  Future<void> sendOrder(int index,int toltalPrice) async {
    await ordersRef.doc().set({
      'cardHolder': holdercont1.text,
      'cardNumper':  visanumcont1.text,
      'expiredDate':  expdatecont1.text,
      'cvv' : cvvcont1.text,
      'movieName': movieList[index].title,
      'moviePoster': 'https://image.tmdb.org/t/p/w600_and_h900_bestv2${movieList[index].poster_path}',
      'seats' : listchar(),
      'seatPrice' : cinemaPrice,
      'timePacked' : '${weekday(selectedDate!.weekday)} , ${month(selectedDate!.month)} , ${selectedDate!.year.toString()} , ${hour!}',
      'totalPrice' : toltalPrice,

    }).then((value) {
      Get.snackbar('Done', "order added");
      update();
    });
    update();
  }

  @override
  void onInit() {
    cinemaPriceSelection();
    getMovie();
    update();
    super.onInit();
  }
}
