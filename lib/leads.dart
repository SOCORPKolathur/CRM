import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:webpage/leads2.dart';
import '../all_employee_page.dart';
import '../add_emp_form.dart';
import 'add_client_form.dart';

final CollectionReference user=FirebaseFirestore.instance.collection('Users');

class leads_page extends StatefulWidget {
  const leads_page({Key? key}) : super(key: key);

  @override
  State<leads_page> createState() => _leads_pageState();
}

class _leads_pageState extends State<leads_page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return
      Scaffold(
          body:ShowUpAnimation(
            curve: Curves.fastOutSlowIn,
            direction: Direction.horizontal,
            delayStart: Duration(milliseconds: 200),
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
                          MaterialPageRoute(builder: (context) => leads2_page()),
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
                            child: Center(child: Text('New Leads',style: GoogleFonts.montserrat(
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
                        child: Text('Ongoing Lead Status',style: GoogleFonts.montserrat(
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
                        Text('Si No',style: GoogleFonts.montserrat(color:Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Name',style: GoogleFonts.montserrat(color:  Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Lead Status',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Phone No',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Taken By',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Requirement',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Location',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                        Text('Actions',style: GoogleFonts.montserrat(color: Colors.black,fontSize:width/116.62,fontWeight: FontWeight.bold),),
                      ]),
                ),
                SizedBox(
                  height:height/104.3,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream:FirebaseFirestore.instance.collection('leads').where('status',isEqualTo: 'assigned').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                          width: 80,
                          height: 80,
                          child: Center(child:Lottie.asset("assets/loading1.json"),));
                    }
                    return ListView.builder(
                        shrinkWrap: true,

                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
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
                                      SizedBox(width:width/61.08,),
                                      Container(
                                        width: width/30.54,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text((index+1).toString(),style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue
                                          ),),
                                        ),

                                      ),
                                      SizedBox(width: width/76.35,),
                                      Container(
                                        width:width/10,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text(snapshot.data!.docs[index]['name'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),),
                                        ),

                                      ),


                                      SizedBox(width: width/90,),
                                      Container(
                                        width:width/12.72,
                                        height:height/28.43,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color:Colors.green,
                                        ),
                                        child:Center(
                                          child: Text(snapshot.data!.docs[index]['status'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white
                                          ),),
                                        ),

                                      ),
                                      SizedBox(width: width/76.35,),
                                      Container(
                                        width:width/10,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text(snapshot.data!.docs[index]['phone'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),),
                                        ),
                                      ),
                                      Container(
                                        width:width/12,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text(snapshot.data!.docs[index]['takenby'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),),
                                        ),

                                      ),

                                      Container(
                                        width:width/7.635,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text(snapshot.data!.docs[index]['requirement'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),),
                                        ),

                                      ),
                                      Container(
                                        width:width/12,
                                        height:height/28.43,
                                        child: Center(
                                          child: Text(snapshot.data!.docs[index]['location'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                          ),),
                                        ),

                                      ),

                                      GestureDetector(onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => add_client_form(snapshot.data!.docs[index]['name'],snapshot.data!.docs[index].id)),
                                        );
                                      },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color:Colors.green,
                                          ),
                                          width:width/13,
                                          height:height/28.43,
                                          child: Center(
                                            child: Text(snapshot.data!.docs[index]['action'],style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white
                                            ),),
                                          ),
                                        ),
                                      ),

                                    ]),
                              ),
                            );;

                        });
                  },),


                SizedBox(height: height/52.15,),

              ],
            ),
          )
      );
  }
}

