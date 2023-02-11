import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:webpage/add_client_form.dart';
import '../Client_Page/client_page.dart';
import '../Dashboard_Page/dashboard_page.dart';
import '../Holidays.dart';
import '../Hr_Page/hr_page.dart';
import '../Login_page/login_page.dart';
import '../admin_dashboard.dart';
import '../all_employee_page.dart';
import '../group_chat.dart';
import '../leads.dart';
import '../project_emp_page.dart';

class landing_page_admin extends StatefulWidget {
  String? id;
  landing_page_admin(this.id);

  @override
  State<landing_page_admin> createState() => _landing_page_adminState();
}

class _landing_page_adminState extends State<landing_page_admin> {

  var  wid =10;
  var conheight=50;
  var  conwidth=50;
  var  conwidth2=50;
  var containerwid=100;
  var containerhei=50;
  var marginsize=10;
var login=Icons.login;
  var pages;
  var titilewidth=80;
  var tilleheight=30;
  bool i=true;
  int n=1;
  final TextEditingController noticefield=TextEditingController();
@override
  void initState() {
  setState(() {
    pages=admin_dashboard(widget.id,);
  });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    ShownoticeDialog(){
      AlertDialog alert=AlertDialog(
        backgroundColor: Colors.transparent,
        content:Container(
          height:height/5,
          width:width/5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/104.3,),
              Row(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: width/124.4,),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },
                      child: Icon(Icons.cancel_outlined)),
                  SizedBox(width:width/186.6)
                ],
              ),
              Row(
                children: [
                  SizedBox(width:width/160),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Circular',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                      ],
                    ),
                    SizedBox(height:height/208.6,),
                    Container(
                        width:width/5.50,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(10),
                          color: Color(0xffECEDFF),
                        ),
                        child: TextFormField(
                          maxLines: 5,
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: width/140,
                            fontWeight: FontWeight.w500,),
                          textInputAction: TextInputAction.next,
                          controller: noticefield,
                          cursorColor: Color(0xff5138EE),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top:height/208.666,bottom:height/208.666,left: width/373.332,right: width/373.332,),
                              border: InputBorder.none,
                              isCollapsed: true,
                          ),)),
                      SizedBox(height:height/100,),
                    Row(
                      children: [
                        SizedBox(width:width/6.22,),
                        GestureDetector(
                          onTap: (){
                            Uploadnotice();
                            Navigator.pop(context);
                          },
                          child:
                          HoverCrossFadeWidget(
                            duration: Duration(milliseconds: 300),
                            firstChild: Container(
                                width:width/46.65,
                                height: height/26.07,
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue, shape: BoxShape.rectangle),
                                child:Center(child: Icon(Icons.send,size:width/93.3,color: Colors.white,))
                            ),
                            secondChild: Container(
                                width: width/31.1,
                                height: height/26.07,
                                decoration: BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                                child:Center(child: Icon(Icons.send,size:width/93.3,color: Colors.white,))
                            ),
                          )
                        ),

                      ],
                    )

                  ],)

              ],),
            ],
          ),
        ),
      );
      showDialog(
          context: context,
          builder:(BuildContext context){
            return alert;
          }
      );

    }

    return Scaffold(
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
                                           child: Text('Hi Admin',
                                             style: GoogleFonts.montserrat(
                                               fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                             ),
                                           ),
                                         ),

                                       ],
                                     ),
                                     SizedBox(height:height/60,),
                                   Container (
                                     height: height/21.325,
                                     decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                                       color:Color(0xff5F67EC),
                                     ),
                                     child: Center(
                                       child: TextField(
                                         style: GoogleFonts.montserrat(
                                           color: Colors.white,
                                           fontSize: width/155.5,
                                           fontWeight: FontWeight.w500,),
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
                                      pages=admin_dashboard(widget.id);
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
                                           SizedBox(width:width/933,),
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
                                      pages=hr_page();

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
                                               child: Image.asset("assets/hr drawer.png")),
                                           SizedBox(width:width/933,),
                                           Text('HR',
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
                                      pages=leads_page();
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
                                               child: Image.asset("assets/sales drawer.png")),
                                           SizedBox(width:width/933,),
                                           Text('Sales',
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
                                      pages=all_employee_page();
                                      n=4;
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
                                               child: Image.asset("assets/employee drawer.png")),
                                           SizedBox(width:width/933,),
                                           Text('Employee',
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
                                      pages=client_page();
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
                                         borderRadius:BorderRadius.circular(12)),
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           Container(
                                               width: width/50,
                                               height:height/30,
                                               child: Image.asset("assets/client drawer.png")),
                                           SizedBox(width:width/933,),
                                           Text('Clients',
                                             style: GoogleFonts.montserrat(
                                               fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
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
                                      pages=chat(widget.id);
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
                                                child: Image.asset("assets/teamchat drawer.png")),
                                            SizedBox(width:width/933,),
                                            Text('Team Chat',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
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
                                      n=7;
                                    });
                                  },
                                  child: Material(
                                    elevation:n==7?10: 0,
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
                                                child: Image.asset("assets/project drawer.png")),
                                            SizedBox(width:width/933,),
                                            Text('Project',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
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
                                      n=8;
                                    });
                                    ShownoticeDialog();
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
                                               child: Image.asset("assets/notice drawer.png")),
                                           SizedBox(width:width/933,),
                                           Text('Notice', style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
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
                                      n=10;
                                      pages=holiday_page();
                                    });
                                  },
                                  child: Material(
                                    elevation:n==10?10: 0,
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
                                                child: Image.asset("assets/notice drawer.png")),
                                            SizedBox(width:width/933,),
                                            Text('Holidays', style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,color: Colors.black,fontSize:width/103.6,
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),









                                SizedBox(height:height/40,),
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


                               /*Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   IconButton(
                                       onPressed: (){
                                     setState(() {
                                       _width=_width==180?                  50:180;
                                       _Opticity=_Opticity==1.0?           0.0:1.0;
                                       _iconsize=_iconsize==40?              30:40;
                                       containerwid=containerwid==100?       0:100;
                                       marginsize=marginsize==10?           11:10;
                                       containerhei=containerhei==50?        10:50;
                                       _rowheright=_rowheright==30?           0:30;
                                       _rowwidth=_rowwidth==100?             0:100;
                                       _sizedboxheight=_sizedboxheight==5?    5:5;

                                       _textwidth=_textwidth==110?           0:110;
                                       _textheight=_textheight==40?           0:40;
                                       _aniduration=_aniduration==800?    1200:800;

                                       tilleheight=tilleheight==30?           0:30;
                                       titilewidth=titilewidth==80?           0:80;

                                       login=login==Icons.login?
                                       Icons.login:
                                       Icons.logout;
                                     });

                                   }, icon:Icon(Icons.login
                                     ,size: 15,)),
                                 ],
                               )*/


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

  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  Future Uploadnotice() async{
    await _firebase.collection('allnotice').doc().set({
      'sendtime':DateTime.now().millisecondsSinceEpoch,
      'message' : noticefield.text,
      "submittime":"${DateTime.now().hour}:${DateTime.now().minute}",
      "submitdate":"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
      'clock':DateTime.now().millisecondsSinceEpoch

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
