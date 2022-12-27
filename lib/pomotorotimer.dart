import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'carrer.dart';
import 'add_emp_form.dart';

class pomotorotimer extends StatefulWidget {
  const pomotorotimer({Key? key}) : super(key: key);

  @override
  State<pomotorotimer> createState() => _pomotorotimerState();
}

class _pomotorotimerState extends State<pomotorotimer> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    final TextEditingController _msg=TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return
      Scaffold(
          body:ShowUpAnimation(
            animationDuration: Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            direction: Direction.vertical,
            child:
              Container(
                width:100,
                  height:100,
                  child: Text('This Is Pomotoroter ')
              )

          )
      );
  }
}
