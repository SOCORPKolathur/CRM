import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:webpage/slidenavbar.dart';

import 'dashboard.dart';

class loginf extends StatefulWidget {

  const loginf( {Key? key}) : super(key: key);

  @override
  State<loginf> createState() => _loginfState();
}

class _loginfState extends State<loginf> {
  TextEditingController emailfield = TextEditingController();
  TextEditingController passfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
    body: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: Colors.white70,
              ),
              width: MediaQuery.of(context).size.width * 0.50,
              child: Padding(
                padding: EdgeInsets.only(left:140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.only(top:20),
                      child: Text('Login',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26
                      ),),
                    ),

                    Padding(
                      padding:EdgeInsets.only(top:60),
                      child: Text('Email*',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 12
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:5),
                      child:
                      Container(
                        width: 280,
                        height: 45,
                        child: TextField(
                          controller: emailfield,
                          decoration: InputDecoration(
                              hintText: 'E-mail',hintStyle:TextStyle(fontSize: 15) ,
                              contentPadding: EdgeInsets.only(top: 5,left:10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:EdgeInsets.only(top:20),
                      child: Text('Password*',style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 12
                      ),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:5),
                      child: Container(
                        width: 280,
                        height:45,
                        child: TextField(
                          controller: passfield,
                          decoration: InputDecoration(
                              hintText: 'Password',hintStyle:TextStyle(fontSize: 15) ,
                              contentPadding: EdgeInsets.only(top: 5,left: 10),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:5,left: 180),
                      child: Text('Forgot Password',style: TextStyle(color: Color(0xff441d6b),fontSize: 12,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:50),
                      child: GestureDetector(
                        onTap: (){
                          emailfield.text == 'demo' && passfield.text == 'demo@123' ?
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>NavPage()),
                          ):
                         print('kskdffvdffghnfgh');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff363636),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          width: 280,
                          height: 45,
                          child: Center(child: Text('Login',style: TextStyle(color: Colors.white),)) ,
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),






            Container(
              decoration: BoxDecoration(
                color: Color(0xff109cf1),
              borderRadius:BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
            ),
              width: MediaQuery.of(context).size.width * 0.50,
              height: double.infinity,
              child: Stack(
                children: [

                  Positioned(
                      top: 400,
                      left:200,
                      child: SvgPicture.asset('assets/Vector 3.svg')),
                  Positioned(
                      top:0,
                      left:0,
                      child: SvgPicture.asset('assets/Vector 5.svg')),

                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),

                  Positioned(
                      top: 300,
                      left:220,
                      child: Container(
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset('assets/Group 2.svg'))),
                  Positioned(
                      top: 150,
                      left:380,
                      child: Container(
                        width: 200,
                          height: 200,
                          child: SvgPicture.asset('assets/Group 1.svg'))),

                  Positioned(
                      top: 370,
                      left:430,
                      child: Container(
                        width: 50,
                          height: 50,
                          child: SvgPicture.asset('assets/Group 3.svg'))),
                  Positioned(
                      top: 200,
                      left:300,
                      child: Container(
                        width: 50,
                          height: 50,
                          child: SvgPicture.asset('assets/Group 4.svg'))),


                ],
              ),
            ),

          ],
        )
      ],
    ),

    );
  }
}
