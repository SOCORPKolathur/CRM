import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpage/calender.dart';
import 'package:webpage/group_chat.dart';
import 'package:webpage/Profile_Page/profile_page.dart';
import 'package:webpage/pomotorotimer.dart';
import '../Dashboard_Page/dashboard_page.dart';
import '../Login_page/login_page.dart';
import '../completed_task.dart';
import '../project_emp_page.dart';
import 'package:intl/intl.dart';


const List<String> lelist = <String>[ 'Casual Leave','Sick Leave', 'Preplaned Leave',];
class landing_page_employee extends StatefulWidget {
  String? id;
  landing_page_employee(this.id);
  @override
  State<landing_page_employee> createState() => _landing_page_employeeState();
}

class _landing_page_employeeState extends State<landing_page_employee> {

  String ledropdownValue = lelist.first;
  var  wid =10;
  var conheight=50;
  var  conwidth=50;
  var  conwidth2=50;
  var _iconsize=40;
  var containerwid=100;
  var containerhei=50;
  var marginsize=10;
  var login=Icons.login;
  var pages;
  var titilewidth=80;
  var tilleheight=30;
  bool i=true;
  int n=1;
  @override
  void initState() {
    setState(() {
      pages=dashboard_page(widget.id);
    });
    get123();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return
      Scaffold(
      body:
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height/1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:EdgeInsets.only(top:height/34.76,left:width/62.2,),
                    child: Material(
                      elevation: 20,
                      borderRadius: BorderRadius.circular(30),
                      child: AnimatedContainer(
                        curve: Curves.linear,
                        decoration: BoxDecoration (color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: width/6.43,
                        height: height/1.050,
                        duration: Duration(milliseconds: 400),
                        child: Padding(
                          padding:EdgeInsets.only(left:width/124.4,right: width/186.6),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height:height/52.15,),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                      children:[
                                        Row(
                                        children: [
                                          SizedBox(width:width/933,),
                                          Container(
                                              width: width/46.65,
                                              height:height/26.07,
                                              child:Image.asset("assets/drawer_user_icon.png"),),

                                          SizedBox(width:width/373.2,),
                                          GestureDetector(
                                            onTap: (){
                                              print(height);
                                            },
                                            child: Text('Hi ${namee.toString()} (EMP)',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                        SizedBox(height:height/52.15,),
                                        Container(
                                          height: height/21.325,
                                          decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Color(0xff5F67EC),
                                          ),
                                          child: Center(
                                            child: TextField(
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: width/155.5,
                                                fontWeight: FontWeight.bold,),
                                              textAlignVertical: TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(Icons.search,color: Colors.white,size:width/100.4,),
                                                  hintText:'Search Any',hintStyle:TextStyle(fontSize:width/124.4,color: Colors.white),
                                                  isCollapsed: true,
                                                  contentPadding: EdgeInsets.only(top:height/121.85)
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                SizedBox(height:height/80,),
                                Divider(),
                                SizedBox(height:height/52.15,),


                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      pages=dashboard_page(widget.id);
                                      n=1;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==1?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/dashboard drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Dash Board',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){

                                    setState(() {
                                      n=2;
                                      pages=profile_page(widget.id);

                                    });
                                  },
                                  child: Material(
                                    elevation:n==2?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6,),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/profile drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Profile',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      pages=chat(widget.id);
                                      n=3;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==3?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/teamchat drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Team Chat',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      n=4;
                                      pages=calender(widget.id);

                                    });
                                  },
                                  child: Material(
                                    elevation:n==4?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/calendar drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Calender',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      pages=pomotorotimer();
                                      n=6;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==6?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/promotortimer drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Promoter Timer',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color:Colors.black,fontSize:width/103.6,
                                              ),),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      pages=completed_task(widget.id);
                                      n=5;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==5?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/completetask drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Completed Task', style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,color:Colors.black,fontSize:width/103.6,
                                            ),),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:height/86.91,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      pages=project_emp_page(widget.id);
                                      n=8;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==8?10: 0,
                                    borderRadius:BorderRadius.circular(12),
                                    child: Container(
                                      height:height/14.9,
                                      padding: EdgeInsets.only(top:height/208.6),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/933,),
                                            Container(
                                                width: width/50,
                                                height:height/30,
                                                child: Image.asset("assets/project drawer.png")),
                                            SizedBox(width:width/140,),
                                            Text('Projects', style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,color:Colors.black,fontSize:width/103.6,
                                            ),),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),


                                SizedBox(height:height/10,),                                //SizedBox(height:height/9,),
                                Padding(
                                  padding:EdgeInsets.only(bottom: height/34.76),
                                  child: GestureDetector(onTap: (){
                                    logoutshow();
                                  },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Logout',style: GoogleFonts.montserrat(color: Colors.black,fontWeight:FontWeight.bold,fontSize:width/93.3),),
                                        SizedBox(width: width/186.6,),
                                        Icon(
                                          Icons.logout,
                                          color: Colors.black,
                                          size: width/93.3,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),





                              ]),
                        ),
                      ),
                    ),
                  ),





                ]
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left:width/186.6),
            child: Column(
              children: [
                SizedBox(height: height/104.3,),
                Container(
                  margin: EdgeInsets.only(left:width/933),
                  height: MediaQuery.of(context).size.height * 0.98,
                  width: MediaQuery.of(context).size.width*0.80,
                  child: pages,
                ),
              ],),
          ),
        ],
      ),

    );
  }
  String namee="";
  get123() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      namee=val!["firstname"];

    });
  }
  Future<void> logoutshow() async {
    return
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        width: 500,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: 'Logout',
        desc:
        'Are You Sure To Logout',
        btnCancelOnPress: () {
        },
        onDismissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        },
        btnOkOnPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>login_page()),
          );
        },
      ).show();

  }

}
