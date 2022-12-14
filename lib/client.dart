import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'form2.dart';

class ClientPage extends StatefulWidget {

  const ClientPage( {Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {

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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,color: Colors.white,size:width/124.4,
                              ),
                              hintText:'Search a Client',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white) ,
                              contentPadding: EdgeInsets.only(top:height/86.91,left:width/186.6),

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
                          MaterialPageRoute(builder: (context) => FormPage()),
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
                          child: Center(child: Text('New Client',style: TextStyle(
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
                        child: Text('Ongoing Clients',style: GoogleFonts.montserrat(
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
                  child: Padding(
                    padding:EdgeInsets.only(left: 20,right: 60),
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
                                  child: Padding(
                                    padding:EdgeInsets.only(left: 10,right:10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width/22,
                                            height: height/34.76,
                                            child: Center(child: Text(val["Id no"],
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.blue,fontWeight: FontWeight.w500),)),

                                          ),
                                          SizedBox(width: 3,),
                                          Container(
                                            width: width/7.46,
                                            height: height/34.76,
                                            child: Center(child: Text(val["Name"], overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width: 3,),
                                          Container(
                                            height: height/34.76,
                                            width: width/9,
                                            child: Center(child: Text("UI Finished", overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.deepOrange,fontWeight: FontWeight.w500),)),

                                          ),
                                          SizedBox(width: 3,),
                                          Container(
                                            height: height/34.76,
                                            width: width/8.48,
                                            child: Center(child: Text("10.12.2022",
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),


                                          ),
                                          SizedBox(width: 3,),
                                          Container(
                                            height: height/34.76,
                                            width: width/8,
                                            child: Center(child: Text("Website",
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width: 3,),
                                          Container(
                                            height: height/34.76,
                                            width: width/9,
                                            child: Center(child: Text("Sathya",
                                              style: GoogleFonts.poppins(
                                                  fontSize: width/133.28, color: Colors.black,fontWeight: FontWeight.w500),)),
                                          ),
                                          SizedBox(width: 3,),
                                          Container(decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.green
                                          ),
                                            height: height/30,
                                            width: width/14,
                                            child: Center(child: Text('View Process', overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(fontSize: width/133.28,
                                                  color: Colors.black,fontWeight: FontWeight.bold),)),

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
