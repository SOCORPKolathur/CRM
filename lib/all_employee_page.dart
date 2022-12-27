import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'carrer.dart';
import 'add_emp_form.dart';

class all_employee_page extends StatefulWidget {
  const all_employee_page({Key? key}) : super(key: key);

  @override
  State<all_employee_page> createState() => _all_employee_pageState();
}

class _all_employee_pageState extends State<all_employee_page> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
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
                              prefixIcon: Icon(
                                Icons.search,color: Colors.white,size:width/124.4,
                              ),
                              hintText:'Search for a employee',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white) ,
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
                            child: Center(child: Text('Add Employee',style: TextStyle(
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
                        child: Text('Current Employee List',style: GoogleFonts.montserrat(
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
                        Text('Position',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Actions',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      ]),
                ),
                SizedBox(
                  height:height/104.3,
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('User').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                        height: height/1.73,
                        width: double.infinity,
                        child: ListView(
                            children:snapshot.data!.docs.map((val)
                            {
                              return
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
                                              child: Center(child: Text(val["username"],
                                                style: GoogleFonts.poppins(fontSize: width/133.28,
                                                    color: Colors.blue,fontWeight: FontWeight.w500),)),

                                            ),
                                          ),

                                          Padding(
                                            padding:EdgeInsets.only(left:width/35),
                                            child: Container(
                                              width: width/7.46,
                                              height: height/34.76,
                                              child: Center(child: Text(val["name1"], overflow: TextOverflow.ellipsis,
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
                                            child: Container(
                                              height: height/34.76,
                                              width:width/12.44,
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                        width:width/74.64,
                                                        height:height/41.72,
                                                        child: Image.asset('assets/Sendp.png',)),
                                                    Container(
                                                        width:width/74.64,
                                                        height:height/41.72,
                                                        child: Image.asset('assets/pointerp.png',)),
                                                    Icon(Icons.error_outline,color: Color(0xffffb946),),
                                                  ]),
                                            ),
                                          )
                                        ]),
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
