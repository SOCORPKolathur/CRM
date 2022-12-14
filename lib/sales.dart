import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';



class Sales extends StatefulWidget {
  const Sales({Key? key}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,color: Colors.white,size:width/124.4,
                              ),
                              hintText:'Search ',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white) ,
                              contentPadding: EdgeInsets.only(top:height/86.91,left:width/186.6),

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left:width/37.32),
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
                          child: Center(child: Text('New Leads',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: width/143.53),)),
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
                        child: Text('Ongoing Leads Status',style: GoogleFonts.montserrat(
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
                        Text('Si No',style: GoogleFonts.poppins(color:Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Name',style: GoogleFonts.poppins(color:  Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Lead Status',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Phone No',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Requirement',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Location',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Action',style: GoogleFonts.poppins(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      ]),
                ),
                SizedBox(
                  height:height/104.3,
                ),

                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Users').snapshots(),
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
                                          padding:EdgeInsets.only(left:width/50),
                                          child: Container(
                                            width: width/18.66,
                                            height: height/34.76,
                                            child: Center(child: Text(val["Id no"],
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.blue,fontWeight: FontWeight.w500),)),

                                          ),
                                        ),

                                        Container(
                                          width: width/8,
                                          height: height/34.76,
                                          child: Center(child: Text(val["Name"], overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                        ),


                                        Container(decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Color(0xffFFB946)
                                        ),
                                          height: height/30,
                                          width: width/13,
                                          child: Center(child: Text('In Progress', overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(fontSize: width/133.28,
                                                color: Colors.black,fontWeight: FontWeight.bold),)),

                                        ),


                                        Padding(
                                          padding:EdgeInsets.only(left:width/30),
                                          child: Container(
                                            height: height/34.76,
                                            width: width/8.48,
                                            child: Center(child: Text(val["contact"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),


                                          ),
                                        ),


                                        Padding(
                                          padding:EdgeInsets.only(left:width/26),
                                          child: Container(
                                            height: height/34.76,
                                            width: width/18.66,
                                            child: Center(child: Text(val["Role"],
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),

                                        Padding(
                                          padding:EdgeInsets.only(left:width/26),
                                          child: Container(
                                            height: height/34.76,
                                            width: width/18.66,
                                            child: Center(child: Text("Chennai",
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                        ),

                                        Padding(
                                          padding:EdgeInsets.only(left:width/26),
                                          child:
                                          Container(decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.green
                                          ),
                                            height: height/30,
                                            width: width/13,
                                            child: Center(child: Text('Change Status', overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.black,fontWeight: FontWeight.bold),)),

                                          ),
                                        ),

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
