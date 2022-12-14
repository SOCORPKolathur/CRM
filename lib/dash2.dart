import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/loginf.dart';

import 'dashboard.dart';



class Dash2 extends StatefulWidget {
  const Dash2({Key? key}) : super(key: key);

  @override
  State<Dash2> createState() => _Dash2State();
}

class _Dash2State extends State<Dash2> {
  @override
  Widget build(BuildContext context) {

    var circletexts = 70;
    var val1=0.80;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:30,top:25,right: 30),
          child: Material(
            elevation:15,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.greenAccent
              ),
              height: 905,
              width: 1500,
              child: Column(
                children: [
                  Material(
                    elevation:15,
                  borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: 1400,
                      height: 100,
                      child: Row(
                        children: [
                          Column(children: [ CircularPercentIndicator(
                            radius: 80.0,
                            lineWidth: 10.0,
                            percent:val1,
                            restartAnimation: true,
                            center:Text(circletexts.toString()+'%',style:GoogleFonts.poppins(fontSize: 38,fontWeight: FontWeight.bold,color:Colors.green)),
                            progressColor: Colors.green,
                            animation: true,
                            animationDuration: 1200,
                            backgroundColor: Color(0xff707683),
                          ),],),
                          Column(children: [
                            Text('Important Notice',style: GoogleFonts.poppins(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize: 23
                            ),),
                            Container(
                              width: 20,
                              height: 50,
                              child: Row(children: [
                                Column(children: [
                                 Text('Sunday Will be Off By Chairman'),
                                 Text('20.10.22')
                                ],)
                              ],),
                            )

                          ],),
                          Column(children: [
                            Container(
                              width: 80,
                              height:30,
                            )
                          ],)
                        ],
                      ),

                    ),
                  ),





                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*GestureDetector(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>loginf()),
                        );

                      },
                        child: Container(
                          color: Colors.red,
                          width: 100,
                          height: 50,
                        ),
                      ),*/
                      ShowUpAnimation(
                        direction: Direction.vertical,
                        curve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 900),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Container(
                                  height: 570,width: 685,
                                  decoration: BoxDecoration(
                                      boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 2,offset: Offset(1,1))],
                                      color: Colors.white,borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('8 task completed out of 10',style:GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xff90A0B7)),),
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: LinearProgressIndicator(
                                          backgroundColor:Colors.grey,
                                          color: Colors.green,
                                          value: 0.8,
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('23 December ,Sunday',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 125,
                                          width: double.infinity,
                                          decoration: BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              boxShadow: [BoxShadow(blurRadius: 2,spreadRadius: 1,color: Colors.black12)]),
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(

                                                        children: [
                                                          Text('Send Benefits review by Sunday',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                                                          SizedBox(width: 312,),
                                                          Text('Remainder',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12),),
                                                        ],
                                                      ),
                                                    ),

                                                    //inside of the container with due dates
                                                    Container(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(children: [
                                                              Text('due date:',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey),),
                                                              Text('December 23.2018',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey)),
                                                            ],),
                                                            SizedBox(height: 20,),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(left: 0,right: 10),
                                                                  height: 30,width: 30,decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/DzX0ILdAC-removebg-preview.png',)),borderRadius: BorderRadius.circular(50)),
                                                                ),
                                                                Text('Georage Fields',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                                                                SizedBox(width: 410,),
                                                                Container(
                                                                    height: 25,
                                                                    width: 90,
                                                                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                                                                    child:Center(child: Text('Completd',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)))
                                                              ],),
                                                          ]),

                                                    ),
                                                  ],
                                                )

                                              ]),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 125,
                                          width: double.infinity,
                                          decoration: BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              boxShadow: [BoxShadow(blurRadius: 2,spreadRadius: 1,color: Colors.black12)]),
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(

                                                        children: [
                                                          Text('invite to office meet up',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                                                          SizedBox(width: 405,),
                                                          Text('call',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12),),
                                                        ],
                                                      ),
                                                    ),

                                                    //inside of the container with due dates
                                                    Container(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(children: [
                                                              Text('due date:',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey),),
                                                              Text('December 23.2018',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey)),
                                                            ],),
                                                            SizedBox(height: 20,),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(left: 0,right: 10),
                                                                  height: 30,width: 30,decoration: BoxDecoration(image: DecorationImage(
                                                                    image:AssetImage('assets/DzX0ILdAC-removebg-preview.png',)),borderRadius: BorderRadius.circular(50)),
                                                                ),
                                                                Text('Rebecca more',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                                                                SizedBox(width: 350,),
                                                                Icon(Icons.edit,color: Color(0xffC2CFE0),),
                                                                SizedBox(width: 5,),
                                                                Icon(Icons.delete,color: Color(0xffC2CFE0)),
                                                                SizedBox(width: 10,),
                                                                Container(
                                                                    height: 25,
                                                                    width: 90,
                                                                    decoration: BoxDecoration(color: Color(0xffF7685B),borderRadius: BorderRadius.circular(10)),
                                                                    child:Center(child: Text('Ended',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)))
                                                              ],),
                                                          ]),

                                                    ),
                                                  ],

                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                )

                                              ]),
                                        ),
                                      ),


                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 125,
                                          width: double.infinity,
                                          decoration: BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              boxShadow: [BoxShadow(blurRadius: 2,spreadRadius: 1,color: Colors.black12)]),
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(

                                                        children: [
                                                          Text('Office meet up',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
                                                          SizedBox(width: 465,),
                                                          Text('Event',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12),),
                                                        ],
                                                      ),
                                                    ),

                                                    //inside of the container with due dates
                                                    Container(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(children: [
                                                              Text('due date:',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey),),
                                                              Text('December 23.2018',style: GoogleFonts.poppins(fontSize: 12,color: Colors.grey)),
                                                            ],),
                                                            SizedBox(height: 20,),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(left: 0,right: 10),
                                                                  height: 30,width: 30,decoration: BoxDecoration(image: DecorationImage(image:AssetImage('assets/DzX0ILdAC-removebg-preview.png',)),borderRadius: BorderRadius.circular(50)),
                                                                ),
                                                                Text('Hindsey stroud',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                                                                SizedBox(width: 405),

                                                                Container(
                                                                    height: 25,
                                                                    width: 90,
                                                                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10)),
                                                                    child:Center(child: Text('Completed',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)))
                                                              ],),
                                                          ]),

                                                    ),
                                                  ],

                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                )

                                              ]),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 2,),
                              Padding(
                                padding: const EdgeInsets.only(left: 258.0),
                                child: TextButton(onPressed: (){},child: Text('Show more',style: GoogleFonts.poppins(color: Colors.lightBlue,fontSize: 14,fontWeight: FontWeight.bold),)),
                              ),
                            ],
                          ),
                        ),
                      ),



                      ShowUpAnimation(
                        direction: Direction.vertical,
                        curve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 900),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 344,width: 400,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5),
                                boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(1,1),spreadRadius: 1,blurRadius: 3)]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircularPercentIndicator(
                                  radius: 80.0,
                                  lineWidth: 10.0,
                                  percent:val1,
                                  restartAnimation: true,
                                  center:Text(circletexts.toString()+'%',style:GoogleFonts.poppins(fontSize: 38,fontWeight: FontWeight.bold,color:Colors.green)),
                                  progressColor: Colors.green,
                                  animation: true,
                                  animationDuration: 1200,
                                  backgroundColor: Color(0xff707683),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                ],),
            ),
          ),
        ),
      ),
    );
  }
}

