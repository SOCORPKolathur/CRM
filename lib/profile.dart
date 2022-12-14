import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';

class profile extends StatefulWidget {

  const profile( {Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ShowUpAnimation(
          curve: Curves.fastOutSlowIn,
          direction: Direction.horizontal,
          delayStart: Duration(milliseconds: 200),
          child:
          Padding(
            padding:EdgeInsets.only(left: 20,top: 30),
            child: Row(
              children: [
              Column(
                children: [
                  Material(
                    elevation: 15,
                borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                      width: 420,
                      height: 900,
                      child: Column(
                        children: [
                          SizedBox(height: 80,),
                          Center(
                            child: Material(
                              elevation: 15,
                                borderRadius: BorderRadius.circular(100),
                              child: Container(
                                  decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)
                              ),
                                  width: 100,
                                  height: 100,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset("assets/sri.jpg"))),
                            ),
                          ),
                          SizedBox(height:20,),
                          Center(
                            child: Text('Srinivasa Perumal J',style: GoogleFonts.poppins(
                              fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                            ),),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Emp ID :',style: GoogleFonts.poppins(
                                  fontWeight:FontWeight.w500,color: Colors.black
                              ),),
                              Text(' 003',style: GoogleFonts.poppins(
                                  fontWeight:FontWeight.w500,color: Colors.black
                              ),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFB946),
                            borderRadius: BorderRadius.circular(30),
                          ),
                            width: 250,
                            height: 40,
                            child: Center(child: Text('Apply Leave',style: GoogleFonts.poppins(
                                fontWeight:FontWeight.bold,color: Colors.white,fontSize: 18
                            ),)),
                          ),
                          SizedBox(height:20),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height:50),
                              SizedBox(width:30),
                              Text('Current Position',style: GoogleFonts.poppins(
                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                              ),),
                            ],
                          ),
                          Padding(
                            padding:EdgeInsets.only(top: 8.0,right: 8,bottom: 8),
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:Color(0xffeeeeee),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 340,
                                height: 70,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      SizedBox(height: 40,),
                                      SizedBox(width: 10,),
                                    Text('Senior Flutter Developer',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.w600,color: Colors.black,fontSize: 15
                                    ),)
                                  ],),
                                  SizedBox(width: 15,),
                                  Row(children: [
                                    SizedBox(height: 10,),
                                    SizedBox(width: 10,),
                                    Text('Full Time'),
                                    SizedBox(width: 5,),
                                    Icon(Icons.circle,size: 8,),
                                    SizedBox(width: 5,),
                                    Text('Anna Nagar'),

                                  ],)
                                ],),
                              ),
                            ),
                          ),
                          SizedBox(height:20),

                          Divider(),
                          SizedBox(height: 60,),
                          Row(children: [
                            SizedBox(width:30),
                            Icon(Icons.email_outlined,),
                            SizedBox(width:5),
                            Text('Chat With HR',style: GoogleFonts.poppins(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15
                            ),),
                          ],),
                          SizedBox(height: 30,),
                          Row(children: [
                            SizedBox(width:30),
                            Icon(Icons.email_outlined,),
                            SizedBox(width:5),
                            Text('Chat With Team Leader',style: GoogleFonts.poppins(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15
                            ),),
                          ],),
                          SizedBox(height: 30,),
                          Row(children: [
                            SizedBox(width:30),
                            Icon(Icons.lock,),
                            SizedBox(width:5),
                            Text('Request to change password',style: GoogleFonts.poppins(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15
                            ),),
                          ],),
                          SizedBox(height: 120,),

                          Text('www.rankraze.com',style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w500,color: Colors.black
                          ),),


                        ],
                      ),
                    ),
                  )
                ],
              ),



















                SizedBox(width: 30,),
                Column(
                  children: [
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15)  ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15)  ),
                          color: Colors.white,
                        ),
                        width: 1000,
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('My Report',style: GoogleFonts.inter(
                                fontSize: 23,fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)  ),
                      child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)  ),
                        color:Colors.white
                  ),
                      width: 1000,
                      height: 840,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: Column(
                          children: [

                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Performance',style: GoogleFonts.poppins(
                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                ),),
                              ],
                            ),
                            SizedBox(height: 40,),

                            Container(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                        border: Border.all(color: Colors.red,width: 10),

                                      ),
                                      height: 120,
                                      width: 120,
                                      child: Center(child: Text('03',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.red,fontSize:35
                                      ),)),
                                    ),
                                    SizedBox(width: 10,),
                                    Text('Total Tasks Done',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                    ),),
                                  ],),
                                  SizedBox(width: 130,),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.green,width: 10)
                                        ),
                                        height: 120,
                                        width: 120,
                                        child: Center(child: Text('04',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.green,fontSize:35
                                        ),)),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('On going Task',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                      ),),
                                    ],),
                              ],),
                            ),

                            SizedBox(height: 40,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                Container(
                                  child: Column(
                                    children: [
                                    Text('Task Before Submit',style: GoogleFonts.poppins(
                                      fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                    ),),
                                    Text('04',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                    ),),
                                  ],),
                                ),
                                  SizedBox(width: 130,),
                                Container(
                                  child: Column(
                                    children: [
                                    Text('Task On Submit',style: GoogleFonts.poppins(
                                      fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                    ),),
                                      Text('06',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                      ),),
                                  ],),
                                ),
                                  SizedBox(width: 130,),
                                Container(
                                  child: Column(
                                    children: [
                                    Text('Task After Submit',style: GoogleFonts.poppins(
                                      fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                    ),),
                                    Text('05',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                    ),),
                                  ],),
                                ),
                              ],),
                            ),

                            SizedBox(height: 40,),
                            Material(
                              elevation: 10,
                                borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 8,),
                                  Icon(Icons.warning_amber_outlined,color: Colors.red,),
                                  SizedBox(width: 8,),
                                  Text('your performance is going good,but.still need a improvement',style: GoogleFonts.poppins(
                                      fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15
                                  ),),
                                ],),
                              ),
                            ),




                            SizedBox(height: 30,),





                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Worked Days',style: GoogleFonts.poppins(
                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                ),),
                              ],
                            ),
                            SizedBox(height: 40,),

                            Container(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: Colors.red,width: 10),

                                        ),
                                        height: 120,
                                        width: 120,
                                        child: Center(child: Text('03',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.red,fontSize:35
                                        ),)),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('Total Working Day',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                      ),),
                                    ],),
                                  SizedBox(width: 130,),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.green,width: 10)
                                        ),
                                        height: 120,
                                        width: 120,
                                        child: Center(child: Text('04',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.green,fontSize:35
                                        ),)),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('Leave Taken',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                                      ),),
                                    ],),
                                ],),
                            ),

                            SizedBox(height: 40,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('Sick Leave',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                        ),),
                                        Text('04',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                        ),),
                                      ],),
                                  ),
                                  SizedBox(width: 130,),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('Sudden Leave',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                        ),),
                                        Text('06',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                        ),),
                                      ],),
                                  ),
                                  SizedBox(width: 130,),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('Casual Leave',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: 14
                                        ),),
                                        Text('05',style: GoogleFonts.poppins(
                                            fontWeight:FontWeight.bold,color: Colors.black,fontSize: 16
                                        ),),
                                      ],),
                                  ),
                                ],),
                            ),

                            SizedBox(height: 40,),
                            Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 8,),
                                    Icon(Icons.verified_user,color: Colors.green,),
                                    SizedBox(width: 8,),
                                    Text('your Attendance Record Is Well Maintained, Keep It Up.....,,',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize: 15
                                    ),),
                                  ],),
                              ),
                            ),

                          ],
                        ),
                      ),
                  ),
                    )
                ],)
            ],),
          )
        ),
      ),

    );
  }
}
