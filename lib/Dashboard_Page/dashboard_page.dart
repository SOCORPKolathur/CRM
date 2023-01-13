import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:random_string/random_string.dart';


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
final TextEditingController deadlinedatefield1=TextEditingController();
final TextEditingController empnamefield=TextEditingController();
TextEditingController empidfield=TextEditingController();
TextEditingController projectnamefield=TextEditingController();
bool k=false;



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
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());


  var elapsedTime = List<String>.generate(10, (n) => '');
  var pauseicon = List<Icon>.generate(10, (n) => Icon(Icons.pause_circle_filled,color: Colors.red,));
  var playicon = List<Icon>.generate(10, (n) => Icon(Icons.play_circle,color: Colors.red,));
  var checkicon = List<bool>.generate(10, (n) => false);
  var expand = List<bool>.generate(100, (n) => false);
  var Expandprocess = List<bool>.generate(100, (n) => false);

  bool cmk= true;
  late final Duration? duration;
  late final List<ShakeConstant> shakeList;
  var startStop = List<bool>.generate(10, (n) => true);
  var watch = List<Stopwatch>.generate(10, (n) => Stopwatch());
  late  Timer timer;
  final _streamDuration = List<StreamDuration>.generate(10, (n) => StreamDuration( Duration(days: 5),));

  updateTime(Timer timer,index) {
    if (watch[index].isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime[index] = transformMilliSeconds(watch[index].elapsedMilliseconds);
      });
    }
  }
  bool notice = false;
  @override
  Widget build(BuildContext context) {
    final Focus1 = FocusNode();
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    ShowAlertDialog(){
     AlertDialog alert=AlertDialog(
       backgroundColor: Colors.transparent,
         content:Container(
           height: height/1.25,
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
                           child: GestureDetector(
                             onTap: (){
                               get12();
                               TaskAll();
                               Uploadtaskfromid();
                               _showMyDialog();

                             },
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
                                   Text('Done',style: GoogleFonts.montserrat(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white,
                                       fontSize:width/100
                                   ),),
                                 ],),
                             ),
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
                                         return  DropdownSearch<String>(
                                           dialogMaxWidth:100,
                                           maxHeight: 500,
                                           isFilteredOnline: true,
                                           dropdownSearchDecoration: InputDecoration(
                                             contentPadding: EdgeInsets.only(bottom: 10),
                                               hintText: 'Employee Name',
                                               border: InputBorder.none,
                                               helperStyle: GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/10,
                                                 fontWeight: FontWeight.w500,),
                                               hintStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/10,
                                                 fontWeight: FontWeight.w500,),
                                               labelStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/10,
                                                 fontWeight: FontWeight.w500,),
                                               counterStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/10,
                                                 fontWeight: FontWeight.w500,),
                                               floatingLabelStyle:  GoogleFonts.montserrat(
                                                 color: Colors.black,
                                                 fontSize: width/10,
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
                                     child:
                                     TextFormField(
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
                                             String formattedDate1 = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                             print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                             //You can format date as per your need

                                             setState(() {
                                               deadlinedatefield.text = formattedDate; //set foratted date to TextField value.
                                               deadlinedatefield1.text = formattedDate1; //set foratted date to TextField value.
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
                                           String formattedTime1 = "${pickedTime.hour}:${pickedTime.minute}:00";
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
                     Row(
                       children: [
                         Container(
                           width:width/4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Project Name',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                       stream: FirebaseFirestore.instance.collection('projects').snapshots(),
                                       builder: (context, snapshot){
                                         if (!snapshot.hasData) {
                                           return const CupertinoActivityIndicator();
                                         }
                                         return DropdownSearch<String>(

                                           isFilteredOnline: true,
                                           dropdownSearchDecoration: InputDecoration(
                                               contentPadding: EdgeInsets.only(bottom: 10),
                                               hintText: 'Project Name',
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
                                             return data["name"].toString();
                                           }).toList().cast<String>(),
                                           onChanged: (value){
                                             getempid();
                                             setState(() {
                                               projectnamefield.text= value.toString();
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
   Allnoticeshow(){
     AlertDialog alert=AlertDialog(
         content:
         Padding(
           padding: EdgeInsets.only(left: 10,bottom: 100),
           child: Container(
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
             ),
             width:800,
             height:500,
             child:Column(
               children: [
                 Container(
                   width:800,
                   height:50,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
                     color: Color(0xff5F67EC),
                   ),
                   child: Center(child: Text('All Circulars',style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/93.3,))),
                 ),
                 SizedBox(height:10),
                 Container(
                   width:800,
                   height:440,
                   child:
                   StreamBuilder<QuerySnapshot>(
                     stream: FirebaseFirestore.instance.collection('allnotice').snapshots(),
                     builder: (context, snapshot) {
                       if (!snapshot.hasData) {
                         return Center(child:Lottie.asset("assets/loading.json"),);
                       }
                       return ListView.builder(
                           itemCount: snapshot.data!.docs.length,
                           itemBuilder: (context, index) {
                             return
                               Padding(
                                 padding:EdgeInsets.only(top:8.0),
                                 child: Material(
                                   elevation: 15,
                                   borderRadius: BorderRadius.circular(15),
                                   child:
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),

                                     ),
                                     width:800,
                                     height: 40,
                                     child:
                                     Row(
                                       children: [
                                         SizedBox(width:width/186.6),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             SizedBox(height:height/173.83),
                                             Text(snapshot.data!.docs[index]['message'],overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                                 color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                             ),),
                                             SizedBox(height:height/347.66),



                                           ],),

                                       ],),
                                   ),
                                 ),
                               );
                           });
                     },),
                 ),

               ],),

           ),
         )
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

    final ShakeAnimationController _shakeAnimationController =
    ShakeAnimationController();
    return Scaffold(
      body: SingleChildScrollView(
        child: ShowUpAnimation(
        curve: Curves.fastOutSlowIn,
        direction: Direction.horizontal,
        delayStart: Duration(milliseconds: 200),
          child:
          Padding(
          padding: EdgeInsets.only(left:width/62.2,top:height/41.72,right:width/62.2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height:height/1.14,
            width:width/1.24,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    catcat=='Employee'?
                    Material(
                      elevation:15,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(20)
                        ),
                        width: width/1.33,
                        height: 136,
                        child: Row(
                          children: [
                            SizedBox(width:width/62.2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(onTap:(){

                                },
                                  child: Container(
                                    width:100,
                                    height:100,
                                    child:
                                    const MultiCircularSlider(
                                      size: 50,
                                      progressBarType: MultiCircularSliderType.circular, // the type of indictor you want circular or linear
                                      values: [2.0,2.0,2.0,],
                                      colors: [Color(0xFFFD1960), Color(0xFF29D3E8), Color(0xFF18C737), Color(0xFFFFCC05)],
                                      showTotalPercentage: true, // to display total percentage in center
                                      label: 'This is label text', // label to display below percentage
                                      animationDuration: Duration(seconds:1), // duration of animation
                                      animationCurve: Curves.decelerate, // smoothness of animation
                                      innerIcon: Icon(Icons.integration_instructions), // to display some icon related to text
                                      innerWidget: Text('96%'), // to show custom innerWidget (to display set showTotalPercentage to false)
                                      trackColor: Colors.grey, // to change color of track
                                      progressBarWidth: 5, // to change width of progressBar
                                      trackWidth:10, // to change width of track
                                      labelTextStyle: TextStyle(), // to change TextStyle of label
                                      percentageTextStyle: TextStyle(color: Colors.red), // to change TextStyle of percentage
                                    ),
                                  ),
                                )
                              ],),
                            SizedBox(width:width/37.32),
                            Container(

                              height:100,
                              width:650,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height:height/52.15),
                                  Text('Important Notice',style: GoogleFonts.montserrat(
                                      fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                                  SizedBox(height:height/104.3),
                                  Container(
                                    width: 650,


                                    child: Row(
                                      children: [
                                      Container(
                                        width:600,
                                        height: 40,
                                        child:
                                        StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance.collection('allnotice').orderBy('sendtime',descending: true).limit(1).snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(child:Lottie.asset("assets/loading.json"),);
                                            }
                                            return ListView.builder(
                                                itemCount: snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  return
                                                    Material(
                                                      elevation: 15,
                                                      borderRadius: BorderRadius.circular(15),
                                                      child:
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8),

                                                        ),
                                                        width:600,
                                                        height: 40,
                                                        child:
                                                        Row(
                                                          children: [
                                                            SizedBox(width:width/186.6),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height:height/173.83),
                                                                Text(snapshot.data!.docs[index]['message'],overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                                                ),),
                                                                SizedBox(height:height/347.66),



                                                              ],),

                                                          ],),
                                                      ),
                                                    );
                                                });
                                          },),
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            print(notice);
                                            if(notice==false)
                                            {
                                              setState(() {
                                                notice = true;
                                                print(notice);
                                              }
                                              );
                                            }
                                            else
                                            {
                                              setState(() {
                                                print('false');
                                                notice = false;
                                              }
                                              );
                                            }

                                      },
                                          child:
                                          notice == false?
                                          Icon(Icons.arrow_circle_down,size:width/46.65):
                                          Icon(Icons.arrow_circle_up,size:width/46.65),
                                      ),
                                    ],),
                                  ),

                                ],),
                            ),
                          ],
                        ),

                      ),
                    )
                        :
                    catcat=='HR'?
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
                                  Container(
                                    width:width/3,
                                    height:height/18,
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('allnotice').orderBy('sendtime',descending: true).limit(1).snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child:Lottie.asset("assets/loading.json"),);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return
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
                                                            Text(snapshot.data!.docs[index]['message'],style: GoogleFonts.inter(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                                            ),),
                                                            SizedBox(height:height/347.66),



                                                          ],),
                                                        SizedBox(width:width/7.17),
                                                        GestureDetector(
                                                            onTap: (){
                                                              Allnoticeshow();
                                                            },
                                                            child: Icon(Icons.arrow_circle_right,size:width/46.65)),

                                                      ],),
                                                  ),
                                                );
                                            });
                                      },),
                                  ),

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
                    )
                        :
                    catcat=='Admin'?
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
                                  Container(
                                    width:width/3,
                                    height:height/18,
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('allnotice').orderBy('sendtime',descending: true).limit(1).snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child:Lottie.asset("assets/loading.json"),);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return
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
                                                            Text(snapshot.data!.docs[index]['message'],style: GoogleFonts.inter(
                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                                            ),),
                                                            SizedBox(height:height/347.66),



                                                          ],),
                                                        SizedBox(width:width/7.17),
                                                        Icon(Icons.arrow_circle_right,size:width/46.65),

                                                      ],),
                                                  ),
                                                );
                                            });
                                      },),
                                  ),

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
                    )
                        :
                    SizedBox(),



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
                                    /*Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                    ),),*/
                                      SizedBox(height:height/104.3),
                                      Container(
                                        width:width/3.20,
                                        child:
                                        StreamBuilder<QuerySnapshot>(
                                          stream:FirebaseFirestore.instance
                                              .collection('User')
                                              .doc(widget.id)
                                              .collection('MyTasks')
                                              .where('status',isNotEqualTo: 'complete')
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(child:Lottie.asset("assets/loadingall.json"),);
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                                itemCount: snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                    return
                                                      snapshot.data!.docs[index]['query'] == 'normal'?
                                                      Padding(
                                                        padding:EdgeInsets.only(top:height/104.3),
                                                        child:
                                                        GestureDetector(onTap: (){
                                                          if (_shakeAnimationController.animationRunging) {
                                                            _shakeAnimationController.stop();
                                                          } else {
                                                            _shakeAnimationController.start(shakeCount: 1);
                                                          }
                                                        },
                                                          child: Material(
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
                                                                        Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                        ),),
                                                                        SizedBox(height:height/320),
                                                                        RichText(
                                                                          text: TextSpan(
                                                                            children: [
                                                                              TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                              ),),
                                                                              TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                              TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                              ),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(height:height/320),
                                                                        expand[index]==true ? RichText(
                                                                          text: TextSpan(
                                                                            children: [
                                                                              TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                              ),),
                                                                              TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                              TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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
                                                                  SlideCountdown(
                                                                    // This duration no effect if you customize stream duration
                                                                    streamDuration: _streamDuration[index],
                                                                    duration: Duration(days: index+1),
                                                                    countUp: true,
                                                                    infinityCountUp: true,

                                                                  ),
                                                                  SizedBox(width:width/100),
                                                                  checkicon[index] == true ?  Tooltip(
                                                                    message: 'Start Timer',
                                                                    child:  GestureDetector(
                                                                        onTap: (){

                                                                          setState(() {
                                                                            checkicon[index]=false;
                                                                            _streamDuration[index].resume();
                                                                          });
                                                                          print(checkicon[index]);

                                                                        },

                                                                        child: playicon[index]),
                                                                  ) :Tooltip(
                                                                    message: 'Stop Timer',
                                                                    child: GestureDetector(
                                                                        onTap: (){
                                                                          setState(() {
                                                                            checkicon[index]=true;
                                                                            _streamDuration[index].pause();
                                                                          });

                                                                          print(checkicon[index]);
                                                                        },
                                                                        child: pauseicon[index]),
                                                                  ),
                                                                  SizedBox(width:width/100),
                                                                  snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                                    message: 'Start Task',
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        mytasktaken(snapshot.data!.docs[index].id);
                                                                        mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index]["taskid"]);
                                                                      },
                                                                      child: Icon(
                                                                        Icons.task,
                                                                        color: Colors.blue,size: width/53.31,),
                                                                    ),
                                                                  ) :
                                                                  snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                                    message: 'Task Done',
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        mytaskcomplete(snapshot.data!.docs[index].id);
                                                                        mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                        timeupdate(snapshot.data!.docs[index].id);
                                                                        print('zzzzzzzzzzzzzzzzzzzzzzzz');
                                                                        check(snapshot.data!.docs[index].id);

                                                                      },
                                                                      child: Icon(
                                                                        Icons.add_alert,
                                                                        color: Colors.orange,size: width/53.31,),
                                                                    ),
                                                                  ) :
                                                                  snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                                    message: "Already Done",
                                                                    child: Icon(
                                                                      Icons.verified_rounded,
                                                                      color: Colors.green,size: width/53.31,),
                                                                  ):SizedBox(),
                                                                  SizedBox(width:width/100),
                                                                  GestureDetector(
                                                                    onTap:(){
                                                                        if(expand[index] == true)
                                                                        {
                                                                          print("true yes");
                                                                          setState(() {
                                                                            expand[index] = false;
                                                                        }
                                                                        );
                                                                        }
                                                                        else
                                                                        {
                                                                          print("false no");
                                                                        setState(() {
                                                                        expand[index]=true;
                                                                        }
                                                                        );}

                                                                      print("Sri ni");
                                                                      print(expand[index]);
                                                                    },
                                                                    child:
                                                                    expand[index]==true ?
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
                                                        ),
                                                      ):
                                                      snapshot.data!.docs[index]['query'] == 'shake'?
                                                      GestureDetector(
                                                        onTap: (){
                                                        see(snapshot.data!.docs[index].id);
                                                      },
                                                        child: ShakeWidget(
                                                          duration: Duration(seconds: 3),
                                                          shakeConstant: ShakeHorizontalConstant1(),
                                                          autoPlay: true,
                                                          enableWebMouseHover: true,
                                                          child:
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
                                                                    color:Color(0xffffd1d1),borderRadius: BorderRadius.circular(12)
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
                                                                          Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                          ),),
                                                                          SizedBox(height:height/320),
                                                                          RichText(
                                                                            text: TextSpan(
                                                                              children: [
                                                                                TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                                ),),
                                                                                TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                                TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                                ),),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(height:height/320),
                                                                          expand[index]==true ? RichText(
                                                                            text: TextSpan(
                                                                              children: [
                                                                                TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                                ),),
                                                                                TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                                TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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

                                                                    SlideCountdown(
                                                                      // This duration no effect if you customize stream duration
                                                                      streamDuration: _streamDuration[index],
                                                                      duration: Duration(days: index+1),
                                                                      countUp: true,
                                                                      infinityCountUp: true,

                                                                    ),
                                                                    SizedBox(width:width/100),
                                                                    checkicon[index] == true ?  Tooltip(
                                                                      message: 'Start Timer',
                                                                      child:  GestureDetector(
                                                                          onTap: (){

                                                                            setState(() {
                                                                              checkicon[index]=false;
                                                                              _streamDuration[index].resume();
                                                                            });
                                                                            print(checkicon[index]);

                                                                          },

                                                                          child: playicon[index]),


                                                                    ) :Tooltip(
                                                                      message: 'Stop Timer',
                                                                      child: GestureDetector(
                                                                          onTap: (){
                                                                            setState(() {
                                                                              checkicon[index]=true;
                                                                              _streamDuration[index].pause();
                                                                            });

                                                                            print(checkicon[index]);
                                                                          },
                                                                          child: pauseicon[index]),
                                                                    ),






                                                                    SizedBox(width:width/100),




                                                                    snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                                      message: 'Start Task',
                                                                      child: GestureDetector(
                                                                        onTap: (){
                                                                          mytasktaken(snapshot.data!.docs[index].id);
                                                                          mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index]["taskid"]);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.task,
                                                                          color: Colors.blue,size: width/53.31,),
                                                                      ),
                                                                    ) :
                                                                    snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                                      message: 'Task Done',
                                                                      child: GestureDetector(
                                                                        onTap: (){
                                                                          mytaskcomplete(snapshot.data!.docs[index].id);
                                                                          mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                          timeupdate(snapshot.data!.docs[index].id);
                                                                          check(snapshot.data!.docs[index].id);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.add_alert,
                                                                          color: Colors.orange,size: width/53.31,),
                                                                      ),
                                                                    ) :
                                                                    snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                                      message: "Already Done",
                                                                      child: Icon(
                                                                        Icons.verified_rounded,
                                                                        color: Colors.green,size: width/53.31,),
                                                                    ):SizedBox(),


                                                                    SizedBox(width:width/100),
                                                                    GestureDetector(
                                                                      onTap:(){
                                                                        if(expand[index] == true)
                                                                        {
                                                                          print("true yes");
                                                                          setState(() {
                                                                            expand[index] = false;
                                                                          }
                                                                          );
                                                                        }
                                                                        else
                                                                        {
                                                                          print("false no");
                                                                          setState(() {
                                                                            expand[index]=true;
                                                                          }
                                                                          );}

                                                                        print("Sri ni");
                                                                        print(expand[index]);
                                                                      },
                                                                      child:
                                                                      expand[index]==true ?
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


                                                          ),
                                                        ),
                                                      ):
                                                      snapshot.data!.docs[index]['query'] == 'see'?
                                                      Padding(
                                                        padding:EdgeInsets.only(top:height/104.3),
                                                        child:
                                                        GestureDetector(onTap: (){
                                                          if (_shakeAnimationController.animationRunging) {
                                                            _shakeAnimationController.stop();
                                                          } else {
                                                            _shakeAnimationController.start(shakeCount: 1);
                                                          }
                                                        },
                                                          child: Material(
                                                            elevation: 15,
                                                            color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                            child:
                                                            AnimatedContainer(
                                                              duration: const Duration(seconds: 10),
                                                              decoration: BoxDecoration(
                                                                  color:Color(0xffffe3e3),borderRadius: BorderRadius.circular(12)
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
                                                                        Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                        ),),
                                                                        SizedBox(height:height/320),
                                                                        RichText(
                                                                          text: TextSpan(
                                                                            children: [
                                                                              TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                              ),),
                                                                              TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                              TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                              ),),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(height:height/320),
                                                                        expand[index]==true ? RichText(
                                                                          text: TextSpan(
                                                                            children: [
                                                                              TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                                  color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                              ),),
                                                                              TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                              TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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

                                                                  SlideCountdown(
                                                                    // This duration no effect if you customize stream duration
                                                                    streamDuration: _streamDuration[index],
                                                                    duration: Duration(days: index+1),
                                                                    countUp: true,
                                                                    infinityCountUp: true,

                                                                  ),
                                                                  SizedBox(width:width/100),
                                                                  checkicon[index] == true ?  Tooltip(
                                                                    message: 'Start Timer',
                                                                    child:  GestureDetector(
                                                                        onTap: (){

                                                                          setState(() {
                                                                            checkicon[index]=false;
                                                                            _streamDuration[index].resume();
                                                                          });
                                                                          print(checkicon[index]);

                                                                        },

                                                                        child: playicon[index]),


                                                                  ) :Tooltip(
                                                                    message: 'Stop Timer',
                                                                    child: GestureDetector(
                                                                        onTap: (){
                                                                          setState(() {
                                                                            checkicon[index]=true;
                                                                            _streamDuration[index].pause();
                                                                          });

                                                                          print(checkicon[index]);
                                                                        },
                                                                        child: pauseicon[index]),
                                                                  ),






                                                                  SizedBox(width:width/100),




                                                                  snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                                    message: 'Start Task',
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        mytasktaken(snapshot.data!.docs[index].id);
                                                                        mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index].id);
                                                                      },
                                                                      child: Icon(
                                                                        Icons.task,
                                                                        color: Colors.blue,size: width/53.31,),
                                                                    ),
                                                                  ) :
                                                                  snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                                    message: 'Task Done',
                                                                    child: GestureDetector(
                                                                      onTap: (){
                                                                        mytaskcomplete(snapshot.data!.docs[index].id);
                                                                        mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                        timeupdate(snapshot.data!.docs[index].id);
                                                                        check(snapshot.data!.docs[index].id);
                                                                      },
                                                                      child: Icon(
                                                                        Icons.add_alert,
                                                                        color: Colors.orange,size: width/53.31,),
                                                                    ),
                                                                  ) :
                                                                  snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                                    message: "Already Done",
                                                                    child: Icon(
                                                                      Icons.verified_rounded,
                                                                      color: Colors.green,size: width/53.31,),
                                                                  ):SizedBox(),


                                                                  SizedBox(width:width/100),
                                                                  GestureDetector(
                                                                    onTap:(){
                                                                      if(expand[index] == true)
                                                                      {
                                                                        print("true yes");
                                                                        setState(() {
                                                                          expand[index] = false;
                                                                        }
                                                                        );
                                                                      }
                                                                      else
                                                                      {
                                                                        print("false no");
                                                                        setState(() {
                                                                          expand[index]=true;
                                                                        }
                                                                        );}

                                                                      print("Sri ni");
                                                                      print(expand[index]);
                                                                    },
                                                                    child:
                                                                    expand[index]==true ?
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
                                                        ),


                                                      ):SizedBox();
                                                });
                                          },)


                                      ),
                                      SizedBox(height:height/50,),
                                  ],
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(left:width/62.2,top:height/1.52),
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
                                  /*Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                      color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                  ),),*/
                                  SizedBox(height:height/104.3),
                                  Container(
                                    width:width/3.20,

                                    child:
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('AssignedTasks').snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child:Lottie.asset("assets/loadingall.json"),);
                                        }
                                        return ListView.builder(
                                            shrinkWrap: true,

                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
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
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(width:width/186.6),
                                                              Container(
                                                                width:width/7.77,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    SizedBox(height:height/104.3),
                                                                    Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                    ),),
                                                                    SizedBox(height:height/320),
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                          TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
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
                                                                          TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(height:height/320),
                                                                    expand[index]==true ?
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ):SizedBox(),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(width:width/74.64),
                                                              GestureDetector(
                                                                onTap:(){
                                                                  if(Expandprocess[index] == true)
                                                                  {
                                                                    setState(() {
                                                                      Expandprocess[index] = false;
                                                                    }
                                                                    );
                                                                  }
                                                                  else
                                                                  {
                                                                   setState(()
                                                                   {
                                                                      Expandprocess[index]=true;
                                                                    }
                                                                    );} },
                                                                  child: Tooltip(
                                                                      message: "See The Progress of Task",
                                                                      child: Container(
                                                                      height:height/34.76,
                                                                      width: width/14.35,
                                                                      decoration: BoxDecoration(
                                                                      color:Colors.blue,borderRadius: BorderRadius.circular(20)
                                                                  ),
                                                                  child: Center(child: Text('View Progress',style:
                                                                 GoogleFonts.montserrat(
                                                                        color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                                    ),)),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width:width/100),
                                                              Tooltip(
                                                                message: "Delete The Task",
                                                                child: GestureDetector(onTap: (){
                                                                  DeleteTask(snapshot.data!.docs[index].id,snapshot.data!.docs[index]["tasktodocid"],snapshot.data!.docs[index]["taskid"]);
                                                                },
                                                                  child: Icon( Icons.delete_forever,
                                                                    color: Colors.red,size:width/ 46.65,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width:width/100),
                                                              Tooltip(
                                                                message: "Details",
                                                                child: GestureDetector(onTap: (){
                                                                  shake(snapshot.data!.docs[index]["tasktodocid"],snapshot.data!.docs[index]["taskid"]);
                                                                  shake1(snapshot.data!.docs[index].id);
                                                                },
                                                                  child: Container(
                                                                      width:width/74.64,
                                                                      height:height/41.72,
                                                                      child: Image.asset('assets/pointerp.png',)),
                                                                ),
                                                              ),
                                                              SizedBox(width:width/100),
                                                              GestureDetector(
                                                                onTap:(){
                                                                  if(expand[index] == true)
                                                                  {
                                                                    print("true yes");
                                                                    setState(() {
                                                                      expand[index] = false;
                                                                    }
                                                                    );
                                                                  }
                                                                  else
                                                                  {
                                                                    print("false no");
                                                                    setState(() {
                                                                      expand[index]=true;
                                                                    }
                                                                    );}

                                                                  print("Sri ni");
                                                                  print(expand[index]);
                                                                },
                                                                child:
                                                                expand[index]==true ?
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
                                                          SizedBox(height: 10,),
                                                          Expandprocess[index]==true?
                                                          snapshot.data!.docs[index]['status'] == 'given'?
                                                          Container(
                                                            width:500,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('Given',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ),),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.green,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.circle_sharp,color: Colors.grey,size:15),
                                                                SizedBox(width:5),
                                                                Text('taken',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                )),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.grey,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.circle_sharp,color: Colors.grey,size:15),
                                                                SizedBox(width:5),
                                                                Text('Complete',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ))

                                                              ],
                                                            ),
                                                          )
                                                              :
                                                          snapshot.data!.docs[index]['status'] == 'taken'?
                                                          Container(
                                                            width:500,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('Given',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ),),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.green,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('taken',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                )),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.grey,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.circle_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('Complete',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ))

                                                              ],
                                                            ),
                                                          )
                                                              :
                                                          snapshot.data!.docs[index]['status'] == 'complete'?
                                                          Container(
                                                            width:500,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('Given',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ),),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.green,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('taken',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                )),
                                                                SizedBox(width:10),
                                                                Container(
                                                                  width:10,
                                                                  child: Divider(
                                                                    color: Colors.green,
                                                                    thickness: 2,
                                                                  ),
                                                                ),
                                                                SizedBox(width:10),
                                                                Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                SizedBox(width:5),
                                                                Text('Complete',style: GoogleFonts.montserrat(
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: 14,
                                                                    color: Colors.black
                                                                ))

                                                              ],
                                                            ),
                                                          )
                                                              :
                                                          SizedBox():SizedBox(),
                                                          SizedBox(height:height/104.3),

                                                        ],
                                                      ),
                                                    ),

                                                  ),
                                                );

                                            });
                                      },)

                                  ),
                                ],),
                            ],
                          ),
                        ),
                      ),
                    )
                        :
                    catcat=='HR'?
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
                                /*Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                    color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                ),),*/
                                  SizedBox(height:height/104.3),


                                  Container(
                                    width:width/3.20,

                                    child:
                                    StreamBuilder<QuerySnapshot>(
                                      stream:FirebaseFirestore.instance
                                          .collection('User')
                                          .doc(widget.id)
                                          .collection('MyTasks')
                                          .where('status',isNotEqualTo: 'complete')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child:Lottie.asset("assets/loadingall.json"),);
                                        }
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return
                                                snapshot.data!.docs[index]['query'] == 'normal'?
                                                Padding(
                                                  padding:EdgeInsets.only(top:height/104.3),
                                                  child:
                                                  GestureDetector(onTap: (){
                                                    if (_shakeAnimationController.animationRunging) {
                                                      _shakeAnimationController.stop();
                                                    } else {
                                                      _shakeAnimationController.start(shakeCount: 1);
                                                    }
                                                  },
                                                    child: Material(
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
                                                                  Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                      color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                  ),),
                                                                  SizedBox(height:height/320),
                                                                  RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                        ),),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:height/320),
                                                                  expand[index]==true ? RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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
                                                            SlideCountdown(
                                                              // This duration no effect if you customize stream duration
                                                              streamDuration: _streamDuration[index],
                                                              duration: Duration(days: index+1),
                                                              countUp: true,
                                                              infinityCountUp: true,

                                                            ),
                                                            SizedBox(width:width/100),
                                                            checkicon[index] == true ?  Tooltip(
                                                              message: 'Start Timer',
                                                              child:  GestureDetector(
                                                                  onTap: (){

                                                                    setState(() {
                                                                      checkicon[index]=false;
                                                                      _streamDuration[index].resume();
                                                                    });
                                                                    print(checkicon[index]);

                                                                  },

                                                                  child: playicon[index]),


                                                            ) :Tooltip(
                                                              message: 'Stop Timer',
                                                              child: GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      checkicon[index]=true;
                                                                      _streamDuration[index].pause();
                                                                    });

                                                                    print(checkicon[index]);
                                                                  },
                                                                  child: pauseicon[index]),
                                                            ),
                                                            SizedBox(width:width/100),

                                                            snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                              message: 'Start Task',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  mytasktaken(snapshot.data!.docs[index].id);
                                                                  mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index].id);
                                                                },
                                                                child: Icon(
                                                                  Icons.task,
                                                                  color: Colors.blue,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                              message: 'Task Done',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  print('firest');
                                                                  mytaskcomplete(snapshot.data!.docs[index].id);
                                                                  mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                  timeupdate(snapshot.data!.docs[index].id);
                                                                  print('second');
                                                                  check(snapshot.data!.docs[index].id);
                                                                  print('third');
                                                                  check(snapshot.data!.docs[index].id);
                                                                },
                                                                child: Icon(
                                                                  Icons.add_alert,
                                                                  color: Colors.orange,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                              message: "Already Done",
                                                              child: Icon(
                                                                Icons.verified_rounded,
                                                                color: Colors.green,size: width/53.31,),
                                                            ):SizedBox(),

                                                            SizedBox(width:width/100),
                                                            GestureDetector(
                                                              onTap:(){
                                                                if(expand[index] == true)
                                                                {
                                                                  print("true yes");
                                                                  setState(() {
                                                                    expand[index] = false;
                                                                  }
                                                                  );
                                                                }
                                                                else
                                                                {
                                                                  print("false no");
                                                                  setState(() {
                                                                    expand[index]=true;
                                                                  }
                                                                  );}

                                                                print("Sri ni");
                                                                print(expand[index]);
                                                              },
                                                              child:
                                                              expand[index]==true ?
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
                                                  ),
                                                ):
                                                snapshot.data!.docs[index]['query'] == 'shake'?
                                                GestureDetector(
                                                  onTap: (){
                                                    see(snapshot.data!.docs[index].id);
                                                  },
                                                  child: ShakeWidget(
                                                    duration: Duration(seconds: 3),
                                                    shakeConstant: ShakeHorizontalConstant1(),
                                                    autoPlay: true,
                                                    enableWebMouseHover: true,
                                                    child:
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
                                                              color:Color(0xffffd1d1),borderRadius: BorderRadius.circular(12)
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
                                                                    Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                        color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                    ),),
                                                                    SizedBox(height:height/320),
                                                                    RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                          TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                          ),),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(height:height/320),
                                                                    expand[index]==true ? RichText(
                                                                      text: TextSpan(
                                                                        children: [
                                                                          TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                          TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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

                                                              SlideCountdown(
                                                                // This duration no effect if you customize stream duration
                                                                streamDuration: _streamDuration[index],
                                                                duration: Duration(days: index+1),
                                                                countUp: true,
                                                                infinityCountUp: true,

                                                              ),
                                                              SizedBox(width:width/100),




                                                              checkicon[index] == true ?  Tooltip(
                                                                message: 'Start Timer',
                                                                child:  GestureDetector(
                                                                    onTap: (){

                                                                      setState(() {
                                                                        checkicon[index]=false;
                                                                        _streamDuration[index].resume();
                                                                      });
                                                                      print(checkicon[index]);

                                                                    },

                                                                    child: playicon[index]),


                                                              ) :Tooltip(
                                                                message: 'Stop Timer',
                                                                child: GestureDetector(
                                                                    onTap: (){
                                                                      setState(() {
                                                                        checkicon[index]=true;
                                                                        _streamDuration[index].pause();
                                                                      });

                                                                      print(checkicon[index]);
                                                                    },
                                                                    child: pauseicon[index]),
                                                              ),






                                                              SizedBox(width:width/100),




                                                              snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                                message: 'Start Task',
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    mytasktaken(snapshot.data!.docs[index].id);
                                                                    mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index].id);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.task,
                                                                    color: Colors.blue,size: width/53.31,),
                                                                ),
                                                              ) :
                                                              snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                                message: 'Task Done',
                                                                child: GestureDetector(
                                                                  onTap: (){
                                                                    print('firest');
                                                                    mytaskcomplete(snapshot.data!.docs[index].id);
                                                                    mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                    timeupdate(snapshot.data!.docs[index].id);
                                                                    print('second');
                                                                    check(snapshot.data!.docs[index].id);
                                                                    print('third');
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add_alert,
                                                                    color: Colors.orange,size: width/53.31,),
                                                                ),
                                                              ) :
                                                              snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                                message: "Already Done",
                                                                child: Icon(
                                                                  Icons.verified_rounded,
                                                                  color: Colors.green,size: width/53.31,),
                                                              ):SizedBox(),


                                                              SizedBox(width:width/100),
                                                              GestureDetector(
                                                                onTap:(){
                                                                  if(expand[index] == true)
                                                                  {
                                                                    print("true yes");
                                                                    setState(() {
                                                                      expand[index] = false;
                                                                    }
                                                                    );
                                                                  }
                                                                  else
                                                                  {
                                                                    print("false no");
                                                                    setState(() {
                                                                      expand[index]=true;
                                                                    }
                                                                    );}

                                                                  print("Sri ni");
                                                                  print(expand[index]);
                                                                },
                                                                child:
                                                                expand[index]==true ?
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


                                                    ),
                                                  ),
                                                ):
                                                snapshot.data!.docs[index]['query'] == 'see'?
                                                Padding(
                                                  padding:EdgeInsets.only(top:height/104.3),
                                                  child:
                                                  GestureDetector(onTap: (){
                                                    if (_shakeAnimationController.animationRunging) {
                                                      _shakeAnimationController.stop();
                                                    } else {
                                                      _shakeAnimationController.start(shakeCount: 1);
                                                    }
                                                  },
                                                    child: Material(
                                                      elevation: 15,
                                                      color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                      child:
                                                      AnimatedContainer(
                                                        duration: const Duration(seconds: 10),
                                                        decoration: BoxDecoration(
                                                            color:Color(0xffffe3e3),borderRadius: BorderRadius.circular(12)
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
                                                                  Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                      color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                  ),),
                                                                  SizedBox(height:height/320),
                                                                  RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                        ),),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:height/320),
                                                                  expand[index]==true ? RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
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

                                                            SlideCountdown(
                                                              // This duration no effect if you customize stream duration
                                                              streamDuration: _streamDuration[index],
                                                              duration: Duration(days: index+1),
                                                              countUp: true,
                                                              infinityCountUp: true,

                                                            ),
                                                            SizedBox(width:width/100),
                                                            checkicon[index] == true ?  Tooltip(
                                                              message: 'Start Timer',
                                                              child:  GestureDetector(
                                                                  onTap: (){

                                                                    setState(() {
                                                                      checkicon[index]=false;
                                                                      _streamDuration[index].resume();
                                                                    });
                                                                    print(checkicon[index]);

                                                                  },

                                                                  child: playicon[index]),


                                                            ) :Tooltip(
                                                              message: 'Stop Timer',
                                                              child: GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      checkicon[index]=true;
                                                                      _streamDuration[index].pause();
                                                                    });

                                                                    print(checkicon[index]);
                                                                  },
                                                                  child: pauseicon[index]),
                                                            ),






                                                            SizedBox(width:width/100),




                                                            snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                              message: 'Start Task',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  mytasktaken(snapshot.data!.docs[index].id);
                                                                  mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index].id);
                                                                },
                                                                child: Icon(
                                                                  Icons.task,
                                                                  color: Colors.blue,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                              message: 'Task Done',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  print('firest');
                                                                  mytaskcomplete(snapshot.data!.docs[index].id);
                                                                  mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                  timeupdate(snapshot.data!.docs[index].id);
                                                                  print('second');
                                                                  check(snapshot.data!.docs[index].id);
                                                                  print('third');
                                                                },
                                                                child: Icon(
                                                                  Icons.add_alert,
                                                                  color: Colors.orange,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                              message: "Already Done",
                                                              child: Icon(
                                                                Icons.verified_rounded,
                                                                color: Colors.green,size: width/53.31,),
                                                            ):SizedBox(),


                                                            SizedBox(width:width/100),
                                                            GestureDetector(
                                                              onTap:(){
                                                                if(expand[index] == true)
                                                                {
                                                                  print("true yes");
                                                                  setState(() {
                                                                    expand[index] = false;
                                                                  }
                                                                  );
                                                                }
                                                                else
                                                                {
                                                                  print("false no");
                                                                  setState(() {
                                                                    expand[index]=true;
                                                                  }
                                                                  );}

                                                                print("Sri ni");
                                                                print(expand[index]);
                                                              },
                                                              child:
                                                              expand[index]==true ?
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
                                                  ),


                                                ):SizedBox();
                                            });
                                      },)

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
                                  /*Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                      color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                  ),),*/
                                  SizedBox(height:height/104.3),
                                  Container(
                                      width:width/3.20,

                                      child:
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('Assignedtask').snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Center(child:Lottie.asset("assets/loadingall.json"),);
                                          }
                                          return ListView.builder(
                                              shrinkWrap: true,

                                              itemCount: snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
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
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SizedBox(width:width/186.6),
                                                                Container(
                                                                  width:width/7.77,
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(height:height/104.3),
                                                                      Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                          color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                      ),),
                                                                      SizedBox(height:height/320),

                                                                      RichText(
                                                                        text: TextSpan(
                                                                          children: [
                                                                            TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                            ),),
                                                                            TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                            TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
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
                                                                            TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
                                                                                color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                            ),),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(height:height/320),
                                                                      expand[index]==true ?
                                                                      RichText(
                                                                        text: TextSpan(
                                                                          children: [
                                                                            TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                                color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                            ),),
                                                                            TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                  child: GestureDetector(
                                                                    onTap: (){

                                                                        if(Expandprocess[index] == true)
                                                                        {
                                                                          setState(() {
                                                                            Expandprocess[index] = false;
                                                                          }
                                                                          );
                                                                        }
                                                                        else
                                                                        {
                                                                          setState(()
                                                                          {
                                                                            Expandprocess[index]=true;
                                                                          }
                                                                          );}
                                                                  },
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
                                                                ),
                                                                SizedBox(width:width/100),
                                                                Tooltip(
                                                                  message: "Delete The Task",
                                                                  child: GestureDetector(onTap: (){
                                                                    deletetask(snapshot.data!.docs[index].id);
                                                                    deletetask2(snapshot.data!.docs[index].id);
                                                                    deletetask3(snapshot.data!.docs[index].id);
                                                                  },
                                                                    child: Icon( Icons.delete_forever,
                                                                      color: Colors.red,size:width/ 46.65,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(width:width/100),
                                                                Tooltip(
                                                                  message: "Details",
                                                                  child:GestureDetector(onTap: (){
                                                                    shake(snapshot.data!.docs[index]["tasktodocid"],snapshot.data!.docs[index]['taskid']);
                                                                    shake1(snapshot.data!.docs[index].id);
                                                                  },
                                                                    child: Container(
                                                                        width:width/74.64,
                                                                        height:height/41.72,
                                                                        child: Image.asset('assets/pointerp.png',)),
                                                                  ),
                                                                ),
                                                                SizedBox(width:width/100),

                                                                GestureDetector(
                                                                  onTap:(){
                                                                    if(expand[index] == true)
                                                                    {
                                                                      print("true yes");
                                                                      setState(() {
                                                                        expand[index] = false;
                                                                      }
                                                                      );
                                                                    }
                                                                    else
                                                                    {
                                                                      print("false no");
                                                                      setState(() {
                                                                        expand[index]=true;
                                                                      }
                                                                      );}

                                                                    print("Sri ni");
                                                                    print(expand[index]);
                                                                  },
                                                                  child:
                                                                  expand[index]==true ?
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
                                                            SizedBox(height: 10,),
                                                            Expandprocess[index]==true?
                                                            snapshot.data!.docs[index]['status'] == 'given'?
                                                            Container(
                                                              width:500,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Given',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ),),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.green,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.circle_sharp,color: Colors.grey,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('taken',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  )),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.grey,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.circle_sharp,color: Colors.grey,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Complete',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ))

                                                                ],
                                                              ),
                                                            )
                                                                :
                                                            snapshot.data!.docs[index]['status'] == 'taken'?
                                                            Container(
                                                              width:500,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Given',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ),),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.green,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('taken',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  )),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.grey,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.circle_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Complete',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ))

                                                                ],
                                                              ),
                                                            )
                                                                :
                                                            snapshot.data!.docs[index]['status'] == 'complete'?
                                                            Container(
                                                              width:500,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Given',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ),),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.green,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('taken',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  )),
                                                                  SizedBox(width:10),
                                                                  Container(
                                                                    width:10,
                                                                    child: Divider(
                                                                      color: Colors.grey,
                                                                      thickness: 2,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:10),
                                                                  Icon(Icons.verified_user_sharp,color: Colors.green,size:15),
                                                                  SizedBox(width:5),
                                                                  Text('Complete',style: GoogleFonts.montserrat(
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 14,
                                                                      color: Colors.black
                                                                  ))

                                                                ],
                                                              ),
                                                            )
                                                                :
                                                            SizedBox():SizedBox(),
                                                            SizedBox(height:height/104.3),


                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                              });
                                        },)

                                  ),
                                ],),
                            ],
                          ),
                        ),
                      ),
                    )
                        :
                    catcat=='Admin'?
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
                                  Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                      color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                  ),),
                                  SizedBox(height:height/104.3),


                                  Container(
                                      width:width/3.20,

                                      child:
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Center(child:Lottie.asset("assets/loading.json"),);
                                          }
                                          return ListView.builder(
                                              itemCount: snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
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
                                                                  Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                      color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                  ),),
                                                                  SizedBox(height:height/320),
                                                                  RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                        ),),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:height/320),
                                                                  expand[index]==true ? RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                              child: Center(child: Text(elapsedTime[index],style: GoogleFonts.montserrat(
                                                                  color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                              ),)),
                                                            ),
                                                            SizedBox(width:width/100),
                                                            GestureDetector(
                                                                onTap: ()
                                                                {
                                                                  startOrStop(index);
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

                                                            snapshot.data!.docs[index]["status"]=="given"? Tooltip(
                                                              message: 'Start Task',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  mytasktaken(snapshot.data!.docs[index].id);
                                                                  mytasktaken2(snapshot.data!.docs[index]["taskfromuserid"],snapshot.data!.docs[index].id);
                                                                },
                                                                child: Icon(
                                                                  Icons.task,
                                                                  color: Colors.blue,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="taken"? Tooltip(
                                                              message: 'Task Done',
                                                              child: GestureDetector(
                                                                onTap: (){
                                                                  mytaskcomplete(snapshot.data!.docs[index].id);
                                                                  mytaskcomplete2(snapshot.data!.docs[index].id);
                                                                  timeupdate(snapshot.data!.docs[index].id);
                                                                  check(snapshot.data!.docs[index].id);
                                                                },
                                                                child: Icon(
                                                                  Icons.add_alert,
                                                                  color: Colors.orange,size: width/53.31,),
                                                              ),
                                                            ) :
                                                            snapshot.data!.docs[index]["status"]=="complete"? Tooltip(
                                                              message: "Already Done",
                                                              child: Icon(
                                                                Icons.verified_rounded,
                                                                color: Colors.green,size: width/53.31,),
                                                            ):SizedBox(),

                                                            SizedBox(width:width/100),
                                                            GestureDetector(
                                                              onTap:(){
                                                                setState(() {
                                                                  if(snapshot.data!.docs[index]['view'] == false)
                                                                  { mytaskget(snapshot.data!.docs[index].id);}
                                                                  else
                                                                  {mytaskget2(snapshot.data!.docs[index].id);}
                                                                });
                                                              },
                                                              child:
                                                              expand[index]==true ?
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
                                              });
                                        },)

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
                                    child: Text(formattedDate.toString(),style: GoogleFonts.montserrat(
                                        color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/155.5
                                    ),),
                                  ),
                                  SizedBox(height:height/104.3),
                                  Container(
                                      width:width/3.20,

                                      child:
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('AssignedTasks').snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return Center(child:Lottie.asset("assets/loading.json"),);
                                          }
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
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
                                                                  Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                      color:Colors.black,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                  ),),
                                                                  SizedBox(height:height/320),

                                                                  RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Due date :', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinedate'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['deadlinetime'],style: GoogleFonts.montserrat(
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
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskfromid'],style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/140
                                                                        ),),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:height/320),
                                                                  expand[index]==true ?
                                                                  RichText(
                                                                    text: TextSpan(
                                                                      children: [
                                                                        TextSpan(text: 'Description : ', style: GoogleFonts.montserrat(
                                                                            color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                        ),),
                                                                        TextSpan(text:snapshot.data!.docs[index]['taskdescription'],style: GoogleFonts.montserrat(
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
                                                                deletetask(snapshot.data!.docs[index].id);
                                                                deletetask2(snapshot.data!.docs[index].id);
                                                                deletetask3(snapshot.data!.docs[index].id);
                                                              },
                                                                child: Icon( Icons.delete_forever,
                                                                  color: Colors.red,size:width/ 46.65,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width:width/100),
                                                            Tooltip(
                                                              message: "Delete The Task",
                                                              child: Container(
                                                                  width:width/74.64,
                                                                  height:height/41.72,
                                                                  child: Image.asset('assets/pointerp.png',)),
                                                            ),
                                                            SizedBox(width:width/100),

                                                            GestureDetector(
                                                              onTap:(){
                                                                setState(() {
                                                                  if(snapshot.data!.docs[index]['view'] == false)
                                                                  {
                                                                    assignedtaskget(snapshot.data!.docs[index].id);
                                                                  }
                                                                  else
                                                                  {
                                                                    assignedtaskget2(snapshot.data!.docs[index].id);
                                                                  }
                                                                });
                                                              },
                                                              child:
                                                              expand[index]==true ?
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
                                              });
                                        },)

                                  ),
                                ],),
                            ],
                          ),
                        ),
                      ),
                    )
                        :
                        SizedBox(),
                  ],
                ),
                notice == true?
                ShowUpAnimation(
                    curve: Curves.fastOutSlowIn,
                    direction: Direction.vertical,

                    child:
                    Padding(
                      padding:EdgeInsets.only(top:105,left: 170),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        height:800,
                        width:600,
                        child:Column(
                            children :[
                              Column(
                                children: [
                                  SizedBox(height:10),
                                  Container(
                                    width:600,
                                    height:440,
                                    child:
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('allnotice').snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child:Lottie.asset("assets/loading.json"),);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return
                                                Padding(
                                                  padding:EdgeInsets.only(top:8.0),
                                                  child: Material(
                                                    elevation: 15,
                                                    borderRadius: BorderRadius.circular(15),
                                                    child:
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),

                                                      ),
                                                      width:600,
                                                      height: 40,
                                                      child:
                                                      Row(
                                                        children: [
                                                          SizedBox(width:width/186.6),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(height:height/173.83),
                                                              Text(snapshot.data!.docs[index]['message'],overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                                                  color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/124.4
                                                              ),),
                                                              SizedBox(height:height/347.66),



                                                            ],),

                                                        ],),
                                                    ),
                                                  ),
                                                );
                                            });
                                      },),
                                  ),

                                ],)

                            ]
                        ),
                      ),
                    )):
                SizedBox(),


              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  String myname="";
  String myid="";
  String catcat="";
  DateTime dt1=DateTime.now();
  DateTime dt2=DateTime.now();
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

  check(thisdocid) async {
    var doumet= await FirebaseFirestore.instance.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).get();
    Map<String,dynamic>? val =doumet.data();
    print('its ddsfgsd ${val!["chkti"]}');
    print('${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}');
    setState(() {

      dt1=DateFormat("yyyy-MM-dd hh:mm:ss").parse("${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}");
      dt2=DateFormat("yyyy-MM-dd hh:mm:ss").parse(val["chkti"]);
     
    });
    print('its d11111111 ${dt1}');
    print('its d222222 ${dt2}');

    //print(dt1.compareTo(dt2));

    setState(() {
      if(dt1.compareTo(dt2) == 0)
      {
        _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update(
            {
            "timing":"ontime",

            }
        );

      }

      if(dt1.compareTo(dt2) == 1)
      {
        _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update(
            {
              "timing":"after",

            }
        );
      }

      if(dt1.compareTo(dt2) != 1){
        _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update(
            {
              "timing":"before",

            }
        );
      }

    });

  }
  Future deletetask(String docid)  async {
    await _firebase
        .collection('User')
        .doc(widget.id)
        .collection('Assignedtask')
        .doc(docid.toString())
        .delete();
  }
  Future deletetask2(String docid)  async {
    await _firebase
        .collection('User')
        .doc(widget.id)
        .collection('MyTasks')
        .doc(docid.toString())
        .delete();
  }
  Future deletetask3(String docid)  async {
    await _firebase
        .collection('All')
        .doc(docid.toString())
        .delete();
  }
  timeupdate(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "submittime":
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
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
  getcat() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      catcat=val!["category"];
    });
  }
  String userid="";
  String taskid='';
  Future Uploadtaskfromid() async{
    String taskid = randomAlphaNumeric(16);
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
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(taskid).set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'project name':projectnamefield.text,
      'timing':'',
      'query':'normal',
      "taskid":taskid,
      "tasktodocid":userid

    });

    await _firebase.collection('User').doc(userid).collection("MyTasks").doc(taskid).set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromuserid":widget.id,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'project name':projectnamefield.text,
      'timing':'',
      'query':'normal',
      "taskid":taskid,

    });
    clearall();
    Navigator.pop(context);
  }
  Future DeleteTask(String docid,touserid,docuid) async{

    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(docid.toString()).delete();

    await _firebase.collection('User').doc(touserid).collection("MyTasks").doc(docuid.toString()).delete();

  }
  Future<void> _showMyDialog() async {
    return AwesomeDialog(
      context: context,
      width: 500,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType:DialogType.success,
      showCloseIcon: true,
      title: 'Success',
      desc:
      'Task Added Sucessfully',
      btnOkOnPress: () {
        debugPrint('OnClcik');
        Navigator.of(context).pop();
        clearall();
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
        Navigator.of(context).pop();
        clearall();
      },
    ).show();
  }
  mytasktaken(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "status":"taken"
    });
  }
  mytasktaken2(touserid,thisdocid) async {
    await _firebase.collection('User').doc(touserid).collection("AssignedTasks").doc(thisdocid).update({
      "status":"taken"
    });
  }
  mytaskcomplete(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "status":"complete"
    });
  }
  mytaskcomplete2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(thisdocid).update({
      "status":"complete"
    });
  }

  shake(userid,thisdocid) async {
    await _firebase.collection('User').doc(userid).collection("MyTasks").doc(thisdocid).update({
      "query": 'shake'
    });
  }
  shake1(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(thisdocid).update({
      "query": 'shake'

    });
  }
  see(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "query": 'see'
    });
  }
  /*see1(userid,thisdocid) async {
    await _firebase.collection('User').doc(userid)).collection("AssignedTasks").doc(thisdocid).update({
      "query": 'see'

    });
  }

   */
  Future TaskAll() async{
    await _firebase.collection('All').doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'project name':projectnamefield.text,
      'timing':'',
      'query':'normal',
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
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'project name':projectnamefield.text,
      'timing':'',
      'query':'normal',

    });
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
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(thisdocid).update({
      "view":true

    });
  }
  assignedtaskget2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("Assignedtask").doc(thisdocid).update({
      "view":false

    });
  }
  startOrStop(index) {
    if(startStop[index]==true) {
      startWatch(index);
    } else {
      stopWatch(index);
    }
  }
  startWatch(index) {
    setState(() {
      startStop[index] = false;
      watch[index].start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime(timer,index));
    });
  }
  stopWatch(index) {
    setState(() {
      startStop[index] = true;
      watch[index].stop();
      setTime(index);
    });
  }
  setTime(index) {
    var timeSoFar = watch[index].elapsedMilliseconds;
    setState(() {
      elapsedTime[index] = transformMilliSeconds(timeSoFar);
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
  clearall(){
    tasknamefield.clear();
    empnamefield.clear();
    empidfield.clear();
    deadlinedatefield.clear();
    deadlinetimefield.clear();
    taskdescriptionfield.clear();
  }


}


