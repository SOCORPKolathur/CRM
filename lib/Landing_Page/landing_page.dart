import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpage/add_client_form.dart';
import 'package:webpage/employeelist.dart';
import 'package:webpage/Profile_Page/profile_page.dart';
import 'package:webpage/sales.dart';
import 'package:webpage/team_chat.dart';
import '../Client_Page/client_page.dart';
import '../Dashboard_Page/dashboard_page.dart';
import '../Hr_Page/hr_page.dart';
import '../add_task.dart';
import '../all_employee_page.dart';
import '../add_emp_form.dart';
import '../leads.dart';
import '../leads2.dart';

class landing_page_admin extends StatefulWidget {
  String? id;
  landing_page_admin(this.id);

  @override
  State<landing_page_admin> createState() => _landing_page_adminState();
}

class _landing_page_adminState extends State<landing_page_admin> {
  //animated container
  int _width=290;
  int _height=570;
  var _Opticity=1.0;
  var  wid =10;
  //container size
  var conheight=50;
  var  conwidth=50;

  var  conwidth2=50;
  //icon size
  var _iconsize=40;
  //container width
  var containerwid=100;
  var containerhei=50;
  //container margin
  var marginsize=10;

  var _rowheright=30;
  var _rowwidth=100;
  var _sizedboxheight=5;

  //row container
  var _textheight=40;
  var _textwidth=110;

  var _aniduration=800;

  var login=Icons.login;

  var pages;

  var titilewidth=80;
  var tilleheight=30;

  var  _colors;
  bool i=true;
  int n=1;
  final TextEditingController noticefield=TextEditingController();
@override
  void initState() {
  setState(() {
    pages=add_client_form(widget.id,"");
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
          height: 300,
          width:width/5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                  width:width/5,
                  decoration: BoxDecoration(
                      color: Color(0xff5F67EC),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                  ),
                  child:Padding(
                    padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,left: width/60,right: width/60,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Notice',style: GoogleFonts.montserrat(
                            fontSize:width/80,fontWeight: FontWeight.bold,color: Colors.white
                        ),),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 10,),
              Row(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 15,),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },
                      child: Icon(Icons.cancel_outlined)),
                  SizedBox(width:10)
                ],
              ),
              Row(
                children: [
                SizedBox(width:10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                    Text('Circular',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                            contentPadding: EdgeInsets.all(5),
                              border: InputBorder.none,
                              isCollapsed: true,
                          ),)),
                      SizedBox(height:height/100,),
                    GestureDetector(
                      onTap: (){
                        Uploadnotice();
                      },
                      child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lightBlue
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Send',style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),),
                              Icon(Icons.send,size: 20,color: Colors.white,)
                            ],)
                      ),
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
                                   children:[ Row(
                                     children: [
                                       SizedBox(width:width/933,),
                                       Container(
                                         width: width/46.65,
                                           height:height/26.07,
                                           child: Image.asset("assets/profile.jpg")),
                                       SizedBox(width:width/373.2,),
                                       GestureDetector(
                                         onTap: (){
                                           print(height);
                                         },
                                         child: Text('Hi Admin',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.bold,color: Color(0xff334d6e,),fontSize:width/103.6,
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
                               Material(
                                 elevation:n==1?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   decoration: BoxDecoration(
                                   color: Colors.white,
                                       borderRadius: BorderRadius.circular(12)),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                       pages=dashboard_page(widget.id);
                                         n=1;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           SvgPicture.asset("assets/dash.svg"),
                                           SizedBox(width:width/933,),
                                           Text('Dash Board',
                                           style: GoogleFonts.montserrat(
                                           fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/86.91,),
                               Material(
                                 elevation:n==2?10: 0,
                                   borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   padding: EdgeInsets.only(top:height/208.6,),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)),


                                   child: GestureDetector(
                                     onTap: (){

                                       setState(() {
                                         n=2;
                                         pages=hr_page();

                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           SvgPicture.asset("assets/icons.svg"),
                                           SizedBox(width:width/933,),
                                           Text('HR',
                                             style: GoogleFonts.montserrat(
                                               fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/86.91,),
                               Material(
                                 elevation:n==3?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   padding: EdgeInsets.only(top:height/208.6),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=leads_page();
                                         n=3;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           SvgPicture.asset("assets/Group 11.svg"),
                                           SizedBox(width:width/933,),
                                           Text('Sales',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/86.91,),
                               Material(
                                 elevation:n==4?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   padding: EdgeInsets.only(top:height/208.6),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=all_employee_page();
                                         n=4;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           SvgPicture.asset("assets/Group 10.svg"),
                                           SizedBox(width:width/933,),
                                           Text('Employee',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/86.91,),
                               Material(
                                 elevation:n==6?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   padding: EdgeInsets.only(top:height/208.6),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=client_page();
                                         n=6;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           Image.asset("assets/clientpng.png"),
                                           SizedBox(width:width/933,),
                                           Text('Clients',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                           ),),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/86.91,),
                               Material(
                                 elevation:n==10?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:height/14.9,
                                   padding: EdgeInsets.only(top:height/208.6),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       ShownoticeDialog();
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width:width/933,),
                                           Image.asset("assets/calenderpng.png"),
                                           SizedBox(width:width/933,),
                                           Text('Notice', style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:width/103.6,
                                           ),),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:height/8,),

                               //SizedBox(height:height/9,),
                               Padding(
                                 padding:EdgeInsets.only(bottom: height/34.76),
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
                 height: MediaQuery.of(context).size.height * 0.93,
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

    });
  }
}
