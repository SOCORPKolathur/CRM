import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../all_employee_page.dart';
import '../add_emp_form.dart';

final CollectionReference user=FirebaseFirestore.instance.collection('Users');

class hr_page extends StatefulWidget {
  const hr_page({Key? key}) : super(key: key);

  @override
  State<hr_page> createState() => _hr_pageState();
}

class _hr_pageState extends State<hr_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    viewprogressDialog(documentid) async {
      var doumet= await FirebaseFirestore.instance.collection('User').doc(documentid).get();
      Map<String,dynamic>? val =doumet.data();
      AlertDialog alert=AlertDialog(
          content:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            width:width/4,
            height:height/3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.cancel_outlined,color:Colors.red,size:width/74.666,)),
                  ],),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color:Colors.black)
                  ),
                  width:width/4,
                  height:height/3.300,
                  child:Padding(
                    padding:EdgeInsets.only(left: width/233.33,right:width/233.33,top:height/130.416,bottom:height/130.416),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:height/150),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${val!["firstname"]} ${val["middlename"]} ${val["lastname"]}',style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize:22,
                                color: Colors.green
                            )),

                          ],
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Emp Id : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['username'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'gender : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['sex'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Contact : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['phone'],style: GoogleFonts.montserrat(
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
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['email'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'D.O.B : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['dob'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Position : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['position'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Shift : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['shift'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Branch : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['branch'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Category : ', style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/110
                              ),),
                              TextSpan(text:val['category'],style: GoogleFonts.montserrat(
                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/120
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height:height/150),
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
                    child:
                    Material(
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
                            prefixIcon: Icon(
                              Icons.search,color: Colors.white,size:width/124.4,
                            ),
                            hintText:'Search',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white) ,
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
                     MaterialPageRoute(builder: (context) => add_emp_form()),
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
                       child: Center(child: Text('Add HR',style: TextStyle(
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
                      child: Text('Current HR Executives',style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,    fontSize: width/74.64

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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('ID No',style: GoogleFonts.poppins(color:Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      Text('Name',style: GoogleFonts.poppins(color:  Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      Text('Email',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      Text('Contact',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      Text('Role',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      Text('Actions',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                    ]),
              ),
              SizedBox(
                height:height/104.3,
              ),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('User').orderBy('clock').snapshots(),
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
                        return
                        val['category'] == 'HR'?
                          Padding(
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
                            child: Row(
                                children: [
                                  Padding(
                                    padding:EdgeInsets.only(left:width/30),
                                    child: Container(
                                      width: width/18.66,
                                      height: height/34.76,
                                      child: Center(child: Text(val["empid"],
                                        style: GoogleFonts.poppins(fontSize: width/133.28,
                                            color: Colors.blue,fontWeight: FontWeight.w500),)),

                                    ),
                                  ),

                                  Padding(
                                    padding:EdgeInsets.only(left:width/35),
                                    child: Container(
                                      width: width/7.46,
                                      height: height/34.76,
                                      child: Center(child: Text('${val["firstname"]} ${val["middlename"]} ${val["lastname"]}', overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                    ),
                                  ),


                                  Padding(
                                    padding:EdgeInsets.only(left:width/130),
                                    child: Container(
                                      height: height/34.76,
                                      width: width/8.48,
                                      child: Center(child: Text(val["email"], overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(fontSize: width/133.28,
                                            color: Colors.black,fontWeight: FontWeight.w500),)),

                                    ),
                                  ),


                                  Container(
                                    height: height/34.76,
                                    width: width/8.48,
                                    child: Center(child: Text(val["phone"],
                                    style: GoogleFonts.poppins(
                                        fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),


                                  ),


                                  Container(
                                    height: height/34.76,
                                    width: width/8,
                                    child: Center(child: Text(val["position"],
                                    style: GoogleFonts.poppins(
                                        fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                  ),

                                  Padding(
                                    padding:EdgeInsets.only(left:width/40),
                                    child: GestureDetector(onTap: (){
                                      viewprogressDialog(val.id);
                                    },
                                      child: Container(
                                        height: height/34.76,
                                        width:width/12.44,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(Icons.error_outline,color: Color(0xffffb946),),
                                        ]),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ):
                        SizedBox();

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

