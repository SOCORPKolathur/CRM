import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
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
        Padding(
          padding:EdgeInsets.only(top:height/52.166,left: width/50),
          child: ShowUpAnimation(
          curve: Curves.fastOutSlowIn,
          direction: Direction.horizontal,
          delayStart: Duration(milliseconds: 200),
            child:
            SingleChildScrollView(
              child:
              Container(
                height:height/1,
                width:width/2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('project').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                          width: 80,
                          height: 80,
                          child: Center(child:Lottie.asset("assets/loading1.json"),));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return
                            Padding(
                              padding:EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 15,
                                color:Colors.white,borderRadius: BorderRadius.circular(12),
                                child:
                                Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,borderRadius: BorderRadius.circular(12)
                                  ),
                                  width:width/3.20,
                                  height:height/3,
                                  child: Row(
                                    children: [
                                      Container(
                                        width:width/9.33,
                                        height:height/3,
                                        child: Lottie.asset('assets/project22.json'),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:width/3.520,
                                            height:height/20.86,
                                            child: Center(
                                              child: Text(snapshot.data!.docs[index]['projecttittle'],style: GoogleFonts.montserrat(
                                                  color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/60
                                              ),),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left:width/50),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height:height/104.3),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Client Name: ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['name'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Client Id : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['id'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Project Type : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['projecttype'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Project Status : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['projectstatus'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Email : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['email'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Phone : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['mobile'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Action : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['action'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Assigned Emp : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['cempname'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Emp id : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['cempid'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height:height/150),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(text: 'Start Date : ', style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/120
                                                      ),),
                                                      TextSpan(text:snapshot.data!.docs[index]['startdate'],style: GoogleFonts.montserrat(
                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                                      ),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),



                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                        }
                    );
                  },
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


