import 'package:flutter/material.dart';
import 'package:move_ticketing_app/helper/constans.dart';


class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:
        Text('Account',style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20        ),),),
    );
  }
}
