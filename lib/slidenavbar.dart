import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpage/profile.dart';
import 'package:webpage/sales.dart';
import 'client.dart';
import 'dash2.dart';
import 'dashboard.dart';
import 'employy.dart';
import 'form2.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
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
  int n=0;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body:
     Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(
           height: 1000,
           child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding:EdgeInsets.only(top:30,left:30,),
                   child: Material(
                     elevation: 20,
                     borderRadius: BorderRadius.circular(30),
                     child: AnimatedContainer(
                       curve: Curves.linear,
                       decoration: BoxDecoration(color: Color(0xffFFFFFF),
                           borderRadius: BorderRadius.circular(30),
                       ),
                       width:_width.toDouble(),
                       duration: Duration(milliseconds: 400),
                       child: Padding(
                         padding:EdgeInsets.only(left:15,right: 10),
                         child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 20,),
                               Container(
                                 decoration: BoxDecoration(

                                     borderRadius: BorderRadius.circular(12)),
                                 child: GestureDetector(
                                   onTap: (){
                                     setState(() {
                                       pages=Dash2();
                                       n=8;
                                     });
                                   },
                                   child: Center(
                                     child: Row(
                                       children: [
                                         SizedBox(width: 2,),
                                         Container(
                                           width: 40,
                                             height: 40,
                                             child: Image.asset("assets/profile.jpg")),
                                         SizedBox(width:5,),
                                         Text('Dhinesh',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.bold,color: Color(0xff334d6e,),fontSize: 18,
                                           ),
                                         ),

                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                               Divider(),
                               SizedBox(height: 20,),
                               Material(
                                 elevation:n==1?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height: 70,
                                   decoration: BoxDecoration(
                                   color: Colors.white,
                                       borderRadius: BorderRadius.circular(12)),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=Dash2();
                                         n=1;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           SvgPicture.asset("assets/dash.svg"),
                                           SizedBox(width: 2,),
                                           Text('Dash Board',
                                           style: GoogleFonts.montserrat(
                                           fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height: 12,),
                               Material(
                                 elevation:n==2?10: 0,
                                   borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5,),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)),


                                   child: GestureDetector(
                                     onTap: (){

                                       setState(() {
                                         n=2;
                                         pages=DashPage();

                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           SvgPicture.asset("assets/icons.svg"),
                                           SizedBox(width: 2,),
                                           Text('HR',
                                             style: GoogleFonts.montserrat(
                                               fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height: 12,),
                               Material(
                                 elevation:n==3?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=Sales();
                                         n=3;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           SvgPicture.asset("assets/Group 11.svg"),
                                           SizedBox(width: 2,),
                                           Text('Sales',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:12,),
                               Material(
                                 elevation:n==4?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=EmployeePage();
                                         n=4;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           SvgPicture.asset("assets/Group 10.svg"),
                                           SizedBox(width: 2,),
                                           Text('Employee',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                           ),
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:12,),
                               Material(
                                 elevation:n==6?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=ClientPage();
                                         n=6;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           Image.asset("assets/clientpng.png"),
                                           SizedBox(width: 2,),
                                           Text('Clients',
                                           style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize:18,
                                           ),),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:12,),
                               Material(
                                 elevation:n==5?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=FormPage();
                                         n=5;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           Image.asset("assets/calenderpng.png"),
                                           SizedBox(width: 2,),
                                           Text('Calender', style: GoogleFonts.montserrat(
                                           fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                           ),),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               SizedBox(height:12,),
                               Material(
                                 elevation:n==10?10: 0,
                                 borderRadius:BorderRadius.circular(12),
                                 child: Container(
                                   height:70,
                                   padding: EdgeInsets.only(top: 5),
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                       borderRadius:BorderRadius.circular(12)
                                   ),
                                   child: GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         pages=profile();
                                         n=10;
                                       });
                                     },
                                     child: Center(
                                       child: Row(
                                         children: [
                                           SizedBox(width: 2,),
                                           SvgPicture.asset("assets/pro.svg"),
                                           SizedBox(width: 2,),
                                           Text('My Profile', style: GoogleFonts.montserrat(
                                             fontWeight: FontWeight.w500,color: Color(0xff334d6e,),fontSize: 18,
                                           ),),

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),

                               SizedBox(height:200,),
                               Padding(
                                 padding:EdgeInsets.only(bottom: 30),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('Logout',style: GoogleFonts.montserrat(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20),),
                                     SizedBox(width: 10,),
                                     Icon(
                                       Icons.logout,
                                       color: Colors.black,
                                       size: 20.0,
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
           padding:EdgeInsets.only(left:10),
           child: Column(
             children: [
               SizedBox(height: 10,),
               Container(
                 margin: EdgeInsets.only(left: 2),
                 height: MediaQuery.of(context).size.height * 0.90,
                 width: MediaQuery.of(context).size.width*0.80,
                 child: pages,
               ),
             ],),
         ),
       ],
     ),

    );
  }
}
