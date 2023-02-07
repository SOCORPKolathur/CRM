import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';
import 'package:percentify/components/RoundedCircularPercentify.dart';
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
bool c=false;

double percentagecount=80;



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


  String importnotice="";
  String impdate="";
  importantnotice()async{
    var document = await FirebaseFirestore.instance.collection('allnotice').orderBy('sendtime',descending: true).limit(1).get();
    for(int i=0;i<=document.docs.length;i++){
      setState(() {
        importnotice= document.docs[i]['message'];
        impdate= document.docs[i]['submitdate'];
      });

    }

  }
  @override
  void initState() {
    getcat();
    get12();
    gettaskcount();
    getempcount();
    importantnotice();
    // TODO: implement initState
    super.initState();
  }
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());


  var elapsedTime = List<String>.generate(10, (n) => '');
  var pauseicon = List<Icon>.generate(10, (n) => Icon(Icons.pause_circle_filled,color: Colors.red,));
  var playicon = List<Icon>.generate(10, (n) => Icon(Icons.play_circle,color: Colors.red,));
  var checkicon = List<bool>.generate(10, (n) => false);
  var expand = List<bool>.generate(10000, (n) => false);
  var expand2 = List<bool>.generate(10000, (n) => false);
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
  bool task = false;
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
                               tasknamefield.text.isEmpty ||
                                   taskdescriptionfield.text.isEmpty ||
                                   deadlinedatefield.text.isEmpty ||
                                   deadlinetimefield.text.isEmpty ||
                                   empnamefield.text.isEmpty ||
                                   empidfield.text.isEmpty ?
                               taskvalidateshow():
                               taskuploadedshow();
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
                                           return  CupertinoActivityIndicator();
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
                                           return  CupertinoActivityIndicator();
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
                    Row(
                            children:[

                              SizedBox(width:width/90),
                              Material(
                                elevation:15,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: width/8,
                                  height: height/6.95,
                                  child:Center(
                                    child: RoundedCircularPercentify(
                                      percentagecount, // the value of progress
                                      backgroundColor: Colors.black,
                                      valueColor:Color(0xff5F67EC),
                                      strokeWidth: 10,
                                      valueStrokeWidth: 10,
                                      child:  SizedBox(
                                        width:width/9.333,
                                        height:height/5.216,
                                        child: Center(
                                            child: Text(
                                              "${percentagecount.toString()}%",
                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width:width/12.5),
                              Padding(
                                padding:EdgeInsets.only(top:height/104.333),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height:height/200),
                                    Text('Important Notice',style: GoogleFonts.montserrat(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13),),
                                    SizedBox(height:height/104.3),
                                    Container(

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width:width/3,
                                      height:height/20,
                                      child:
                                      Row(
                                        children: [
                                          Container(
                                            width:width/3.5,
                                            height:height/20,
                                            child: Material(
                                                  elevation: 15,
                                                  borderRadius: BorderRadius.circular(15),
                                                  child:
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      color:Colors.white,
                                                    ),
                                                    width:width/3.5,
                                                    height:height/19,
                                                    child:
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(width:width/100),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                color:Colors.white,
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              width:width/3.7,
                                                              child: Padding(
                                                                padding:EdgeInsets.only(top:height/100),
                                                                child: Text(importnotice,overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/100
                                                                ),),
                                                              ),
                                                            ),


                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width:width/100),
                                                            Text(impdate,style: GoogleFonts.montserrat(fontWeight:FontWeight.w700,fontSize:width/155.555,color:Colors.red)),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                        ),
                                                      ],),
                                                  ),
                                                )

                                          ),

                                          GestureDetector(
                                            onTap: (){
                                              if(notice==false)
                                              {
                                                setState(() {
                                                  notice = true;
                                                }
                                                );
                                              }
                                              else
                                              {
                                                setState(() {
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
                                        ],
                                      ),
                                    ),


                                  ],),
                              ),

                              SizedBox(width:width/12.5),
                              Material(
                                elevation:15,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  width: width/8,
                                  height: height/6.95,
                                  child:
                                  catcat == 'HR'?
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                    Text('On Going Projects',style: GoogleFonts.montserrat(
                                      fontSize:width/109.803,fontWeight: FontWeight.w500,color:Colors.black
                                    ),),
                                    Text('10',style: GoogleFonts.montserrat(
                                        fontSize: width/93.333,fontWeight: FontWeight.bold,color:Colors.black
                                    ),),
                                    SizedBox(height:height/104.333),
                                    Text('Total Employees',style: GoogleFonts.montserrat(
                                        fontSize:width/109.803,fontWeight: FontWeight.w500,color:Colors.black
                                    ),),
                                    Text(totemp.toString(),style: GoogleFonts.montserrat(
                                        fontSize: width/93.333,fontWeight: FontWeight.bold,color:Colors.black
                                    ),),

                                  ],):
                                  Column(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                    Text('Pending Task',style: GoogleFonts.montserrat(
                                      fontSize:width/109.803,fontWeight: FontWeight.w500,color:Colors.black
                                    ),),
                                    Text(pendingtask.toString(),style: GoogleFonts.montserrat(
                                        fontSize: width/93.333,fontWeight: FontWeight.bold,color:Colors.black
                                    ),),


                                  ],)
                            ),
                          ),
                        ]
                    ),



                    Padding(
                      padding:EdgeInsets.only(top:height/52.15),
                      child: Material(
                        elevation: 15,
                          borderRadius: BorderRadius.circular(15),
                        child: Container(decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
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
                                              return Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: Center(child:Lottie.asset("assets/Loading1.json"),));
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                                itemCount: snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                    return
                                                      snapshot.data!.docs[index]['visibility'] == 'show'?
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
                                                          child:
                                                          Material(
                                                            elevation: 15,
                                                            color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                            child:
                                                            AnimatedContainer(
                                                              duration:  Duration(seconds: 10),
                                                              decoration: BoxDecoration(
                                                                  color:Colors.white,borderRadius: BorderRadius.circular(12)
                                                              ),
                                                              width:width/3.20,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width:width/186.6),
                                                                  Container(
                                                                    width:width/6.10,
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        SizedBox(height:height/104.3),
                                                                        Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                            color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                        ),),
                                                                        expand2[index]==true ?
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
                                                                  Column(
                                                                    children: [
                                                                    Container(
                                                                      width:width/16.8,
                                                                      height:height/55.23,
                                                                      color:Colors.red,
                                                                      child:Center(child: Text(snapshot.data!.docs[index]['deadlinedate'],
                                                                        style:GoogleFonts.montserrat(color:Colors.white,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                    ),
                                                                    Container(
                                                                      width:width/16.8,
                                                                      height:height/55.23,
                                                                      color:Color(0xfffcebeb),
                                                                      child:Center(child: Text(snapshot.data!.docs[index]['deadlinetime'],
                                                                        style:GoogleFonts.montserrat(color:Colors.red,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                    ),
                                                                  ],),
                                                                  SizedBox(width:width/120),

                                                                  Tooltip(
                                                                    message: "shrink",
                                                                    child: GestureDetector(onTap: (){
                                                                      if(task==false){
                                                                        setState(() {
                                                                          task=true;
                                                                        });
                                                                      }
                                                                      else
                                                                      {
                                                                        setState(() {
                                                                          task=false;
                                                                        });
                                                                      }
                                                                      mytasktaken(snapshot.data!.docs[index].id);
                                                                      mytasktaken2(snapshot.data!.docs[index].id);
                                                                    },
                                                                      child:
                                                                          task==false?
                                                                      Icon(
                                                                        Icons.play_circle,
                                                                        color: Colors.red,size: width/53.31,):Icon(
                                                                            Icons.pause_circle,
                                                                            color: Colors.red,size: width/53.31,)
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:width/120),
                                                                  task==true?
                                                                  snapshot.data!.docs[index]["status"]!="complete"?
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      Completetaskshow(snapshot.data!.docs[index].id);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.verified_rounded,
                                                                      color: Colors.green,size: width/53.31,),
                                                                  ):
                                                                  Icon(
                                                                    Icons.verified_rounded,
                                                                    color: Colors.green,size: width/53.31,):
                                                                    Container(),

                                                                  SizedBox(width:width/120),
                                                                  GestureDetector(
                                                                    onTap:(){
                                                                        if(expand2[index] == true)
                                                                        {
                                                                          print("true yes");
                                                                          setState(() {
                                                                            expand2[index] = false;
                                                                        }
                                                                        );
                                                                        }
                                                                        else
                                                                        {
                                                                          print("false no");
                                                                        setState(() {
                                                                        expand2[index]=true;
                                                                        }
                                                                        );}

                                                                      print("Sri ni");
                                                                      print(expand2[index]);
                                                                    },
                                                                    child:
                                                                    expand2[index]==true ?
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
                                                        see1(snapshot.data!.docs[index]['taskfromuserid'],snapshot.data!.docs[index]['taskid'],);
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
                                                                duration:  Duration(seconds: 10),
                                                                decoration: BoxDecoration(
                                                                    color:Color(0xffffd1d1),borderRadius: BorderRadius.circular(12)
                                                                ),
                                                                width:width/3.20,
                                                                child: Row(
                                                                  children: [
                                                                    SizedBox(width:width/186.6),
                                                                    Container(
                                                                      width:width/6.10,
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(height:height/104.3),
                                                                          Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                              color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                          ),),
                                                                          expand2[index]==true ? RichText(
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
                                                                    Column(
                                                                      children: [
                                                                        Container(
                                                                          width:width/16.8,
                                                                          height:height/55.23,
                                                                          color:Colors.red,
                                                                          child:Center(child: Text(snapshot.data!.docs[index]['deadlinedate'],
                                                                            style:GoogleFonts.montserrat(color:Colors.white,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                        ),
                                                                        Container(
                                                                          width:width/16.8,
                                                                          height:height/55.23,
                                                                          color:Color(0xfffcebeb),
                                                                          child:Center(child: Text(snapshot.data!.docs[index]['deadlinetime'],
                                                                            style:GoogleFonts.montserrat(color:Colors.red,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                        ),
                                                                      ],),
                                                                    SizedBox(width:width/120),

                                                                    Tooltip(
                                                                      message: "shrink",
                                                                      child: GestureDetector(onTap: (){
                                                                        if(task==false){
                                                                          setState(() {
                                                                            task=true;
                                                                          });
                                                                        }
                                                                        else
                                                                        {
                                                                          setState(() {
                                                                            task=false;
                                                                          });
                                                                        }
                                                                        mytasktaken(snapshot.data!.docs[index].id);
                                                                        mytasktaken2(snapshot.data!.docs[index].id);
                                                                      },
                                                                          child:
                                                                          task==false?
                                                                          Icon(
                                                                            Icons.play_circle,
                                                                            color: Colors.red,size: width/53.31,):Icon(
                                                                            Icons.pause_circle,
                                                                            color: Colors.red,size: width/53.31,)
                                                                      ),
                                                                    ),
                                                                    SizedBox(width:width/120),
                                                                    task==true?
                                                                    snapshot.data!.docs[index]["status"]!="complete"?
                                                                    GestureDetector(
                                                                      onTap: (){
                                                                        Completetaskshow(snapshot.data!.docs[index].id);
                                                                      },
                                                                      child: Icon(
                                                                        Icons.verified_rounded,
                                                                        color: Colors.green,size: width/53.31,),
                                                                    ):
                                                                    Icon(
                                                                      Icons.verified_rounded,
                                                                      color: Colors.green,size: width/53.31,):
                                                                    Container(),

                                                                    SizedBox(width:width/120),
                                                                    GestureDetector(
                                                                      onTap:(){
                                                                        if(expand2[index] == true)
                                                                        {
                                                                          print("true yes");
                                                                          setState(() {
                                                                            expand2[index] = false;
                                                                          }
                                                                          );
                                                                        }
                                                                        else
                                                                        {
                                                                          print("false no");
                                                                          setState(() {
                                                                            expand2[index]=true;
                                                                          }
                                                                          );}

                                                                        print("Sri ni");
                                                                        print(expand2[index]);
                                                                      },
                                                                      child:
                                                                      expand2[index]==true ?
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
                                                          child:
                                                          Material(
                                                            elevation: 15,
                                                            color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                            child:
                                                            AnimatedContainer(
                                                              duration:  Duration(seconds: 10),
                                                              decoration: BoxDecoration(
                                                                  color:Color(0xffffe3e3),borderRadius: BorderRadius.circular(12)
                                                              ),
                                                              width:width/3.20,
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width:width/186.6),
                                                                  Container(
                                                                    width:width/6.10,
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        SizedBox(height:height/104.3),
                                                                        Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(
                                                                            color:Colors.green,fontWeight:FontWeight.bold,fontSize:width/124.4
                                                                        ),),
                                                                        expand2[index]==true ? RichText(
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
                                                                  Column(
                                                                    children: [
                                                                      Container(
                                                                        width:width/16.8,
                                                                        height:height/55.23,
                                                                        color:Colors.red,
                                                                        child:Center(child: Text(snapshot.data!.docs[index]['deadlinedate'],
                                                                          style:GoogleFonts.montserrat(color:Colors.white,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                      ),
                                                                      Container(
                                                                        width:width/16.8,
                                                                        height:height/55.23,
                                                                        color:Color(0xfffcebeb),
                                                                        child:Center(child: Text(snapshot.data!.docs[index]['deadlinetime'],
                                                                          style:GoogleFonts.montserrat(color:Colors.red,fontSize:width/140,fontWeight:FontWeight.w700) ,)),
                                                                      ),
                                                                    ],),
                                                                  SizedBox(width:width/120),

                                                                  Tooltip(
                                                                    message: "shrink",
                                                                    child: GestureDetector(onTap: (){
                                                                      if(task==false){
                                                                        setState(() {
                                                                          task=true;
                                                                        });
                                                                      }
                                                                      else
                                                                      {
                                                                        setState(() {
                                                                          task=false;
                                                                        });
                                                                      }
                                                                      mytasktaken(snapshot.data!.docs[index].id);
                                                                      mytasktaken2(snapshot.data!.docs[index].id);
                                                                    },
                                                                        child:
                                                                        task==false?
                                                                        Icon(
                                                                          Icons.play_circle,
                                                                          color: Colors.red,size: width/53.31,):Icon(
                                                                          Icons.pause_circle,
                                                                          color: Colors.red,size: width/53.31,)
                                                                    ),
                                                                  ),
                                                                  SizedBox(width:width/120),
                                                                  task==true?
                                                                  snapshot.data!.docs[index]["status"]!="complete"?
                                                                  GestureDetector(
                                                                    onTap: (){
                                                                      Completetaskshow(snapshot.data!.docs[index].id);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.verified_rounded,
                                                                      color: Colors.green,size: width/53.31,),
                                                                  ):
                                                                  Icon(
                                                                    Icons.verified_rounded,
                                                                    color: Colors.green,size: width/53.31,):
                                                                  Container(),

                                                                  SizedBox(width:width/120),
                                                                  GestureDetector(
                                                                    onTap:(){
                                                                      if(expand2[index] == true)
                                                                      {
                                                                        print("true yes");
                                                                        setState(() {
                                                                          expand2[index] = false;
                                                                        }
                                                                        );
                                                                      }
                                                                      else
                                                                      {
                                                                        print("false no");
                                                                        setState(() {
                                                                          expand2[index]=true;
                                                                        }
                                                                        );}

                                                                      print("Sri ni");
                                                                      print(expand2[index]);
                                                                    },
                                                                    child:
                                                                    expand2[index]==true ?
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


                                                      ):SizedBox():

                                                      Padding(
                                                        padding:EdgeInsets.only(top:height/104.3),
                                                        child:
                                                        Material(
                                                          elevation: 15,
                                                          color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                          child:
                                                          AnimatedContainer(
                                                            duration:  Duration(seconds: 10),
                                                            decoration: BoxDecoration(
                                                                color:Color(0xfff8f8f8),borderRadius: BorderRadius.circular(12)
                                                            ),
                                                            width:width/3.20,
                                                            child: Padding(
                                                              padding:EdgeInsets.only(top:height/130.416,bottom:height/130.416,left:width/233.332,right:width/233.332),
                                                              child: Row(children: [
                                                                SizedBox(width:width/124.444,),
                                                                Icon(Icons.warning_amber,size:width/124.444,color: Colors.red,),
                                                                SizedBox(width:width/124.444,),
                                                                Text('Task Was Deleted by ${snapshot.data!.docs[index]['taskfromname']}',style: GoogleFonts.montserrat(
                                                                fontWeight: FontWeight.w700,fontSize: 15,color:Color(0xff5c5454)
                                                                ),)
                                                              ],),
                                                            )
                                                          ),
                                                        ),
                                                      );
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
                                          return Container(
                                              width: 80,
                                              height: 80,
                                              child: Center(child:Lottie.asset("assets/Loading1.json"),));
                                        }
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return
                                                Padding(
                                                  padding: EdgeInsets.only(top:height/104.3),
                                                  child:
                                                  snapshot.data!.docs[index]['visibility'] == 'show'?
                                                  Material(
                                                    elevation: 15,
                                                    color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                    child:
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: snapshot.data!.docs[index]['query'] == 'normal'?
                                                          Colors.white:
                                                          snapshot.data!.docs[index]['query'] == 'shake'?
                                                          Color(0xfffffce0):
                                                           snapshot.data!.docs[index]['query'] == 'see'?
                                                         Color(0xffe7fce3): Colors.white,
                                                          borderRadius: BorderRadius.circular(12)
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
                                                                          TextSpan(text: 'Assigned To : ', style: GoogleFonts.montserrat(
                                                                              color:Colors.black,fontWeight:FontWeight.w700,fontSize:width/140
                                                                          ),),
                                                                          TextSpan(text:snapshot.data!.docs[index]['assignedtoid'],style: GoogleFonts.montserrat(
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
                                                              snapshot.data!.docs[index]['status'] == 'complete' ?
                                                              Tooltip(
                                                                  message: "Task Will Be Completed",
                                                                  child: Container(
                                                                  height:height/34.76,
                                                                  width: width/14.35,
                                                                  decoration: BoxDecoration(
                                                                  color:Colors.green,borderRadius: BorderRadius.circular(20)
                                                              ),
                                                              child: Center(child: Text('Task Completed',style:
                                                                 GoogleFonts.montserrat(
                                                                    color: Colors.white,fontWeight: FontWeight.w700,fontSize:width/130
                                                                ),)),
                                                              ),
                                                                ):
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
                                                                child: GestureDetector(onTap: ()
                                                                {
                                                                  deletedaskshow(snapshot.data!.docs[index].id,
                                                                      snapshot.data!.docs[index]["tasktodocid"],
                                                                      snapshot.data!.docs[index]["taskid"]);
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

                                                  ):
                                                  Material(
                                                  elevation: 15,
                                                  color:Colors.white,borderRadius: BorderRadius.circular(12),
                                                  child:
                                                  AnimatedContainer(
                                                      duration:  Duration(seconds: 10),
                                                      decoration: BoxDecoration(
                                                          color:Color(0xfff8f8f8),borderRadius: BorderRadius.circular(12)
                                                      ),
                                                      width:width/3.20,
                                                      child: Padding(
                                                        padding:EdgeInsets.only(top:height/130.416,bottom:height/130.416,left:width/233.332,right:width/233.332),
                                                        child: Row(children: [
                                                          SizedBox(width:width/124.444,),
                                                          Icon(Icons.warning_amber,size:width/124.444,color: Colors.red,),
                                                          SizedBox(width:width/124.444,),
                                                          Text('You Delete The Task',style: GoogleFonts.montserrat(
                                                            fontWeight: FontWeight.w700,fontSize: 15,color:Color(0xff5c5454)
                                                          ),)
                                                        ],),
                                                      )
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

                  ],
                ),
                notice == true?
                Padding(
                  padding:EdgeInsets.only(top:height/7.452,left:width/4.6),
                  child:
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height:height/1.304,
                    width:width/3.5,
                    child:  ShowUpAnimation(
                        curve: Curves.fastOutSlowIn,
                        direction: Direction.vertical,
                        delayStart: Duration(milliseconds: 200),
                    child:
                    Column(
                        children :[
                        Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    width:width/3.5,
                                    height:height/1.354,
                                    child:
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('allnotice').snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Container(
                                              width: 80,
                                              height: 80,
                                              child: Center(child:Lottie.asset("assets/loading1.json"),));
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
                                                      borderRadius: BorderRadius.circular(15),
                                                      color:Colors.white,
                                                    ),
                                                    width:width/3.5,
                                                    height:height/19,
                                                    child:
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(width:width/100),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                                color:Colors.white,
                                                              ),
                                                              width:width/3.7,
                                                              child: Padding(
                                                                padding:EdgeInsets.only(top:height/100),
                                                                child: Text(snapshot.data!.docs[index]['message'],overflow: TextOverflow.ellipsis,style: GoogleFonts.inter(
                                                                    color:Colors.black,fontWeight:FontWeight.w500,fontSize:width/100
                                                                ),),
                                                              ),
                                                            ),


                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width:width/100),
                                                            Text(snapshot.data!.docs[index]['submitdate'],style: GoogleFonts.montserrat(fontWeight:FontWeight.w700,fontSize:width/155.555,color:Colors.red)),
                                                          ],
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                        ),
                                                      ],),
                                                  ),
                                                );
                                            });
                                      },),
                                  ),

                                ],)

                            ]
                        )),
                  ),
                ):
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
  int pendingtask=0;
  DateTime dt1=DateTime.now();
  DateTime dt2=DateTime.now();
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

  getcat() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      catcat=val!["category"];
    });
  }

  gettaskcount() async {
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where('status',isNotEqualTo: 'complete' ).get();
    setState(() {
      pendingtask = document.docs.length.toInt();
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
  String userid="";
  String taskid='';
  int totemp=0;



  deletedaskshow(String docid,touserid,docuid){
    return
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: 'Warning',
        desc: 'Are You Sure Delete The ${['taskname']} Task',
        buttonsTextStyle:  TextStyle(color: Colors.black),
        showCloseIcon: true,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          DeleteTask(docid,touserid,docuid);
        },
      ).show();
  }
  Future<void> taskuploadedshow() async {
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
        get12();
        alltasks();
        Uploadtaskfromid();
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
      },
    ).show();
  }
  Future<void> taskvalidateshow() async {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2,
      ),
      width: 280,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: false,
      onDismissCallback: (type) {
      },
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      title: 'INFO',
      desc: 'Empty fields can`t be Upload',
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }


  Future<void> Completetaskshow(id) async {
    return
      AwesomeDialog(
        context: context,
        width: 500,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: 'Success',
        desc:
        'Wow You Complete The Task',
        btnOkOnPress: () {
          mytaskcomplete(id);
          mytaskcomplete2(id);
          timeupdate(id);
          check(id);
        },
        btnOkIcon: Icons.check_circle,
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
          clearall();
        },
      ).show();
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

  timeupdate(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "submittime":
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
    });
  }
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

  mytasktaken(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "status":"taken"
    });
  }
  mytasktaken2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(thisdocid).update({
      "status":"taken"
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
  see1(userid,thisdocid) async {
    await _firebase.collection('User').doc(userid).collection("AssignedTasks").doc(thisdocid).update({
      "query": 'see'

    });
  }


  Future alltasks() async{
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
      'visibility':'show'
    });
  }
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
      "tasktodocid":userid,
      'visibility':'show'

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
      'visibility':'show'

    });
    clearall();
    Navigator.pop(context);
  }

  Future DeleteTask(String docid,touserid,docuid) async{

    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc(docid.toString()).update({
      'visibility':'hide'
    });

    await _firebase.collection('User').doc(touserid).collection("MyTasks").doc(docuid.toString()).update({
      'visibility':'hide'
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
  getempcount() async {
    var  document = await FirebaseFirestore.instance.collection('User').get();
    setState(() {
      totemp = document.docs.length.toInt();
    });
  }






}


