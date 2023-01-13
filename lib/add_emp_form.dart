import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

const List<String> list = <String>[ '-Select-','Not to Say','Male', 'Female',];
const List<String> list1 = <String>['-Select-', 'Employee', 'HR', 'Sales'];
const List<String> list2 = <String>['-Select-','Full Time', 'Part Time',];
const List<String> list3 = <String>['-Select-','Anna Nagar', 'Kolathur', 'Avadi', 'Paadi'];

class add_emp_form extends StatefulWidget {

  const add_emp_form({Key? key}) : super(key: key);

  @override
  State<add_emp_form> createState() => _add_emp_formState();
}

class _add_emp_formState extends State<add_emp_form> with TickerProviderStateMixin{
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;
  @override
  void initState() {
    getsizevalues();
    super.initState();
  }
  final TextEditingController firstnamefield=TextEditingController();
  final TextEditingController middlenamefield=TextEditingController();
  final TextEditingController lastnamefield=TextEditingController();
  final TextEditingController jobfield=TextEditingController();
  final TextEditingController mobilefield=TextEditingController();
  final TextEditingController emailfield=TextEditingController();
  final TextEditingController sexfield=TextEditingController();
  final TextEditingController dobfield=TextEditingController();

  int empid=0;

  final Focus1 = FocusNode();
  final Focus2 = FocusNode();
  final Focus3 = FocusNode();
  final Focus4 = FocusNode();
  final Focus5 = FocusNode();
  final Focus6 = FocusNode();

  var dates;
  var candidate;
  var stage;
  var role;
  var contact;
  var viewcandidate;
var pages;
int n=0;

