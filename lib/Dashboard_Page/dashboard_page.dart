import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:hovering/hovering.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/Login_page/login_page.dart';
import '../Hr_Page/hr_page.dart';

class dashboard_page extends StatefulWidget {
  String? id;
  dashboard_page(this.id);
  @override
  State<dashboard_page> createState() => _dashboard_pageState();
}
var play_circle= Icons.play_circle;
bool ck =true;
var ss ="given";
final TextEditingController taskdescriptionfield=TextEditingController();
final TextEditingController tasknamefield=TextEditingController();
final TextEditingController deadlinetimefield=TextEditingController();
final TextEditingController deadlinetimefield1=TextEditingController();
final TextEditingController deadlinedatefield=TextEditingController();
final TextEditingController empnamefield=TextEditingController();
TextEditingController empidfield=TextEditingController();

class _dashboard_pageState extends State<dashboard_page> {
  TimeOfDay selectedTime = TimeOfDay.now();
  getempid() async {
    final docemt = await FirebaseFirestore.instance.collection('User').get();
    for(int i =0;i<=docemt.docs.length;i++){
      if(docemt.docs[i]['name1']==empnamefield.text){
        setState(() {
          empidfield.text=docemt.docs[i]['username'];
        });
      }

    }
  }
  @override
  void initState() {
    get12();
    getcat();
    // TODO: implement initState
    super.initState();
  }


  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool startStop = true;
  String elapsedTime = '';
  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final Focus1 = FocusNode();
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
   ShowAlertDialog(){
     AlertDialog alert=AlertDialog(
       backgroundColor: Colors.transparent,
         content:Container(
           height: height/1.80,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
               color: Colors.white
           ),
           child: Column(
             children: [
               Container(
                   decoration: BoxDecoration(
                       color: Color(0xff5F67EC),
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                   ),
                   child:Padding(
                     padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,left: width/60,right: width/60,),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Add To Task',style: GoogleFonts.montserrat(
                             fontSize:width/80,fontWeight: FontWeight.bold,color: Colors.white
                         ),),
                         Material(
                           elevation: 10,
                             borderRadius: BorderRadius.circular(20),
                           child: Container(
                             decoration: BoxDecoration(
                               color: Colors.green,
                               borderRadius: BorderRadius.circular(20)
                           ),
                             height: height/25,
                             width: width/15,
                             child: Row(
                               children: [
                                 SizedBox(width: width/200,),
                                 Icon(Icons.done,size:width/100,color: Colors.white,),
                                 SizedBox(width:width/230),
                                 GestureDetector(
                                   onTap: (){
                                   get12();
                                   Uploadtasktoid();
                                   Uploadtasktoid2();
                                   Uploadtasktoid3();


                                 },
                                   child: Text('Done',style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white,
                                       fontSize:width/100
                                   ),),
                                 ),
                               ],),
                           ),
                         )
                       ],
                     ),
                   )
               ),
               Padding(
                 padding:EdgeInsets.only(top:height/69.53,bottom:height/69.53,left:width/46.65,right: width/46.65),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     SizedBox(height:height/30,),
                     Row(
                       children: [
                         Container(
                           width:width/4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Employee Name',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                               SizedBox(height:height/208.6,),
                               Material(
                                 elevation:10,
                                 borderRadius:  BorderRadius.circular(10),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius:  BorderRadius.circular(10),
                                     color: Color(0xffECEDFF),
                                   ),
                                   height:height/23.17,
                                   child: StreamBuilder<QuerySnapshot>(
                                       stream: FirebaseFirestore.instance.collection('User').snapshots(),
                                       builder: (context, snapshot){
                                         if (!snapshot.hasData) {
                                           return const CupertinoActivityIndicator();
                                         }
                                         return DropdownSearch<String>(

                                           isFilteredOnline: true,
                                           dropdownSearchDecoration: InputDecoration(
                                               hintText: 'Employee Name',
                                               border: InputBorder.none,
                                               helperStyle: GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/140,
                                                 fontWeight: FontWeight.w500,),
                                               hintStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/140,
                                                 fontWeight: FontWeight.w500,),
                                               labelStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/140,
                                                 fontWeight: FontWeight.w500,),
                                               counterStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/140,
                                                 fontWeight: FontWeight.w500,),
                                               floatingLabelStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/140,
                                                 fontWeight: FontWeight.w500,),


                                               fillColor: Colors.white
                                           ),
                                           mode: Mode.MENU,
                                           showClearButton: false,
                                           showSearchBox: true,
                                           showSelectedItems: true,
                                           items: snapshot.data!.docs.map((DocumentSnapshot document) {
                                             Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                                             return data["name1"].toString();
                                           }).toList().cast<String>(),
                                           onChanged: (value){
                                             getempid();
                                             setState(() {
                                               empnamefield.text= value.toString();
                                             }
                                             );

                                           },
                                         );
                                       }
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SizedBox(width:width/20,),
                         Container(
                           width:width/4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Employee ID',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),

                               SizedBox(height:height/208.6,),
                               Container(
                                   decoration: BoxDecoration(
                                     borderRadius:  BorderRadius.circular(10),
                                     color: Color(0xffECEDFF),
                                   ),
                                   height:height/23.17,
                                   child: Material(
                                     borderRadius:  BorderRadius.circular(10),
                                     elevation: 10,
                                     child: TextFormField(
                                       style: GoogleFonts.montserrat(
                                         color: Colors.black,
                                         fontSize: width/140,
                                         fontWeight: FontWeight.w500,),
                                       controller:empidfield,
                                       cursorColor: Color(0xff5138EE),
                                       decoration: InputDecoration(
                                           suffixIcon: Icon(Icons.person,size:width/109.76,),
                                           border: InputBorder.none,
                                           isCollapsed: true,
                                           contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                       ),),
                                   )),
                             ],
                           ),
                         ),
                       ],
                     ),

                     SizedBox(height:height/20,),
                     Row(
                       children: [
                         Container(
                           width:width/4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Deadline-Date',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                               SizedBox(height:height/208.6,),
                               Container(
                                   decoration: BoxDecoration(
                                     borderRadius:  BorderRadius.circular(10),
                                     color: Color(0xffECEDFF),
                                   ),
                                   height:height/23.17,
                                   child: Material(
                                     borderRadius:  BorderRadius.circular(10),
                                     elevation: 10,
                                     child: TextFormField(
                                         style: GoogleFonts.montserrat(
                                           color: Colors.black,
                                           fontSize: width/140,
                                           fontWeight: FontWeight.w500,),
                                         controller: deadlinedatefield,
                                         cursorColor: Color(0xff5138EE),
                                         decoration: InputDecoration(
                                             suffixIcon: Icon(Icons.calendar_month_sharp,size:width/109.76),
                                             border: InputBorder.none,
                                             isCollapsed: true,
                                             contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)

                                         ),
                                         readOnly: true,  // when true user cannot edit text
                                         onTap: () async {

                                           DateTime? pickedDate = await showDatePicker(
                                               context: context,
                                               initialDate: DateTime.now(), //get today's date
                                               firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                               lastDate: DateTime(2101)
                                           );
                                           if(pickedDate != null ){
                                             print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                             String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                             print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                             //You can format date as per your need

                                             setState(() {
                                               deadlinedatefield.text = formattedDate; //set foratted date to TextField value.
                                             });
                                           }else{
                                             print("Date is not selected");
                                           }
                                           //when click we have to show the datepicker
                                         }
                                     ),
                                   )),
                             ],
                           ),
                         ),

                         SizedBox(width:width/20,),

                         Container(
                           width:width/4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Deadline-Time',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                               SizedBox(height:height/208.6,),
                               Container(
                                   decoration: BoxDecoration(
                                     borderRadius:  BorderRadius.circular(10),
                                     color: Color(0xffECEDFF),
                                   ),
                                   height:height/23.17,
                                   child: Material(
                                     borderRadius:  BorderRadius.circular(10),
                                     elevation: 10,
                                     child: TextFormField(
                                       style: GoogleFonts.montserrat(
                                         color: Colors.black,
                                         fontSize: width/140,
                                         fontWeight: FontWeight.w500,),
                                       controller: deadlinetimefield,
                                       cursorColor: Color(0xff5138EE),
                                       decoration: InputDecoration(
                                           suffixIcon: Icon(Icons.access_time_sharp,size:width/109.76),
                                           border: InputBorder.none,
                                           isCollapsed: true,
                                           contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                       ),
                                       readOnly: true,  //set it true, so that user will not able to edit text
                                       onTap: () async {
                                         TimeOfDay? pickedTime =  await showTimePicker(
                                           initialTime: TimeOfDay.now(),
                                           context: context,
                                         );

                                         if(pickedTime != null ){
                                           print(pickedTime.format(context));   //output 10:51 PM
                                           DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                           //converting to DateTime so that we can further format on different pattern.
                                           print(parsedTime); //output 1970-01-01 22:53:00.000
                                           String formattedTime = DateFormat.jm().format(parsedTime);
                                           String formattedTime1 = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}";
                                           print(formattedTime); //output 14:59:00
                                           //DateFormat() is from intl package, you can format the time on any pattern you need.

                                           setState(() {
                                             deadlinetimefield.text = formattedTime; //set the value of text field.
                                             deadlinetimefield1.text = formattedTime1; //set the value of text field.
                                           });
                                         }else{
                                           print("Time is not selected");
                                         }
                                       },
                                     )

                                   ),
                                   ),
                             ],
                           ),
                         ),


                       ],
                     ),

                     SizedBox(height:height/20,),
                     Container(
                       width:width/1.8181,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Task Name',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                           SizedBox(height:height/208.6,),
                           Container(
                               decoration: BoxDecoration(
                                 borderRadius:  BorderRadius.circular(10),
                                 color: Color(0xffECEDFF),
                               ),
                               height:height/23.17,
                               child: Material(
                                 borderRadius:  BorderRadius.circular(10),
                                 elevation: 10,
                                 child: TextFormField(
                                   style: GoogleFonts.montserrat(
                                     color: Colors.black,
                                     fontSize: width/140,
                                     fontWeight: FontWeight.w500,),
                                   onFieldSubmitted: (i){
                                     FocusScope.of(context).requestFocus(Focus1);
                                   },
                                   controller: tasknamefield,
                                   cursorColor: Color(0xff5138EE),
                                   decoration: InputDecoration(
                                       border: InputBorder.none,
                                       isCollapsed: true,
                                       contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                   ),),
                               )),
                         ],
                       ),
                     ),

                     SizedBox(height:height/20,),
                     Container(
                       width:width/1.8181,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Task Description',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                           SizedBox(height:height/208.6,),
                           Container(
                               decoration: BoxDecoration(
                                 borderRadius:  BorderRadius.circular(10),
                                 color: Color(0xffECEDFF),
                               ),
                               height:height/23.17,
                               child: Material(
                                 borderRadius:  BorderRadius.circular(10),
                                 elevation: 10,
                                 child: TextFormField(
                                   style: GoogleFonts.montserrat(
                                     color: Colors.black,
                                     fontSize: width/140,
                                     fontWeight: FontWeight.w500,),
                                   focusNode: Focus1,
                                   textInputAction: TextInputAction.next,
                                   controller: taskdescriptionfield,
                                   cursorColor: Color(0xff5138EE),
                                   decoration: InputDecoration(
                                       border: InputBorder.none,
                                       isCollapsed: true,
                                       contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                   ),),
                               )),
                         ],
                       ),
                     ),




                   ],),
               ),
             ],),
         ),
     );
     showDialog(
         context: context,
         builder:(BuildContext context){
           return alert;
         }
     );

   }
    var circletexts = 70;
    var val1=0.80;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left:width/62.2,top:height/41.72,right:width/62.2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height:height/1.14,
            width:width/1.24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                catcat=='Employee'?
                Material(
                  elevation:15,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    width: width/1.33,
                    height: height/6.95,
                    child: Row(
                      children: [

                        SizedBox(width:width/62.2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              child: CircularPercentIndicator(
                                radius: width/32,
                                lineWidth:width/250,
                                percent:val1,
                                restartAnimation: true,
                                center:Column(
                                  children: [
                                    SizedBox(height:height/41.72,),
                                    Text('Tasks',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: width/150),),
                                    Text('Performance',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: width/150),),
                                    Text(circletexts.toString()+'%',style:GoogleFonts.poppins(fontSize:width/80,
                                        fontWeight: FontWeight.bold,color:Colors.green)),
                                    Icon(Icons.report_gmailerrorred,size: width/160,),

                                  ],
                                ),
                                backgroundColor: Colors.red,
                                progressColor: Colors.green,
                                animation: true,
                                animationDuration: 1200,
                              ),
                            )
                          ],),
                        SizedBox(width:width/37.32),
                        Container(
                          color:Colors.white,
                          height:height/7.78,
                          width:width/3.39,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height/52.15),
                              Text('Important Notice',style: GoogleFonts.montserrat(
                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                              SizedBox(height:height/104.3),
                              SizedBox(width:width/186.6),
                              Material(
                                elevation: 15,
                                borderRadius: BorderRadius.circular(15),
                                child:
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:Colors.white,
                                  ),
                                  width:width/3,
                                  height:height/18,
                                  child:
                                  Row(
                                    children: [
                                      SizedBox(width:width/186.6),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height:height/173.83),
                                          Text('Sunday Will be Off By Chairman',style: GoogleFonts.inter(
                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                          ),),
                                          SizedBox(height:height/347.66),
                                          Text('20.10.22',style: GoogleFonts.inter(
                                              color:Colors.red,fontSize:width/143.53
                                          ),),


                                        ],),
                                      SizedBox(width:width/7.17),
                                      Icon(Icons.arrow_circle_right,size:width/46.65),

                                    ],),
                                ),
                              )

                            ],),
                        ),
                        SizedBox(width: width/26.65,),
                      ],
                    ),

                  ),
                )
                    :
                Material(
                  elevation:15,
                borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: width/1.33,
                    height: height/6.95,
                    child: Row(
                      children: [
                        SizedBox(width:width/62.2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              child: CircularPercentIndicator(
                                radius: width/32,
                                lineWidth:width/373.2,
                                percent:val1,
                                restartAnimation: true,
                                center:Column(
                                  children: [
                                    SizedBox(height:height/41.72,),
                                    Text('Tasks',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: width/150),),
                                    Text('Performance',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: width/150),),
                                    Text(circletexts.toString()+'%',style:GoogleFonts.poppins(fontSize:width/80,
                                        fontWeight: FontWeight.bold,color:Colors.green)),
                                    Icon(Icons.report_gmailerrorred,size: width/160,),

                                  ],
                                ),
                                progressColor: Colors.green,
                                animation: true,
                                animationDuration: 1200,
                                backgroundColor: Color(0xff707683),
                              ),
                            )
                          ],),
                        SizedBox(width:width/37.32),
                        Container(
                          color:Colors.white,
                          height:height/7.78,
                          width:width/3.39,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height/52.15),
                            Text('Important Notice',style: GoogleFonts.montserrat(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                              SizedBox(height:height/104.3),
                              SizedBox(width:width/186.6),
                            Material(
                              elevation: 15,
                              borderRadius: BorderRadius.circular(15),
                              child:
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                color:Colors.white,
                              ),
                                width:width/3,
                                height:height/18,
                                child:
                                Row(
                                  children: [
                                    SizedBox(width:width/186.6),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height:height/173.83),
                                   Text('Sunday Will be Off By Chairman',style: GoogleFonts.inter(
                                     color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                   ),),
                                      SizedBox(height:height/347.66),
                                   Text('20.10.22',style: GoogleFonts.inter(
                                     color:Colors.red,fontSize:width/143.53
                                   ),),


                                  ],),
                                    SizedBox(width:width/7.17),
                                    Icon(Icons.arrow_circle_right,size:width/46.65),

                                ],),
                              ),
                            )

                          ],),
                        ),
                        SizedBox(width: width/26.65,),
                        Column(children: [
                            SizedBox(height:height/57,),
                          GestureDetector(
                            onTap: (){
                            ShowAlertDialog();
                          },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:Color(0xff5f67ec),
                                ),
                                child:Row(children: [
                                  SizedBox(width:width/186.6,),
                                  Icon(
                                    Icons.add_circle_sharp,
                                    color: Colors.white,size:width/74.64,
                                  ),
                                  SizedBox(width:width/373.2,),
                                  Text('Assign New Task',style: GoogleFonts.montserrat(
                                      fontWeight:FontWeight.w500,color: Colors.white,fontSize:width/124.4
                                  ),)
                                ],),
                                width:width/9.33,
                                height:height/22,
                              ),
                            ),
                          ),
                            SizedBox(height:height/57,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Color(0xff5f67ec),
                              ),
                              child:Row(
                                children: [
                                  SizedBox(width:width/186.6,),
                                Icon(
                                  Icons.message_outlined,
                                  color: Colors.white,size:width/74.64,
                                ),
                                  SizedBox(width:width/373.2,),
                                Text('Team Chat',style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w500,color: Colors.white,fontSize:width/124.4
                                ),)
                              ],),
                              width:width/9.33,
                              height:height/22,
                            ),
                          ),
                            SizedBox(height:height/57,),
                        ],),
                        SizedBox(width:width/26.65,),
                        Column(
                          children: [

                            SizedBox(height:height/57,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Color(0xff5f67ec),
                              ),
                              child:Row(children: [
                                SizedBox(width:width/186.6,),
                                Icon(
                                  Icons.verified_user_sharp,
                                  color: Colors.white,size:width/74.64,
                                ),
                                SizedBox(width:width/373.2,),
                                Text('Completed Task',style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w500,color: Colors.white,fontSize:width/124.4
                                ),)
                              ],),
                              width:width/9.33,
                              height:height/22,
                            ),
                          ),
                            SizedBox(height:height/57,),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Color(0xff5f67ec),
                              ),
                              child:Row(children: [
                                SizedBox(width:width/186.6,),
                                Icon(
                                  Icons.contact_page_rounded,
                                  color: Colors.white,size:width/74.64,
                                ),
                                SizedBox(width:width/373.2,),
                                Text('View My Report',style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.w500,color: Colors.white,fontSize:width/124.4
                                ),)
                              ],),
                              width:width/9.33,
                              height:height/22,
                            ),
                          ),
                            SizedBox(height:height/57,),
                        ],),
                      ],
                    ),

                  ),
                ),








                catcat=='Employee'?

                Padding(
                  padding:EdgeInsets.only(top:height/52.15),
                  child: Material(
                    elevation: 15,
                      borderRadius: BorderRadius.circular(20),
                    child: Container(decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                      height: height/1.41,
                      width: width/1.33,
                      child: Row(
                        children: [
                          SizedBox(width:width/46.65),
                          Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height:height/52.15),
                                Text('My Task',style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                                  SizedBox(height:height/347.66),
                                Text('23 December,Sunday',style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                ),),
                                  SizedBox(height:height/104.3),
                                  Container(
                                    width:width/3.20,
                                    child:
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').snapshots(),
                                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                          return
                                            ListView(
                                              physics: ScrollPhysics(),
                                                shrinkWrap: true,
                                                children: snapshot.data!.docs.map((d1){
                                                  return
                                                    Padding(
                                                      padding:EdgeInsets.only(top:height/104.3),
                                                      child:
                                                      Material(
                                                        elevation: 15,
                                                        color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                        child:
                                                        AnimatedContainer(
                                                          duration: const Duration(seconds: 10),

                                                          decoration: BoxDecoration(
                                                              color:Colors.white,borderRadius: BorderRadius.circular(12)
                                                          ),
                                                          width:width/3.20,
                                                          child: Row(
                                                            children: [
                                                              SizedBox(width:width/186.6),
                                                              Container(
                                                                width:width/7.77,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    SizedBox(height:height/104.3),
                                                                    Text('${d1['taskname']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                    ),),
                                                                    SizedBox(height:height/320),
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:'${d1['deadlinedate']}',style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(height:height/320),
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Due Time : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:'${d1['deadlinetime']}',style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(height:height/320),
                                                                    d1["view"]==true ? RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:'${d1['taskdescription']}',style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ) : SizedBox(),
                                                                    SizedBox(height:height/320),
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Assigned From : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:'${d1['taskfromid']}',style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(height:height/104.3),

                                                                  ],
                                                                ),

                                                              ),
                                                              SizedBox(width:width/74.64),
                                                              Container(
                                                                height:height/34.76,
                                                                width: width/14.35,
                                                                decoration: BoxDecoration(
                                                                    color:Colors.red,borderRadius: BorderRadius.circular(20)
                                                                ),
                                                                child: Center(child: Text(elapsedTime,style: GoogleFonts.montserrat(
                                                                  ),
                                                                )
                                                                ),
                                                              ),
                                                              SizedBox(width:width/100),
                                                              GestureDetector(
                                                                onTap: ()
                                                                {
                                                                  startOrStop();
                                                                    if(ck==true){
                                                                      setState(() {
                                                                        ck=false;
                                                                      });
                                                                    }
                                                                    else {
                                                                      setState(() {
                                                                        ck=true;
                                                                      });
                                                                    }



                                                                },
                                                                child: ck == true ? Tooltip(
                                                                  message: 'Start Timer',
                                                                  child: Icon(
                                                                    Icons.play_circle,
                                                                    color: Colors.red,size:width/ 46.65,),
                                                                ) :Tooltip(
                                                                  message: 'Stop Timer',
                                                                  child: Icon(
                                                                    Icons.pause_circle,
                                                                    color: Colors.red,size:width/ 46.65,),
                                                                )

                                                              ),
                                                              SizedBox(width:width/100),
                                                             d1["status"]=="given"? Tooltip(
                                                               message: 'Start Task',
                                                               child: GestureDetector(
                                                                 onTap: (){
                                                                   mytasktaken(d1.id);
                                                                 },
                                                                 child: Icon(
                                                                    Icons.task,
                                                                    color: Colors.blue,size: width/53.31,),
                                                               ),
                                                             ) :
                                                             d1["status"]=="taken"? Tooltip(
                                                               message: 'Task Done',
                                                               child: GestureDetector(
                                                                 onTap: (){
                                                                 mytaskcomplete(d1.id);
                                                                 timeupdate(d1.id);
                                                               },
                                                                 child: Icon(
                                                                   Icons.add_alert,
                                                                   color: Colors.orange,size: width/53.31,),
                                                               ),
                                                             ) :
                                                             d1["status"]=="complete"? Tooltip(
                                                               message: "Already Done",
                                                               child: Icon(
                                                                 Icons.verified_rounded,
                                                                 color: Colors.green,size: width/53.31,),
                                                             ):SizedBox(),


                                                              SizedBox(width:width/100),
                                                              GestureDetector(
                                                                onTap:(){
                                                                  setState(() {
                                                                    if(d1['view'] == false)
                                                                    { mytaskget(d1.id);}
                                                                    else
                                                                    {mytaskget2(d1.id);}
                                                                  });
                                                                },
                                                                child:
                                                                d1["view"]==true ?
                                                                Tooltip(
                                                                  message: "shrink",
                                                                  child: Icon(
                                                                    Icons.arrow_circle_up_outlined,
                                                                    color: Colors.red,size: width/53.31,),
                                                                ):
                                                                Tooltip(
                                                                  message: "Expand",
                                                                  child: Icon(
                                                                    Icons.arrow_circle_down_outlined,
                                                                    color: Colors.green,size: width/53.31,),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),


                                                    );

                                                }).toList()
                                            );
                                        }
                                    ),

                                  ),
                                  SizedBox(height:height/50,),



                              ],
                              ),
                              Padding(
                                padding:EdgeInsets.only(left:width/62.2,top:height/1.89),
                                child: Row(
                                  children: [
                                    SizedBox(width: width/11.66,),
                                    GestureDetector(
                                      onTap: (){
                                        ShowAlertDialog();
                                      },
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color:Color(0xff5f67ec),
                                          ),
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [

                                              Text('Assigining Task',style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.w700,color: Colors.white,fontSize:width/124.4
                                              ),)
                                            ],),
                                          width:width/9.33,
                                          height:height/22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:width/62.2),

                          Container(height:height/1.89,child: VerticalDivider()),

                          SizedBox(width:width/62.2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height/52.15),
                              Text('Allocated Task',style: GoogleFonts.montserrat(
                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                              SizedBox(height:height/347.66),
                              GestureDetector(
                                onTap: (){
                                  print(widget.id);
                                },
                                child: Text('23 December,Sunday',style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                ),),
                              ),
                              SizedBox(height:height/104.3),
                              Container(
                                width:width/3.20,

                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('Assignedtask').snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return ListView(
                                          physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          children: snapshot.data!.docs.map((d1){
                                            return
                                              Padding(
                                                padding: EdgeInsets.only(top:height/104.3),
                                                child: Material(
                                                  elevation: 15,
                                                  color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                  child:
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:Colors.white,borderRadius: BorderRadius.circular(12)
                                                    ),
                                                    width:width/3.20,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width:width/186.6),

                                                        Container(
                                                          width:width/7.77,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height:height/104.3),
                                                              Text('${d1['taskname']}',style: GoogleFonts.montserrat(
                                                                  color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                              ),),
                                                              SizedBox(height:height/320),

                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['deadlinedate']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),

                                                              SizedBox(height:height/320),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Due Time : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['deadlinetime']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height:height/320),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Assigned From : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['taskfromid']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height:height/320),
                                                              d1["view"]==true ?
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['taskdescription']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ):SizedBox(),

                                                              SizedBox(height:height/104.3),

                                                            ],
                                                          ),

                                                        ),




                                                        SizedBox(width:width/74.64),
                                                        Tooltip(
                                                          message: "See The Progress of Task",
                                                          child: Container(
                                                            height:height/34.76,
                                                            width: width/14.35,
                                                            decoration: BoxDecoration(
                                                                color:Colors.blue,borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            child: Center(child: Text('View Progress',style: GoogleFonts.montserrat(
                                                                color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                            ),)),
                                                          ),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        Tooltip(
                                                          message: "Delete The Task",
                                                          child: GestureDetector(onTap: (){
                                                            deletetask(d1.id);
                                                          },
                                                            child: Icon( Icons.delete_forever,
                                                              color: Colors.red,size:width/ 46.65,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        Tooltip(
                                                          message: "Delete The Task",
                                                          child: Icon(
                                                            Icons.verified_rounded,
                                                            color: Colors.green,size: width/53.31,),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        GestureDetector(
                                                          onTap:(){
                                                            setState(() {
                                                              if(d1['view'] == false)
                                                              {
                                                                assignedtaskget(d1.id);
                                                              }
                                                              else
                                                              {
                                                                assignedtaskget2(d1.id);
                                                              }
                                                            });
                                                          },
                                                          child:
                                                          d1["view"]==true ?
                                                          Icon(
                                                            Icons.arrow_circle_up_outlined,
                                                            color: Colors.red,size: width/53.31,):
                                                          Icon(
                                                            Icons.arrow_circle_down_outlined,
                                                            color: Colors.green,size: width/53.31,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                          }).toList()
                                      );
                                    }
                                ),
                              ),
                            ],),



                        ],
                      ),
                    ),
                  ),
                ):









                Padding(
                  padding:EdgeInsets.only(top:height/52.15),
                  child: Material(
                    elevation: 15,
                      borderRadius: BorderRadius.circular(20),
                    child: Container(decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                      height: height/1.41,
                      width: width/1.33,
                      child: Row(
                        children: [
                          SizedBox(width:width/46.65),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height/52.15),
                            Text('My Task',style: GoogleFonts.montserrat(
                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                              SizedBox(height:height/347.66),
                            Text('23 December,Sunday',style: GoogleFonts.montserrat(
                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                            ),),
                              SizedBox(height:height/104.3),


                              Container(
                                width:width/3.20,

                                child:
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return
                                        ListView(
                                          physics: ScrollPhysics(),
                                            shrinkWrap: true,
                                            children: snapshot.data!.docs.map((d1){
                                              return
                                                Padding(
                                                  padding:EdgeInsets.only(top:height/104.3),
                                                  child:
                                                  Material(
                                                    elevation: 15,
                                                    color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                    child:
                                                    AnimatedContainer(
                                                      decoration: BoxDecoration(
                                                          color:Colors.white,borderRadius: BorderRadius.circular(12)
                                                      ),
                                                      duration: const Duration(seconds: 1),
                                                      width:width/3.20,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(width:width/186.6),
                                                          Container(
                                                            width:width/7.77,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height:height/104.3),
                                                                Text('${d1['taskname']}',style: GoogleFonts.montserrat(
                                                                    color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                ),),
                                                                SizedBox(height:height/320),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                      ),),
                                                                      TextSpan(text:'${d1['deadlinedate']}',style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                      ),),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height:height/320),
                                                                RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(text: 'Due Time : ', style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                      ),),
                                                                      TextSpan(text:'${d1['deadlinetime']}',style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                      ),),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height:height/320),
                                                               d1["view"]==true ? RichText(
                                                                  text: TextSpan(
                                                                    children: [
                                                                      TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                      ),),
                                                                      TextSpan(text:'${d1['taskdescription']}',style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                      ),),
                                                                    ],
                                                                  ),
                                                                ) : SizedBox()
                                                              ],
                                                            ),
                                                          ),




                                                          SizedBox(width:width/100),
                                                          Container(
                                                            height:height/34.76,
                                                            width: width/14.35,
                                                            decoration: BoxDecoration(
                                                                color:Colors.red,borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            child: Center(child: Text(elapsedTime,style: GoogleFonts.montserrat(
                                                                color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                            ),)),
                                                          ),
                                                          SizedBox(width:width/100),
                                                          GestureDetector(
                                                              onTap: ()
                                                              {
                                                                startOrStop();
                                                                if(ck==true){
                                                                  setState(() {
                                                                    ck=false;
                                                                  });
                                                                }
                                                                else {
                                                                  setState(() {
                                                                    ck=true;
                                                                  });
                                                                }



                                                              },
                                                              child: ck == true ? Tooltip(
                                                                message: 'Start Timer',
                                                                child: Icon(
                                                                  Icons.play_circle,
                                                                  color: Colors.red,size:width/ 46.65,),
                                                              ) :Tooltip(
                                                                message: 'Stop Timer',
                                                                child: Icon(
                                                                  Icons.pause_circle,
                                                                  color: Colors.red,size:width/ 46.65,),
                                                              )

                                                          ),
                                                          SizedBox(width:width/100),

                                                          d1["status"]=="given"? Tooltip(
                                                            message: 'Start Task',
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                mytasktaken(d1.id);
                                                              },
                                                              child: Icon(
                                                                Icons.task,
                                                                color: Colors.blue,size: width/53.31,),
                                                            ),
                                                          ) :
                                                          d1["status"]=="taken"? Tooltip(
                                                            message: 'Task Done',
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                mytaskcomplete(d1.id);
                                                                timeupdate(d1.id);
                                                              },
                                                              child: Icon(
                                                                Icons.add_alert,
                                                                color: Colors.orange,size: width/53.31,),
                                                            ),
                                                          ) :
                                                          d1["status"]=="complete"? Tooltip(
                                                            message: "Already Done",
                                                            child: Icon(
                                                              Icons.verified_rounded,
                                                              color: Colors.green,size: width/53.31,),
                                                          ):SizedBox(),

                                                          SizedBox(width:width/100),
                                                          GestureDetector(
                                                            onTap:(){
                                                              setState(() {
                                                                if(d1['view'] == false)
                                                                { mytaskget(d1.id);}
                                                                else
                                                                {mytaskget2(d1.id);}
                                                              });
                                                            },
                                                            child:
                                                            d1["view"]==true ?
                                                            Tooltip(
                                                              message: 'Shrink',
                                                              child: Icon(
                                                                Icons.arrow_circle_up_outlined,
                                                                color: Colors.red,size: width/53.31,),
                                                            ):
                                                            Tooltip(
                                                              message: 'Expand',
                                                              child: Icon(
                                                                Icons.arrow_circle_down_outlined,
                                                                color: Colors.green,size: width/53.31,),
                                                            ),
                                                          ),
                                                        ],),
                                                    ),
                                                  ),
                                                );
                                            }).toList()
                                        );
                                    }
                                ),
                              ),
                              SizedBox(height:height/52.15),

                          ],),
                          SizedBox(width:width/62.2),
                          Container(height:height/1.89,child: VerticalDivider()),
                          SizedBox(width:width/62.2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:height/52.15),
                              Text('Allocated Task',style: GoogleFonts.montserrat(
                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                              SizedBox(height:height/347.66),
                              GestureDetector(
                                onTap: (){
                                  print(widget.id);
                                },
                                child: Text('23 December,Sunday',style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                ),),
                              ),
                              SizedBox(height:height/104.3),
                              Container(
                                width:width/3.20,

                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('Assignedtask').snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return ListView(
                                          physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          children: snapshot.data!.docs.map((d1){
                                            return
                                              Padding(
                                                padding: EdgeInsets.only(top:height/104.3),
                                                child:
                                                Material(
                                                  elevation: 15,
                                                  color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                  child:
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:Colors.white,borderRadius: BorderRadius.circular(12)
                                                    ),
                                                    width:width/3.20,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width:width/186.6),

                                                        Container(
                                                          width:width/7.77,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height:height/104.3),
                                                              Text('${d1['taskname']}',style: GoogleFonts.montserrat(
                                                                  color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                              ),),
                                                              SizedBox(height:height/320),

                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['deadlinedate']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),

                                                              SizedBox(height:height/320),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Due Time : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['deadlinetime']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height:height/320),
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Assigned From : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['taskfromid']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(height:height/320),
                                                              d1["view"]==true ?
                                                              RichText(
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                    ),),
                                                                    TextSpan(text:'${d1['taskdescription']}',style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                    ),),
                                                                  ],
                                                                ),
                                                              ):SizedBox(),

                                                              SizedBox(height:height/104.3),

                                                            ],
                                                          ),

                                                        ),




                                                        SizedBox(width:width/74.64),
                                                        Tooltip(
                                                          message: "See The Progress of Task",
                                                          child: Container(
                                                            height:height/34.76,
                                                            width: width/14.35,
                                                            decoration: BoxDecoration(
                                                                color:Colors.blue,borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            child: Center(child: Text('View Progress',style: GoogleFonts.montserrat(
                                                                color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                            ),)),
                                                          ),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        Tooltip(
                                                          message: "Delete The Task",
                                                          child: GestureDetector(onTap: (){
                                                            deletetask(d1.id);
                                                          },
                                                            child: Icon( Icons.delete_forever,
                                                              color: Colors.red,size:width/ 46.65,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        Tooltip(
                                                          message: "Delete The Task",
                                                          child: Icon(
                                                            Icons.verified_rounded,
                                                            color: Colors.green,size: width/53.31,),
                                                        ),
                                                        SizedBox(width:width/100),
                                                        GestureDetector(
                                                          onTap:(){
                                                            setState(() {
                                                              if(d1['view'] == false)
                                                              {
                                                                assignedtaskget(d1.id);
                                                              }
                                                              else
                                                              {
                                                                assignedtaskget2(d1.id);
                                                              }
                                                            });
                                                          },
                                                          child:
                                                          d1["view"]==true ?
                                                          Icon(
                                                            Icons.arrow_circle_up_outlined,
                                                            color: Colors.red,size: width/53.31,):
                                                          Icon(
                                                            Icons.arrow_circle_down_outlined,
                                                            color: Colors.green,size: width/53.31,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                          }
                                          ).toList()
                                      );
                                    }
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }












  String myname="";
  String myid="";
  String catcat="";
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

  Future deletetask(String docid)  async {
    await _firebase
        .collection('User')
        .doc(widget.id)
        .collection('Assignedtask')
        .doc(docid.toString())
        .delete();
  }

  mytasktaken(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "status":"taken"
    });
  }
  mytaskcomplete(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "status":"complete"
    });
  }

  timeupdate(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "submittime": "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}",
    });
  }

  get12() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      myname=val!["name1"];
      myid=val["username"];
    });
  }
  getcat() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      catcat=val!["category"];
    });
  }

  Future Uploadtaskfromid() async{
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':deadlinetimefield1.text,
      'checktime':"${deadlinedatefield.text} ${deadlinetimefield.text}",
      'assignedtoname':empnamefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":''

    });
  }
  Future Uploadtasktoid() async{
    String userid="";
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('name1', isEqualTo:  empnamefield.text)
        .where('username', isEqualTo: empidfield.text )
        .get();
    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      for (int i = 0; i < documents.length; i++) {
        userid = documents[i].id;
      }
    }
    await _firebase.collection('User').doc(userid).collection("MyTasks").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':deadlinetimefield1.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
    'checktime':"${deadlinedatefield.text} ${deadlinetimefield.text}",

    });
    clearall();
    Navigator.pop(context);
  }

  mytaskget(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "view":true

    });
    }
  mytaskget2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "view":false

    });
    }

  assignedtaskget(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("Assignedtask").doc(thisdocid).update({
      "view":true

    });
  }
  assignedtaskget2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("Assignedtask").doc(thisdocid).update({
      "view":false

    });
  }

  Future Uploadtasktoid2() async{
    String userid="";
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('name1', isEqualTo:  empnamefield.text)
        .where('username', isEqualTo: empidfield.text )
        .get();
    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      for (int i = 0; i < documents.length; i++) {
        userid = documents[i].id;
      }
    }
    await _firebase.collection('All').doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'chkti':deadlinetimefield1.text,
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
    

    });

  }
  Future Uploadtasktoid3() async{
    String userid="";
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('name1', isEqualTo:  empnamefield.text)
        .where('username', isEqualTo: empidfield.text )
        .get();
    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      for (int i = 0; i < documents.length; i++) {
        userid = documents[i].id;
      }
    }
    await _firebase.collection('User').doc(userid).collection("Assignedtask").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':deadlinetimefield1.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',

    });
  }

  getid() async {
    final docemt = await FirebaseFirestore.instance.collection('User').get();
    for(int i =0;i<=docemt.docs.length;i++){
      if(docemt.docs[i]['name']==empnamefield.text){
        setState(() {
          empidfield.text=docemt.docs[i]["empidfield"].toString();
        });
      }
    }
  }
  clearall(){
    tasknamefield.clear();
    empnamefield.clear();
    empidfield.clear();
    deadlinedatefield.clear();
    deadlinetimefield.clear();
    taskdescriptionfield.clear();
  }

  startOrStop() {
    if(startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }
  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }
  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }
  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }
  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

}


