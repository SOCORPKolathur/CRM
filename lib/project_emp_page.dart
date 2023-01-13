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

class project_emp_page extends StatefulWidget {
  String? id;
  project_emp_page(this.id);
  @override
  State<project_emp_page> createState() => _project_emp_pageState();
}
var play_circle= Icons.play_circle;
bool ck =true;
var ss ="given";
final TextEditingController taskdescriptionfield=TextEditingController();
final TextEditingController tasknamefield=TextEditingController();
final TextEditingController deadlinetimefield=TextEditingController();
final TextEditingController deadlinetimefield1=TextEditingController();
final TextEditingController deadlinedatefield=TextEditingController();
final TextEditingController deadlinedatefield1=TextEditingController();
final TextEditingController empnamefield=TextEditingController();
TextEditingController empidfield=TextEditingController();
TextEditingController projectnamefield=TextEditingController();

class _project_emp_pageState extends State<project_emp_page> {
  TimeOfDay selectedTime = TimeOfDay.now();
  getempid() async {
    final docemt = await FirebaseFirestore.instance.collection('User').get();
    for(int i =0;i<=docemt.docs.length;i++){
      if(docemt.docs[i]['name1']==empnamefield.text){
        setState(() {
          empidfield.text=docemt.docs[i]['username'];
        });
      }

    }
  }
  @override
  void initState() {
    get12();

    // TODO: implement initState
    super.initState();
  }



  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
// TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;


    return Scaffold(
      body:
        ShowUpAnimation(
        curve: Curves.fastOutSlowIn,
        direction: Direction.horizontal,
        delayStart: Duration(milliseconds: 200),
    child:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:width/62.2,top:height/100,right:width/62.2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height:height/1.14,
            width:width/1.24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsets.only(top:height/52.15),
                  child: Material(
                    elevation: 15,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                      height: height/1.17,
                      width: width/1.33,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              color:Color(0xff5F67EC),
                            ),
                            height: 50,
                            width: width/1.33,
                            child: Center(
                              child: Text('OnGoing Projects',style: GoogleFonts.montserrat(
                                  fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/81.13),),
                            ),
                          ),
                        ],
                      ),

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

  String myname="";
  String myid="";
  String catcat="";
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;


  get12() async {
    var doumet= await _firebase.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      myname=val!["name1"];
    });
    print(myname);
  }



}


