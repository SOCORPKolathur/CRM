import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:hovering/hovering.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/Login_page/login_page.dart';
import '../Hr_Page/hr_page.dart';

class admin_dashboard extends StatefulWidget {
  String? id;
  admin_dashboard(this.id);
  @override
  State<admin_dashboard> createState() => _admin_dashboardState();
}

class _admin_dashboardState extends State<admin_dashboard> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ShowUpAnimation(
          curve: Curves.fastOutSlowIn,
          direction: Direction.horizontal,
          delayStart: Duration(milliseconds: 200),
          child:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left:width/62.2,top:height/50,right:width/62.2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height:height/1.10,
                width:width/1.05,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                        height: height/1.10,
                        width: width/1.05,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                color:Color(0xff5F67EC),
                              ),
                              height:height/18.78,
                              width: width/1.05,
                              child: Center(
                                child: Text('Analytical View',style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/81.13),),
                              ),
                            ),

                            Row(children: [

                            ],)



                          ],
                        ),

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

}


