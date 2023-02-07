import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:webpage/add_client_form.dart';

import '../add_emp_form.dart';

class client_page extends StatefulWidget {

  const client_page( {Key? key}) : super(key: key);

  @override
  State<client_page> createState() => _client_pageState();
}

class _client_pageState extends State<client_page> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    viewprogressDialog(documentid) async {
      var doumet= await FirebaseFirestore.instance.collection('client').doc(documentid).get();
      Map<String,dynamic>? val =doumet.data();
      AlertDialog alert=AlertDialog(
          content:
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                ),
                width: 250,
                height: 390,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      GestureDetector(onTap: (){
                        Navigator.pop(context);
                      },
                          child: Icon(Icons.cancel_outlined,color:Colors.red,size: 25,)),
                    ],),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color:Colors.black)
                    ),
                    width: 250,
                    height: 350,
                    child:Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height:10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(val!["projecttittle"],style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize:22,
                                  color: Colors.green
                              )),

                            ],
                          ),
                          SizedBox(height:10),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Client Id : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['id'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Client Name : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['name'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Contact : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['mobile'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Email : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['email'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Project Type : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['projecttype'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Start Date : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['startdate'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Project Duration : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['projecttimeperiode'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Status : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['projectstatus'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Assigned Employee : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['cempname'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height:height/200),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Employee Id : ', style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                                ),),
                                TextSpan(text:val['cempid'],style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                                ),),
                              ],
                            ),
                          ),
                        ],),
                    ),
                  )

                ],),
              )


      );
      showDialog(
          context: context,
          builder:(BuildContext context){
            return alert;
          }
      );

    }

    return
      Scaffold(
          body:ShowUpAnimation(
            animationDuration: Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            direction: Direction.vertical,

            child: Column(
              children: [

                SizedBox(height: height/52.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left:width/37.32),
                      child: Material(
                        elevation:10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Color(0xff5F67EC),),
                          width:width/6,
                          height: height/23,
                          child: TextField(
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: width/155.5,
                              fontWeight: FontWeight.w500,),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,color: Colors.white,size:width/100.4,),
                                hintText:'Search a client',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white),
                                isCollapsed: true,
                                contentPadding: EdgeInsets.only(top:height/121.85)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left:width/37.32),
                      child: GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => add_client_form('','')),
                        );
                      },
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5F67EC),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            width:width/12.44,
                            height: height/23,
                            child: Center(child: Text('Add Client',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width/143.53),)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:height/52.15,),
                Padding(
                  padding:EdgeInsets.only(left:width/37.32,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(bottom:height/52.15,),
                        child: Text('Ongoing Clients',style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize: width/74.64

                        ),),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width/37.32,right:width/37.32),
                  height: height/20.86,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,offset: Offset(1,1),blurRadius: 2)]
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(left:width/93.3,right:width/31.1),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Client ID',style: GoogleFonts.poppins(color:Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Name',style: GoogleFonts.poppins(color:  Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Project Status',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Start Date',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Project Type',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Project Head',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                          Text('Action',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        ]),
                  ),
                ),
                SizedBox(
                  height:height/104.3,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('client').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                          width: 80,
                          height: 80,
                          child: Center(child:Lottie.asset("assets/Loading1.json"),));
                    }
                    return Container(
                        height: height/1.73,
                        width: double.infinity,
                        child: ListView(
                            children:snapshot.data!.docs.map((val)
                            {
                              return Padding(
                                padding:EdgeInsets.only(top: height/130.37,),
                                child: Container(
                                  margin: EdgeInsets.only(left: width/37.32, right: width/37.32),
                                  height: height/20.86,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(color: Colors.black12,
                                            spreadRadius: 2,
                                            offset: Offset(1, 1),
                                            blurRadius: 2)
                                      ]
                                  ),
                                  child: Padding(
                                    padding:EdgeInsets.only(left:width/186.6,right:width/186.6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width/22,
                                            height: height/34.76,
                                            child: Center(child: Text(val["id"],
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.blue,fontWeight: FontWeight.w500),)),

                                          ),
                                          SizedBox(width:width/622,),
                                          Container(
                                            width: width/7.46,
                                            height: height/34.76,
                                            child: Center(child: Text(val["name"], overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width:width/622,),
                                          Container(
                                            height: height/34.76,
                                            width: width/9,
                                            child: Center(child: Text(val["projectstatus"], overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.deepOrange,fontWeight: FontWeight.w500),)),

                                          ),
                                          SizedBox(width:width/622,),
                                          Container(
                                            height: height/34.76,
                                            width: width/8.48,
                                            child: Center(child: Text(val["startdate"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),


                                          ),
                                          SizedBox(width:width/622,),
                                          Container(
                                            height: height/34.76,
                                            width: width/8,
                                            child: Center(child: Text(val["projecttype"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width:width/622,),
                                          Container(
                                            height: height/34.76,
                                            width: width/9,
                                            child: Center(child: Text(val["cempname"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width:width/622,),
                                          GestureDetector(onTap: (){
                                            viewprogressDialog(val.id);
                                          },
                                            child: Container(decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(30),
                                                color: Colors.green
                                            ),
                                              height: height/30,
                                              width: width/14,
                                              child: Center(child: Text('Details', overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(fontSize: width/133.28,
                                                    color: Colors.white,fontWeight: FontWeight.bold),)),

                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            }
                            ).toList()
                        ));

                  },

                ),
                SizedBox(height: height/52.15,),

              ],
            ),
          )
      );
  }
}
