import 'package:flutter/material.dart';

Widget genderWidget(icon, text, size, selected, onTap) {
  return GestureDetector(
    onTap: onTap,
    child:Container(
      height: size.height*40.0/780.0,
      //color: Colors.transparent,
      decoration: BoxDecoration(
          border: Border.all(
              color: selected == text ?Colors.white:Colors.black,
              style: BorderStyle.solid,
              width: 2.0),
          color: selected == text ?Colors.pinkAccent[400]:Colors.transparent,
          borderRadius: BorderRadius.circular(size.width*20.0/360.0)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(
          child:
            Icon(
              icon,
              color: selected == text ?Colors.white:Colors.black,
            ),
        ),
          SizedBox(width: size.width*10.0/360.0),
          Center(
            child: Text( text ,
            style: TextStyle(
            color: selected == text ?Colors.white:Colors.black,
            fontSize: size.height*22.0/780.0,
            //fontWeight: FontWeight.bold,
            fontFamily: 'Pacifico')),
          )
      ],



    ),
  ));
}
