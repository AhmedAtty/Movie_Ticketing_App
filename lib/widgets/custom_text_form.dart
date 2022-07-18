
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../helper/constans.dart';


Padding buildPadding({
  required String? text,
  required String? hText,
  required String? Function(String?)? vald,
  required TextEditingController? con1,
  required MaskedTextController? con2,
  required TextInputType? type,
  required Image? image,
}) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      onChanged: (val) {
        con1!.text = val;
      },
      onSaved: (val) async {
        con1!.text = val!;

      },
      controller: con2,
      validator: vald,
      keyboardType: type,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: image,
        labelText: text!,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        hintText: hText!,
        helperStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
    ),
  );
}

Padding buildPadding1({
  required String? text,
  required String? hText,
  required String? Function(String?)? vald,
  required TextEditingController? con1,
  required TextInputType? type,
  required Image? image,
}) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      onChanged: (val) {
        con1!.text = val;
      },
      onSaved: (val) async {
        con1!.text = val!;

      },
      validator: vald,
      keyboardType: type,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: image,
        labelText: text!,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        hintText: hText!,
        helperStyle: const TextStyle(fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
    ),
  );
}