  @override


  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:   Padding(
                padding:EdgeInsets.only(top: height/52.15),
                child: Column(
                  children: [
                    Center(
                      child:
                      Material(
                        color: Color(0xff0B014B),
                        surfaceTintColor: Color(0xff0B014B) ,
                        shadowColor: Color(0xff0B014B),
                        elevation: 15,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.white,
                          ),
                          width:width/1.28,
                          child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff5F67EC),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                ),
                                width:width/1.28,
                                height: height/18,
                                child: Padding(
                                  padding:EdgeInsets.only(left: width/186.6,right: width/186.6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Add New HR / Employee',style: GoogleFonts.montserrat(
                                          fontSize:width/80,fontWeight: FontWeight.bold,color: Colors.white
                                      ),),
                                      Row(
                                        children: [
                                          GestureDetector(onTap:(){
                                            Navigator.pop(context);
                                          },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:Colors.grey,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              width:width/15.55,
                                              height:height/26.07,
                                              child: Center(child: Text('Cancel',style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,color: Colors.white
                                              ),)),
                                            ),
                                          ),
                                          SizedBox(width:width/37.32,),
                                          GestureDetector(onTap: (){
                                            addnewemp();
                                            _showMyDialog();

                                          },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:Colors.green,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              width:width/15.55,
                                              height:height/26.07,
                                              child: Center(child: Text('Save',style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,color: Colors.white
                                              ),
                                              )
                                              ),
                                            ),
                                          ),

                                        ],),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left:width/23.32),
                                child: Column(
                                  children: [
                                  SizedBox(height:height/17.38,),
                                  SizedBox(height:height/26.07,),
                                  Row(
                                    children: [
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('First Name*',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: firstnamefield,
                                                    cursorColor: Color(0xff5138EE),
                                                    onFieldSubmitted: (i){
                                                      FocusScope.of(context).requestFocus(Focus1);
                                                    },
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        isCollapsed: true,
                                                        contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                                    ),),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Middle Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    onFieldSubmitted: (i){
                                                      FocusScope.of(context).requestFocus(Focus2);
                                                    },
                                                    focusNode: Focus1,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: middlenamefield,
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
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Last Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    onFieldSubmitted: (i){
                                                      FocusScope.of(context).requestFocus(Focus3);
                                                    },
                                                    focusNode: Focus2,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: lastnamefield,
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

                                    ],
                                  ),
                                  SizedBox(height:height/26.07,),
                                  Row(
                                    children: [
                                      Container(
                                        width:width/2.35,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Job Position*',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child: TextFormField(
                                                    onFieldSubmitted: (i){
                                                      FocusScope.of(context).requestFocus(Focus5);
                                                    },
                                                    focusNode: Focus3,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: jobfield,
                                                    cursorColor: Color(0xff5138EE),
                                                    decoration: InputDecoration(
                                                        suffixIcon: Icon(Icons.school_outlined,size:width/109.76),
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
                                  SizedBox(height:height/26.07,),
                                    Row(
                                    children: [
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Sex',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                width:width/5,
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child:
                                                  Padding(
                                                    padding:EdgeInsets.only(left: width/186.6),
                                                    child: DropdownButton<String>(
                                                      underline:Container(),
                                                      value: dropdownValue,
                                                      elevation: 16,
                                                      borderRadius:  BorderRadius.circular(10),
                                                      style: GoogleFonts.montserrat(
                                                        color: Colors.black,
                                                        fontSize: width/110,
                                                        fontWeight: FontWeight.w500,),
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          dropdownValue = value!;
                                                        });
                                                      },
                                                      items: list.map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value, style: GoogleFonts.montserrat(
                                                            color: Colors.black,
                                                            fontSize: width/110,
                                                            fontWeight: FontWeight.w500,),),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('D.O.B',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child: TextFormField(
                                                      onFieldSubmitted: (i){
                                                        FocusScope.of(context).requestFocus(Focus5);
                                                      },
                                                      focusNode: Focus4,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: dobfield,
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
                                                            firstDate: DateTime(1950),//DateTime.now() - not to allow to choose before today.
                                                            lastDate: DateTime.now(),
                                                        );
                                                        if(pickedDate != null ){
                                                          print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                                                          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                          print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                                          //You can format date as per your need

                                                          setState(() {
                                                            dobfield.text = formattedDate; //set foratted date to TextField value.
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
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Shift',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                width:width/5,
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child:
                                                  Padding(
                                                    padding:EdgeInsets.only(left: width/186.6),
                                                    child: DropdownButton<String>(
                                                      underline:Container(),
                                                      value: dropdownValue2,
                                                      elevation: 16,
                                                      borderRadius:  BorderRadius.circular(10),
                                                      style: GoogleFonts.montserrat(
                                                        color: Colors.black,
                                                        fontSize: width/110,
                                                        fontWeight: FontWeight.w500,),
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          dropdownValue2 = value!;
                                                        });
                                                      },
                                                      items: list2.map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value, style: GoogleFonts.montserrat(
                                                            color: Colors.black,
                                                            fontSize: width/110,
                                                            fontWeight: FontWeight.w500,),),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height:height/26.07,),
                                  Row(
                                    children: [
                                      Container(
                                        width:width/5,
                                        child:
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Mobile*',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,),
                                                child: Material(
                                                  elevation: 10,
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: TextFormField(
                                                    onFieldSubmitted: (i){
                                                      FocusScope.of(context).requestFocus(Focus6);
                                                    },
                                                    focusNode: Focus5,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: mobilefield,
                                                    cursorColor: Color(0xff5138EE),
                                                    decoration: InputDecoration(
                                                      suffixIcon: Icon(Icons.phone_android_sharp,size:width/109.76),
                                                        border: InputBorder.none,
                                                        isCollapsed: true,
                                                        contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                                    ),),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Email',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,),
                                                child: Material(
                                                  elevation: 10,
                                                  borderRadius:  BorderRadius.circular(10),
                                                  child: TextFormField(
                                                    focusNode: Focus6,
                                                    style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: width/110,
                                                      fontWeight: FontWeight.w500,),
                                                    controller: emailfield,
                                                    cursorColor: Color(0xff5138EE),
                                                    decoration: InputDecoration(
                                                        suffixIcon: Icon(Icons.email_outlined,size:width/109.76),
                                                        border: InputBorder.none,
                                                        isCollapsed: true,
                                                        contentPadding: EdgeInsets.only(top:height/60,left: width/186.6)
                                                    ),),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width:width/46.65,),
                                      Container(
                                        width:width/5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Branch',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                            SizedBox(height:height/208.6,),
                                            Container(
                                                width:width/5,
                                                height:height/23.17,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Material(
                                                  borderRadius:  BorderRadius.circular(10),
                                                  elevation: 10,
                                                  child:
                                                  Padding(
                                                    padding:EdgeInsets.only(left: width/186.6),
                                                    child: DropdownButton<String>(
                                                      underline:Container(),
                                                      value: dropdownValue3,
                                                      elevation: 16,
                                                      borderRadius:  BorderRadius.circular(10),
                                                      style: GoogleFonts.montserrat(
                                                        color: Colors.black,
                                                        fontSize: width/110,
                                                        fontWeight: FontWeight.w500,),
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          dropdownValue3 = value!;
                                                        });
                                                      },
                                                      items: list3.map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value, style: GoogleFonts.montserrat(
                                                            color: Colors.black,
                                                            fontSize: width/110,
                                                            fontWeight: FontWeight.w500,),),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height:height/26.07,),
                                    Row(
                                      children: [
                                        Container(
                                          width:width/5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Employee Id*',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                              SizedBox(height:height/208.6,),
                                              Container(
                                                  width:width/5,
                                                  height:height/23.17,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,),
                                                  child: Material(
                                                    elevation: 10,
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Center(
                                                      child: Text(empid.toString(),style: GoogleFonts.montserrat(
                                                        color: Colors.black,
                                                        fontSize: width/110,
                                                        fontWeight: FontWeight.w500,),),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width:width/46.65,),

                                        Container(
                                          width:width/5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Position',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
                                              SizedBox(height:height/208.6,),
                                              Container(
                                                  width:width/5,
                                                  height:height/23.17,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white,
                                                  ),
                                                  child: Material(
                                                    borderRadius:  BorderRadius.circular(10),
                                                    elevation: 10,
                                                    child:
                                                    Padding(
                                                      padding:EdgeInsets.only(left: width/186.6),
                                                      child: DropdownButton<String>(
                                                        underline:Container(),
                                                        value: dropdownValue1,
                                                        elevation: 16,
                                                        borderRadius:  BorderRadius.circular(10),
                                                        style: GoogleFonts.montserrat(
                                                          color: Colors.black,
                                                          fontSize: width/110,
                                                          fontWeight: FontWeight.w500,),
                                                        onChanged: (String? value) {
                                                          setState(() {
                                                            dropdownValue1 = value!;
                                                          });
                                                        },
                                                        items: list1.map<DropdownMenuItem<String>>((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(value, style: GoogleFonts.montserrat(
                                                              color: Colors.black,
                                                              fontSize: width/110,
                                                              fontWeight: FontWeight.w500,),),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),







                                      ],
                                    ),
                                    SizedBox(height:height/26.07,),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          uploadToStorage();
                                        },
                                        child: DottedBorder(
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(10),
                                          dashPattern: [5,5],
                                          color: Color(0xff5138EE),
                                          strokeWidth:2, child: Container(
                                            width:width/6.22,
                                            height:height/8.69,
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height:height/104.3,),
                                                Icon(Icons.photo_library_outlined,color:Color(0xff5138EE),size: width/46.65,),
                                                SizedBox(height:height/104.3,),
                                             filename == ''?   Text('Select the Photo to Upload',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))):
                                                 Text(filename),
                                              ],)
                                        ),
                                        ),
                                      ),
                                      SizedBox(width:50),
                                      GestureDetector(
                                        onTap:(){
                                        },
                                        child: DottedBorder(
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(10),
                                          dashPattern: [5,5],
                                          color: Color(0xff5138EE),
                                          strokeWidth:2, child: Container(
                                            width:width/6.22,
                                            height:height/8.69,
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height:height/104.3,),
                                                Icon(Icons.upload_file,color:Color(0xff5138EE),size: width/46.65,),
                                                SizedBox(height:height/104.3,),
                                                Text('Select the CV file to Upload',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B)))
                                              ],)
                                        ),
                                        ),
                                      ),

                                    ],),
                                  SizedBox(height:height/20.86,)

                                ],),
                              ),





                            ],),
                        ),
                      ),
                    ),


                  ],
                ),
              )

    );

  }


  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  Future addnewemp() async{
    await _firebase.collection('User').doc().set({
      'name1':"${firstnamefield.text} ${middlenamefield.text} ${lastnamefield.text}",
      'firstname':firstnamefield.text,
      'middlename':middlenamefield.text,
      'lastname':lastnamefield.text,
      'dob':dobfield.text,
      'branch':dropdownValue3.toString(),
      'shift':dropdownValue2.toString(),
      'sex':dropdownValue.toString(),
      'category':dropdownValue1.toString(),
      'position':jobfield.text,
      'email':emailfield.text,
      'phone':mobilefield.text,
      'username1':empid.toString(),
      'username':"${'EMP'}-${empid.toString()}",
      'password':"${firstnamefield.text}@${dobfield.text}",
      'userimage':imgUrl
    });
  }

  getsizevalues() async {
    var  document = await FirebaseFirestore.instance.collection('User').get();
    setState(() {
      empid = document.docs.length.toInt() + 001;
    });
  }

  Future<void> _showMyDialog() async {
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
        'Employee Add Sucessfully',
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


  clearall(){
    firstnamefield.clear();
    middlenamefield.clear();
    lastnamefield.clear();
    dobfield.clear();
    sexfield.clear();
    jobfield.clear();
    emailfield.clear();
    mobilefield.clear();
    mobilefield.clear();
  }

  String imgUrl="";
  String fileName = Uuid().v1();
String  filename='';
  uploadToStorage() async{

    InputElement input = FileUploadInputElement()as InputElement ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        setState(() {
          filename = file.name;
        });
        var snapshot = await fs.ref().child('sliderimages').child("${file.name}").putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });

        print(imgUrl);
      });
    });

    print(imgUrl);



  }
  update(url) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('slider').doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
      "urls": url,
      'timestamp':DateTime.now().microsecondsSinceEpoch,


    });
  }

}








