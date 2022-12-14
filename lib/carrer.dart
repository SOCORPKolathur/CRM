
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CarrierPage extends StatefulWidget {
  String name;
  String name2;
  String name3;
  String name4;
  var name5;
  var name6;
  CarrierPage(this.name,this.name2,this.name3,this.name4,this.name5,this.name6,);

  @override
  State<CarrierPage> createState() => _CarrierPageState();
}

class _CarrierPageState extends State<CarrierPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: SingleChildScrollView(

          child: Container(
            width: 800,
            margin: EdgeInsets.only(left: 220, top: 20, bottom: 20),
            decoration: BoxDecoration(color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(1, 1)
                )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 298.0),
                  child: Text('Your Profile', style: GoogleFonts.poppins(
                      fontSize: 32, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20, left: 360),
                  height: 95,
                  width: 95,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/DzX0ILdAC-removebg-preview.png"),),
                      borderRadius: BorderRadius.circular(132)),),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,

                          child: Row(
                            children: [
                              Text(
                                'Full Name:', style: GoogleFonts.poppins(
                                  fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      left: 62, top: 10, bottom: 10),
                                  decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(widget.name,
                                    style: GoogleFonts.poppins(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Row(
                            children: [
                              Text('Email Address:',
                                style: GoogleFonts.poppins(fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Text(widget.name2,
                                    style: GoogleFonts.poppins(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Row(
                            children: [
                              Text('Mobile Number:',
                                style: GoogleFonts.poppins(fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(widget.name3,
                                  style: GoogleFonts.poppins(fontSize: 18),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Row(
                            children: [
                              Text('Phone Number:',
                                style: GoogleFonts.poppins(fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 15, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(widget.name4,
                                    style: GoogleFonts.poppins(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Row(
                            children: [
                              Text('Sex:', style: GoogleFonts.poppins(
                                  fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 130, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Text(widget.name5,
                                    style: GoogleFonts.poppins(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ShowUpAnimation(
                          direction: Direction.horizontal,
                          delayStart: Duration(milliseconds: 500),
                          animationDuration: Duration(milliseconds: 1200),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Row(
                            children: [
                              Text('Job Positions:',
                                style: GoogleFonts.poppins(fontSize: 20),),
                              SizedBox(width: 2,),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 33, top: 10, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white),
                                  child: Text(widget.name6,
                                    style: GoogleFonts.poppins(fontSize: 18),)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),


                      ]),
                )

              ],),
          ),
        )
    );
  }
}