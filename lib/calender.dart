import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'carrer.dart';
import 'add_emp_form.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;



const List<String> lelist = <String>[ 'Casual Leave','Sick Leave', 'Preplaned Leave',];

class calender extends StatefulWidget {
  String? id;
  calender(this.id);

  @override
  State<calender> createState() => _calenderState();
}

final TextEditingController reasontextfield=TextEditingController();
String _selectedDate = '';
String _dateCount = '';
String _range = '';
String _rangeCount = '';



class _calenderState extends State<calender> with TickerProviderStateMixin{
  @override
  void initState() {
    get12();
    super.initState();
  }
  String ledropdownValue = lelist.first;
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    @override
    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      setState(() {
        if (args.value is PickerDateRange) {
          _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
              ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        } else if (args.value is DateTime) {
          _selectedDate = args.value.toString();
        } else if (args.value is List<DateTime>) {
          _dateCount = args.value.length.toString();
        } else {
          _rangeCount = args.value.length.toString();
        }
      });
    }
    return
      Scaffold(
          body:ShowUpAnimation(
            curve: Curves.fastOutSlowIn,
            direction: Direction.horizontal,
            delayStart: Duration(milliseconds: 200),
            child:
              Padding(
                padding:EdgeInsets.only(top: height/25,left:width/50),
                child: Container(
                  height: height/1.15,
                  width:width/1.24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Material(
                                elevation: 10,
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10) ),
                                child: Container(
                                  width:width/3,
                                  height:height/23.475,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10) ),
                                    color: Color(0xff5F67EC),
                                  ),
                                  child: Center(child: Text('Calender',style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/93.3,),))


                                ),
                              ),
                              SizedBox(height:height/187.8,),
                              Material(
                                elevation: 20,
                                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10)),
                                  ),
                                  width:width/3,
                                  height:height/2,
                                  child: SfDateRangePicker(
                                    backgroundColor: Colors.white,
                                    enablePastDates: false,
                                    selectionColor: Color(0xff5F67EC),
                                    todayHighlightColor:Color(0xff5F67EC),
                                    onSelectionChanged: _onSelectionChanged,
                                    selectionMode: DateRangePickerSelectionMode.range,
                                    initialSelectedRange: PickerDateRange(
                                        DateTime.now().subtract(const Duration(days: 0)),
                                        DateTime.now().add(const Duration(days: 0))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:width/30,),
                          Column(
                            children: [
                              Material(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10) ),
                                elevation: 10,
                                child: Container(
                                    width:width/2.5,
                                    height:height/23.475,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight:Radius.circular(10) ),
                                      color: Color(0xff5F67EC),
                                    ),
                                    child: Center(child: Text('Form',style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/93.3,),))


                                ),
                              ),
                              SizedBox(height:height/187.8,),
                              Material(
                                elevation: 10,
                                child: Container(
                                    width:width/2.5,
                                    height:height/3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height:height/25,),
                                          Material(
                                            elevation: 10,
                                              borderRadius:  BorderRadius.circular(10),
                                            child: DropdownButton<String>(
                                              underline:Container(),
                                              value: ledropdownValue,
                                              elevation: 16,
                                              borderRadius:  BorderRadius.circular(10),
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: width/110,
                                                fontWeight: FontWeight.w500,),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  ledropdownValue= value!;
                                                });
                                              },
                                              items: lelist.map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Padding(
                                                    padding:EdgeInsets.only(left:width/233.25),
                                                    child: Text(value, style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                            SizedBox(height:height/25,),
                                            Text('Reason',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Padding(
                                              padding:EdgeInsets.all(8.0),
                                              child: Container(
                                                width: width/4,
                                                  height:height/15,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,),
                                                  child: Material(
                                                    elevation: 10,
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: TextFormField(
                                                      style: GoogleFonts.montserrat(
                                                        color: Colors.black,
                                                        fontSize: width/110,
                                                        fontWeight: FontWeight.w500,),
                                                      controller: reasontextfield,
                                                      cursorColor: Color(0xff5138EE),
                                                      decoration: InputDecoration(
                                                          //suffixIcon: Icon(Icons.phone_android_sharp,size:width/109.76),
                                                          border: InputBorder.none,
                                                          isCollapsed: true,
                                                          contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                                      ),),
                                                  )),
                                            ),
                                            SizedBox(height:height/25,),


                                        ],),
                                        Container(
                                          width:width/17,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                            GestureDetector(
                                              onTap: (){
                                                leaveapply();
                                                leaveapply1();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.green
                                                ),
                                                width:width/21,
                                                height:height/23.475,
                                                child: Center(
                                                  child: Text('Save',style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: width/124.4,
                                                  ),),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.grey
                                                ),
                                                width:width/21,
                                                height:height/23.475,
                                                child: Center(
                                                  child: Text('Cancel',style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: width/124.4,
                                                  ),),
                                                ),
                                              ),
                                            ),
                                          ],),

                                        ),
                                      ],
                                    )

                                ),
                              ),
                            ],
                          ),
                          SizedBox(width:width/300,),
                        ],
                      ),









                      SizedBox(height:height/80,),
                      Container(
                        width:width/1.24,
                        height: height/18,
                        decoration: BoxDecoration(
                            color: Color(0xff5F67EC),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                        ),
                        child: Row(
                          children: [
                            SizedBox(width:width/80,),
                            Text('Previous Leaves',
                              style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width/93.3,),),

                           /* SizedBox(width:width/1.80,),
                            GestureDetector(
                              onTap: (){
                              print(width);
                              print(height);
                            },
                              child: Container(
                                width:width/23.32,
                                height: height/29.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey
                                ),
                                child: Center(
                                  child: Text('Cancel',style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: width/124.4,
                                  ),),
                                ),
                              ),
                            ),
                            SizedBox(width:width/70,),
                            GestureDetector(
                              onTap: (){
                                leaveapply();
                                leaveapply1();
                            },
                              child: Container(
                                width:width/23.32,
                                height: height/29.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green
                                ),
                                child: Center(
                                  child: Text('Apply',style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: width/124.4,
                                  ),),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      SizedBox(height:height/130,),
                      Container(
                        width:width/1.24,
                        height:height/4.5,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('myleaves').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container(
                                  width: 80,
                                  height: 80,
                                  child: Center(child:Lottie.asset("assets/Loading1.json"),));
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return
                                    Padding(
                                      padding:EdgeInsets.only(top:height/187.8),
                                      child: Container(
                                        width:width/1.6,
                                        height:height/30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xffECEDFF),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/336,),
                                            Icon(Icons.circle_sharp,size:width/140,),
                                            SizedBox(width:width/336,),
                                            Text('Leave Dates : ',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700,fontSize:15),),
                                            Text(snapshot.data!.docs[index]['date'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize:15)),
                                            SizedBox(width:width/336,),
                                            Text('-'),
                                            SizedBox(width:width/336,),
                                            Text(snapshot.data!.docs[index]['type'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize:15)),
                                            SizedBox(width:width/336,),
                                            Text('-'),
                                            SizedBox(width:width/336,),
                                            Text(snapshot.data!.docs[index]['reason'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize:15)),
                                          ],
                                        ),
                                      ),
                                    );

                                });
                          },),
                      ), //StreamBuilder


                    ],),
                ),
              ),
          )
      );
  }

  String myname="";
  String myid="";


  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  get12() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      myname=val!["name1"];
      myid=val["username"];
    });
  }
  Future leaveapply() async{
    var uuid =  Uuid();
    String doid= randomAlphaNumeric(10);
    await _firebase.collection('leaves').doc().set({
      'name':myname,
      'id':myid,
      'type':ledropdownValue.toString(),
      'date':_range.toString(),
      'reason':reasontextfield.text,
      'status':'request',
      "docid": widget.id,
      "uuid": doid
    });

    await _firebase.collection('User').doc(widget.id).collection("myleaves").doc(doid).set({
      'type':ledropdownValue.toString(),
      'date':_range.toString(),
      'reason':reasontextfield.text,
      'status':'request',
      'name':myname,
      'id':myid,
      "uuid": doid
    });
  }
  Future leaveapply1() async{

  }
}
