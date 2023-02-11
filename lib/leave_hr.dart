import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'dart:io' as io;

import 'package:show_up_animation/show_up_animation.dart';


class leave_hr extends StatefulWidget {

  const leave_hr({Key? key}) : super(key: key);

  @override
  State<leave_hr> createState() => _leave_hrState();
}

class _leave_hrState extends State<leave_hr> with TickerProviderStateMixin{

  void initState() {
  }


  @override


  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:ShowUpAnimation(
        curve: Curves.fastOutSlowIn,
        direction: Direction.horizontal,
        delayStart: Duration(milliseconds: 200),
    child:
        Padding(
          padding:EdgeInsets.only(top:height/69.55,left:width/233.33),
          child: Container(
            height:height/1.14,
            width:width/1.28,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width:width/1.28,
                  height:height/20.86,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          print(width);
                          print(height);
                        },
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30) ),
                          child: Container(
                            height:height/20.86,
                            width:width/4.148,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                              color:Color(0xff5F67EC),
                            ),
                            child: Center(
                              child: Text('Request',style: GoogleFonts.montserrat(
                                fontSize:width/84.84,
                                fontWeight:FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:width/62.22,),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        child: Container(
                          height:height/20.86,
                          width:width/4.148,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                            color:Color(0xff5F67EC),
                          ),
                          child: Center(
                            child: Text('Accepted',style: GoogleFonts.montserrat(
                                fontSize:width/84.84,
                                fontWeight:FontWeight.bold,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width:width/62.22,),
                      Material(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                        elevation: 10,
                        child: Container(
                          height:height/20.86,
                          width:width/4.148,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                            color:Color(0xff5F67EC),
                          ),
                          child: Center(
                            child: Text('All Leaves',style: GoogleFonts.montserrat(
                                fontSize:width/84.84,
                                fontWeight:FontWeight.bold,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),

                    ],),
                ),
                SizedBox(height:height/104.33,),
                Container(
                  width:width/1.28,
                  height:height/1.24,
                  child: Row(
                    children: [
                      Container(
                        height:height/1.24,
                        width:width/4.148,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('leaves').where('status',isEqualTo: 'request').snapshots(),
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
                                          child: Row(
                                            children: [
                                              SizedBox(width:width/186.6),
                                              Container(
                                                width:width/5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height:height/104.3),
                                                    Text(snapshot.data!.docs[index]['name'],style: GoogleFonts.montserrat(
                                                        color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                    ),),
                                                    SizedBox(height:height/320),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(text: 'Emp Id : ', style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                          ),),
                                                          TextSpan(text:snapshot.data!.docs[index]['id'],style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height:height/320),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(text: 'Date : ', style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                          ),),
                                                          TextSpan(text:snapshot.data!.docs[index]['date'],style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height:height/320),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(text: 'Leave Type : ', style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                          ),),
                                                          TextSpan(text:snapshot.data!.docs[index]['type'],style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height:height/320),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(text: 'Reason : ', style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                          ),),
                                                          TextSpan(text:snapshot.data!.docs[index]['reason'],style: GoogleFonts.montserrat(
                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height:height/320),
                                                    Padding(
                                                      padding:EdgeInsets.only(top:height/130.416,bottom:height/130.416),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              leaveacceptall(snapshot.data!.docs[index].id);
                                                              leaveacceptid(snapshot.data!.docs[index].id);
                                                              Uploadaccleaveid(snapshot.data!.docs[index]["docid"],snapshot.data!.docs[index]["uuid"]);
                                                              },
                                                            child: Material(
                                                              elevation: 10,
                                                              borderRadius: BorderRadius.circular(5),
                                                              child: Container(
                                                                height:height/34.777,
                                                                width:width/26.666,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  color: Colors.green
                                                                ),
                                                                child: Center(
                                                                  child: Text('Accept',style: GoogleFonts.montserrat(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w700,fontSize:width/155.555
                                                                  ),),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(onTap: (){
                                                            leaverejectall(snapshot.data!.docs[index].id);
                                                            leaverejectid(snapshot.data!.docs[index].id);
                                                          },
                                                            child: Material(
                                                              elevation:10,
                                                              borderRadius: BorderRadius.circular(5),
                                                              child: Container(
                                                                height:height/34.777,
                                                                width:width/26.666,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  color: Colors.red
                                                                ),
                                                                child: Center(child: Text('Reject',style: GoogleFonts.montserrat(
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.w700,fontSize:width/155.555
                                                                ),)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height:height/320),

                                                  ],
                                                ),
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
                      SizedBox(width:width/62.22,),
                      Container(
                        height:height/1.24,
                        width:width/4.148,
                        decoration: BoxDecoration(
                        ),
                        child:
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('leaves').where('status',isEqualTo: 'accept').snapshots(),
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

                                          child: Row(
                                            children: [
                                              SizedBox(width:width/186.6),
                                              Padding(
                                                padding:EdgeInsets.only(top:height/130.416,bottom:height/130.416),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height:height/104.3),
                                                      Text(snapshot.data!.docs[index]['name'],style: GoogleFonts.montserrat(
                                                          color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                      ),),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Emp Id : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['id'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Date : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['date'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Leave Type : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['type'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),


                                                    ],
                                                  ),
                                                ),
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
                      SizedBox(width:width/62.22,),
                      Container(
                        height:height/1.24,
                        width:width/4.148,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                        ),
                        child:
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('leaves').snapshots(),
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
                                          child: Row(
                                            children: [
                                              SizedBox(width:width/186.6),

                                              Padding(
                                                padding:EdgeInsets.only(top:height/130.416,bottom:height/130.416),
                                                child: Container(
                                                  width:width/5,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(height:height/104.3),
                                                      Text(snapshot.data!.docs[index]['name'],style: GoogleFonts.montserrat(
                                                          color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                      ),),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Emp Id : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['id'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Date : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['date'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(text: 'Leave Type : ', style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                            ),),
                                                            TextSpan(text:snapshot.data!.docs[index]['type'],style: GoogleFonts.montserrat(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                            ),),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height:height/320),


                                                    ],
                                                  ),
                                                ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        )
    );
  }



























































  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

  leaveacceptall(thisdocid) async {
    await _firebase.collection('leaves').doc(thisdocid).update({
      "status":"accept"
    });
  }
  leaveacceptid(thisdocid) async {
    await _firebase.collection('User').doc(thisdocid).collection("myleaves").doc(thisdocid).update({
      "status":"accept"
    });
  }


  leaverejectall(thisdocid) async {
    await _firebase.collection('leaves').doc(thisdocid).update({
      "status":"reject"
    });
  }
  leaverejectid(thisdocid) async {
    await _firebase.collection('User').doc(thisdocid).collection("myleaves").doc(thisdocid).update({
      "status":"reject"
    });
  }

  Future Uploadaccleaveid(docid,leaveid) async{

    await _firebase.collection('User').doc(docid).collection("myleaves").doc(leaveid).update({
      "status":"accept"

    });

  }


}