Future showmodel(BuildContext,context)=>showDialog(
  useSafeArea: true,
  barrierColor: Colors.transparent,
  context: context, builder: (context) => Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Container(
        margin: EdgeInsets.only(top: 55,right: 30),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),boxShadow: [ BoxShadow(color: Colors.blue,spreadRadius: 2,blurRadius: 2)]),
        child:Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 80,width: 80,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100)),),
          SizedBox(height: 10,),
          Text('Dhinesh Kanna',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
          Text('Test@123',style: GoogleFonts.poppins(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
          SizedBox(height:20),
          ElevatedButton(
              onPressed: (){},
              child: TextButton(
                  onPressed: (){
                    launch("https://accounts.google.com/v3/signin/identifier?dsh=S-905475859%3A1667565857344241&continue=https%3A%2F%2Fmyaccount.google.com%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=ARgdvAukw2juEfnZ4J8XDomGh36v6AR7b9suwcezfnrYtQKzwqm3JdZ3-QvoGjk-Gz4ezQuwjfftiw");
                  },
                  child: Text('Manage a Account',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),))),
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              OutlinedButton(onPressed: (){
                launch("https://accounts.google.com/v3/signin/identifier?dsh=S-905475859%3A1667565857344241&continue=https%3A%2F%2Fmyaccount.google.com%3Futm_source%3Daccount-marketing-page%26utm_medium%3Dgo-to-account-button&service=accountsettings&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=ARgdvAukw2juEfnZ4J8XDomGh36v6AR7b9suwcezfnrYtQKzwqm3JdZ3-QvoGjk-Gz4ezQuwjfftiw");
              },
                  child:Text('Countinue to Google',style: GoogleFonts.poppins( color: Colors.black),)),
            ],),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){
                launch("https://www.facebook.com/login/");
              },
                  child:Text('Countinue to Facebook',style: GoogleFonts.poppins( color: Colors.black),)),
            ],),
          SizedBox(height: 10,),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);

          }, child:Text('Sign out')),

        ],) ),

  ],
),);

