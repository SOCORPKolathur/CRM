import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'carrer.dart';
import 'add_emp_form.dart';

class EmployeePage2 extends StatefulWidget {
  const EmployeePage2({Key? key}) : super(key: key);

  @override
  State<EmployeePage2> createState() => _EmployeePage2State();
}

class _EmployeePage2State extends State<EmployeePage2> with TickerProviderStateMixin{

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
                SizedBox(height:height/52.15,),


                Padding(
                  padding:EdgeInsets.only(left:width/37.32,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(bottom:height/52.15,),
                        child: Text('New Employee List',style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,    fontSize: width/74.64

                        ),),
                      ),
                      SizedBox(width: width/2.87,),
                      Padding(
                        padding:EdgeInsets.only(bottom:height/52.15,),
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
                        Text('Date',style: GoogleFonts.poppins(color:Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Name',style: GoogleFonts.poppins(color:  Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Status',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Position',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Phone',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Resume',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Actions',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      ]),
                ),
                SizedBox(height:height/80,),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('EMP').snapshots(),
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
                                  child: Row(
                                      children: [
                                        Padding(
                                          padding:EdgeInsets.only(left:width/43),
                                          child: Container(
                                            width: width/18.66,
                                            height: height/34.76,
                                            child: Center(child: Text(val["date"],
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.blue,fontWeight: FontWeight.w500),)),

                                          ),
                                        ),

                                        Padding(
                                          padding:EdgeInsets.only(left:width/70),
                                          child: Container(
                                            width: width/8,
                                            height: height/34.76,
                                            child: Center(child: Text(val["name"], overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),
                                        SizedBox(width: width/373.2,),


                                        Container(decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius: BorderRadius.circular(40)
                                        ),
                                          height: height/34.76,
                                          width: width/15,
                                          child: Center(child: Text(val["Status"], overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(fontSize: width/133.28,
                                                color: Colors.white,fontWeight: FontWeight.w500),)),
                                        ),


                                        SizedBox(width:width/62.2),
                                        Container(
                                          height: height/34.76,
                                          width: width/8.48,
                                          child: Center(child: Text(val["position"],
                                            style: GoogleFonts.poppins(
                                                fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),


                                        ),


                                        SizedBox(width:width/53.31,),
                                        Container(
                                          height: height/34.76,
                                          width: width/18.66,
                                          child: Center(child: Text(val["phone"],
                                            style: GoogleFonts.poppins(
                                                fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                        ),


                                        SizedBox(width:width/17,),
                                        Container(
                                          height: height/34.76,
                                          width: width/15,
                                          child: Center(child: Text('See Resume >>>',
                                            style: GoogleFonts.poppins(
                                                fontSize: width/133.28, color: Colors.blue,fontWeight: FontWeight.w500),)),
                                        ),

                                        SizedBox(width:width/31.1,),
                                        Container(
                                          height: height/34.76,
                                          width:width/12.44,
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    width:width/74.64,
                                                    height:height/41.72,
                                                    child: Image.asset('assets/a.png',)),

                                                Container(
                                                    width:width/74.64,
                                                    height:height/41.72,
                                                    child: Image.asset('assets/b.png',)),

                                                Container(
                                                    width:width/74.64,
                                                    height:height/41.72,
                                                    child: Image.asset('assets/c.png',)),

                                              ]),
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
