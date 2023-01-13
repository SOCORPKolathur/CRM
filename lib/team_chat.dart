import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'carrer.dart';
import 'add_emp_form.dart';

class team_chat extends StatefulWidget {
  const team_chat({Key? key}) : super(key: key);

  @override
  State<team_chat> createState() => _team_chatState();
}

class _team_chatState extends State<team_chat> with TickerProviderStateMixin{

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
            child: Padding(
              padding:EdgeInsets.only(top: height/52.15,left:width/93.3),
              child: Stack(children: [
                Column(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white
                        ),
                        height: height/1.15,
                        width:width/1.24,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xff5F67EC),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                                  ),
                                  width:width/1.24,
                                  height: height/18,
                                  child:Padding(
                                    padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,left: width/60,right:width/60),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Team Chat Box',style: GoogleFonts.montserrat(
                                            fontSize:width/103.66,fontWeight: FontWeight.bold,color: Colors.white
                                        ),),
                                        Icon(Icons.more_vert,color: Colors.white,),
                                      ],
                                    ),
                                  )
                              ),




                              Padding(
                                padding:EdgeInsets.only(top:height/60,bottom:height/69.53,left:width/30,right:width/30),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:width/2.5,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: width/186.6,),
                                                CircleAvatar(
                                                  radius: width/110,
                                                  backgroundImage: AssetImage("assets/sri.jpg"),
                                                ),
                                                SizedBox(width: width/373.2,),
                                                Text('Srini j v', style:GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width/143.53,
                                                ))
                                              ],),
                                            SizedBox(height: height/300,),
                                            Material(
                                              elevation: 15,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight:  Radius.circular(12) ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffc6baff),
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight:  Radius.circular(12) )
                                                ),
                                                  width:width/2.5,
                                                child: Padding(
                                                  padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,right:width/186.6,left:width/186.6,),
                                                  child: Column(
                                                    children: [
                                                      Text('hi pooja,are you done a ui for invest in share app,bcoz i am waiting to develop that design so quickly send the work',
                                                        style:GoogleFonts.montserrat(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize:width/120,
                                                        ) ,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text('10.12 pm',style: GoogleFonts.montserrat(
                                                        fontSize:width/186.6
                                                      ),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),),
                                            )

                                          ],),
                                      ),
                                    ],
                                  ),







                                  SizedBox(height: height/52.15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:width/2.5,
                                        child: Column(
                                          children: [
                                             Material(
                                              elevation: 15,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),topRight:  Radius.circular(15) ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xfff2f0fc),
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15),topRight:  Radius.circular(15) )
                                                ),

                                                width:width/2.5,
                                                child: Padding(
                                                  padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,left: width/186.6,right:width/186.6),
                                                  child: Column(
                                                    children: [
                                                      Text('hey Sri,,..its work going on i will send it as soon,and how was the day for you da ...',
                                                        style:GoogleFonts.montserrat(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize:width/120,
                                                        ) ,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text('10.12 pm',style: GoogleFonts.montserrat(
                                                              fontSize:width/186.6
                                                          ),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),),
                                            )

                                          ],),
                                      ),
                                    ],
                                  ),
                                ],),
                              ),
                            ],),

                            Padding(
                              padding:EdgeInsets.only(top:height/1.215,),
                              child: Material(
                                elevation: 15,
                                borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),),
                                child: Container(
                                    width:width/1.24,
                                    height:height/21,
                                    child: Material(
                                      borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),),
                                      elevation: 10,
                                      child: Padding(
                                        padding:EdgeInsets.only(right:width/74.64),
                                        child: TextFormField(
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: width/110,
                                            fontWeight: FontWeight.w500,),
                                          controller: _msg,
                                          cursorColor: Color(0xff5138EE),
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.send,color: Color(0xff5138EE),size:width/103.6,),
                                            hintText: 'Type Message Here...',
                                            border: InputBorder.none,
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.only(top:height/60,left:width/74.64)

                                          ),),
                                      ),
                                    )),
                              ),
                            ),

                          ],),

                      ),
                    ),


                  ],
                ),

              ],),

            ),
          )
      );
  }
}
