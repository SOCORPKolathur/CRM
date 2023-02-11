import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
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
const List<String> list1 = <String>['Employee', 'HR', 'Sales'];
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
  String passworddate='';
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
String cato='';

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
                          height:height/1.050,
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
                                            dropdownValue1=='Employee' ?
                                              setState(() {
                                                cato = 'EMP';
                                              }):
                                            dropdownValue1=='HR' ?
                                            setState(() {
                                              cato = 'hr';
                                            }):
                                            setState(() {
                                              cato = 'SA';
                                            });
                                            addnewemp();
                                            mail();
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
                                                          String formattedDate1 = DateFormat('ddMM').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                                          print(formattedDate); //formatted date output using intl package =>  2022-07-04
                                                          //You can format date as per your need

                                                          setState(() {
                                                            dobfield.text = formattedDate; //set foratted date to TextField value.
                                                            passworddate = formattedDate1; //set foratted date to TextField value.
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
                                        child:
                                        filename == ''?
                                        DottedBorder(
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
                                                filename == ''?
                                                Text('Select the Photo to Upload',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))):
                                                 Text(filename),
                                              ],)
                                        ),
                                        ):
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.green),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          width:width/6.22,
                                          height:height/8.69,
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height:height/104.3,),
                                              Icon(Icons.person,color:Colors.green,size: width/46.65,),
                                              SizedBox(height:height/104.3,),
                                               Container(
                                                 width:width/7,
                                                 child: Center(
                                                   child: Center(
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       children: [
                                                         Container(
                                                             width:width/7,
                                                             child: Text(filename,overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                            ],)
                                        )
                                      ),
                                      SizedBox(width:width/37.333),


                                      GestureDetector(
                                        onTap:(){
                                          uploadToStorage1();
                                        },
                                        child:
                                        filename1 == ''?
                                        DottedBorder(
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
                                        ):
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color:Colors.green),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            width:width/6.22,
                                            height:height/8.69,
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height:height/104.3,),
                                                Icon(Icons.file_copy_sharp,color:Colors.green,size: width/46.65,),
                                                SizedBox(height:height/104.3,),
                                                Container(
                                                  width:width/7,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Center(child: Text(filename1,overflow: TextOverflow.ellipsis,)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],)
                                        )
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

  NumberFormat F=new NumberFormat('000');
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  addnewemp() async{
    print('addemp fun varuthu');
    await _firebase.collection('User').doc().set({
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
      'empid':empid.toString(),
      'username':"${cato}${F.format(empid.toString())}",
     'password':"${firstnamefield.text.toString().toLowerCase()}@${passworddate}",
      'userimage':imgUrl,
      'resume':resumeUrl,
      'clock':DateTime.now().millisecondsSinceEpoch
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
          clearall();
        },
        btnOkIcon: Icons.check_circle,
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
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
  String resumeUrl="";
  String fileName = Uuid().v1();
  String fileName1 = Uuid().v1();
String  filename='';
String  filename1='';

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
  uploadToStorage1() async{
    InputElement input = FileUploadInputElement()as InputElement ..accept = '*/';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        setState(() {
          filename1 = file.name;
        });
        var snapshot = await fs.ref().child('sliderimages').child("${file.name}").putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          resumeUrl = downloadUrl;
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
  mail(){
    FirebaseFirestore.instance.collection("mail").doc().set({
      'to': [emailfield.text],
      'message': {
        'subject': 'Welcome to RankRaze Technology',
        'text': 'Welcome to RankRaze Technology',
        'html': '''<code><html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

<head>
  <!--[if gte mso 9]>
<xml>
  <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
  </o:OfficeDocumentSettings>
</xml>
<![endif]-->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="x-apple-disable-message-reformatting">
  <!--[if !mso]><!-->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--<![endif]-->
  <title></title>

  <style type="text/css">
    @media only screen and (min-width: 620px) {
      .u-row {
        width: 600px !important;
      }
      .u-row .u-col {
        vertical-align: top;
      }
      .u-row .u-col-100 {
        width: 600px !important;
      }
    }
   
    @media (max-width: 620px) {
      .u-row-container {
        max-width: 100% !important;
        padding-left: 0px !important;
        padding-right: 0px !important;
      }
      .u-row .u-col {
        min-width: 320px !important;
        max-width: 100% !important;
        display: block !important;
      }
      .u-row {
        width: 100% !important;
      }
      .u-col {
        width: 100% !important;
      }
      .u-col>div {
        margin: 0 auto;
      }
    }
   
    body {
      margin: 0;
      padding: 0;
    }
   
    table,
    tr,
    td {
      vertical-align: top;
      border-collapse: collapse;
    }
   
    p {
      margin: 0;
    }
   
    .ie-container table,
    .mso-container table {
      table-layout: fixed;
    }
   
    * {
      line-height: inherit;
    }
   
    a[x-apple-data-detectors='true'] {
      color: inherit !important;
      text-decoration: none !important;
    }
   
    table,
    td {
      color: #000000;
    }
   
    #u_body a {
      color: #0000ee;
      text-decoration: underline;
    }
  </style>



  <!--[if !mso]><!-->
  <link href="https://fonts.googleapis.com/css?family=Cabin:400,700" rel="stylesheet" type="text/css">
  <!--<![endif]-->

</head>

<body class="clean-body u_body" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #f9f9f9;color: #000000">
  <!--[if IE]><div class="ie-container"><![endif]-->
  <!--[if mso]><div class="mso-container"><![endif]-->
  <table id="u_body" style="border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #f9f9f9;width:100%" cellpadding="0" cellspacing="0">
    <tbody>
      <tr style="vertical-align: top">
        <td style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td align="center" style="background-color: #f9f9f9;"><![endif]-->


          <div class="u-row-container" style="padding: 0px;background-color: transparent">
            <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;">
              <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: transparent;"><![endif]-->

                <!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
                <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                  <div style="height: 100%;width: 100% !important;">
                    <!--[if (!mso)&(!IE)]><!-->
                    <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                      <!--<![endif]-->

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="color: #afb0c7; line-height: 170%; text-align: center; word-wrap: break-word;">
                                <p style="font-size: 14px; line-height: 170%;"><span style="font-size: 14px; line-height: 23.8px;">RankRaze Technologies</span></p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!--[if (!mso)&(!IE)]><!-->
                    </div>
                    <!--<![endif]-->
                  </div>
                </div>
                <!--[if (mso)|(IE)]></td><![endif]-->
                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
              </div>
            </div>
          </div>
          <div class="u-row-container" style="padding: 0px;background-color: transparent">
            <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #003399;">
              <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #003399;"><![endif]-->

                <!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
                <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                  <div style="height: 100%;width: 100% !important;">
                    <!--[if (!mso)&(!IE)]><!-->
                    <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                      <!--<![endif]-->

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:40px 10px 10px;font-family:'Cabin',sans-serif;" align="left">

                              <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                  <td style="padding-right: 0px;padding-left: 0px;" align="center">

                                    <img align="center" border="0" src="https://cdn.templates.unlayer.com/assets/1597218650916-xxxxc.png" alt="Image" title="Image" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 26%;max-width: 150.8px;"
                                      width="150.8" />

                                  </td>
                                </tr>
                              </table>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="color: #e5eaf5; line-height: 140%; text-align: center; word-wrap: break-word;">
                                <p style="line-height: 140%;"> Thank for joing our Team</p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:0px 10px 31px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="color: #e5eaf5; line-height: 140%; text-align: center; word-wrap: break-word;">
                                <p style="font-size: 14px; line-height: 140%;"><span style="font-size: 28px; line-height: 39.2px;"><strong><span style="line-height: 39.2px; font-size: 28px;">Welcome to Rankraze </span></strong>
                                  </span>
                                </p>
                                <p style="font-size: 14px; line-height: 140%;"><span style="font-size: 28px; line-height: 39.2px;"><strong><span style="line-height: 39.2px; font-size: 28px;">We proud to have you in our team </span></strong>
                                  </span>
                                </p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!--[if (!mso)&(!IE)]><!-->
                    </div>
                    <!--<![endif]-->
                  </div>
                </div>
                <!--[if (mso)|(IE)]></td><![endif]-->
                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
              </div>
            </div>
          </div>



          <div class="u-row-container" style="padding: 0px;background-color: transparent">
            <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;">
              <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #ffffff;"><![endif]-->

                <!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
                <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                  <div style="height: 100%;width: 100% !important;">
                    <!--[if (!mso)&(!IE)]><!-->
                    <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                      <!--<![endif]-->

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:33px 55px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="line-height: 160%; text-align: center; word-wrap: break-word;">
                                <p style="font-size: 14px; line-height: 160%;"><span style="font-size: 22px; line-height: 35.2px;">Hi,${firstnamefield.text} </span></p>
                                <p style="font-size: 14px; line-height: 160%;"><span style="font-size: 18px; line-height: 28.8px;"> company content varanum inga</span></p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Cabin',sans-serif;" align="left">

                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->
                              <div align="center">
                                <!--[if mso]><v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w="urn:schemas-microsoft-com:office:word" href="" style="height:61px; v-text-anchor:middle; width:228px;" arcsize="6.5%"  stroke="f" fillcolor="#ff6600"><w:anchorlock/><center style="color:#FFFFFF;font-family:'Cabin',sans-serif;"><![endif]-->
                                <a href="" target="_blank" class="v-button" style="box-sizing: border-box;display: inline-block;font-family:'Cabin',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #ff6600; border-radius: 4px;-webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;font-size: 14px;">
                                  <span style="display:block;padding:14px 44px 13px;line-height:120%;"><span style="line-height: 16.8px;"><strong><span style="line-height: 16.8px;">User Id: ${'EMP'}${empid.toString()}<br />Passowrd: ${firstnamefield.text.toString().toLowerCase()}@${passworddate}</span></strong>
                                  </span>
                                  </span>
                                </a>
                                <!--[if mso]></center></v:roundrect><![endif]-->
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:33px 55px 60px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="line-height: 160%; text-align: center; word-wrap: break-word;">
                                <p style="line-height: 160%; font-size: 14px;"><span style="font-size: 18px; line-height: 28.8px;">Thanks,</span></p>
                                <p style="line-height: 160%; font-size: 14px;"><span style="font-size: 18px; line-height: 28.8px;">SOCORP Development Team</span></p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!--[if (!mso)&(!IE)]><!-->
                    </div>
                    <!--<![endif]-->
                  </div>
                </div>
                <!--[if (mso)|(IE)]></td><![endif]-->
                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
              </div>
            </div>
          </div>



          <div class="u-row-container" style="padding: 0px;background-color: transparent">
            <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #e5eaf5;">
              <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #e5eaf5;"><![endif]-->

                <!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
                <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                  <div style="height: 100%;width: 100% !important;">
                    <!--[if (!mso)&(!IE)]><!-->
                    <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                      <!--<![endif]-->

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:41px 55px 18px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="color: #003399; line-height: 160%; text-align: center; word-wrap: break-word;">
                                <p style="font-size: 14px; line-height: 160%;"><span style="font-size: 20px; line-height: 32px;"><strong>Get in touch</strong></span></p>
                                <p style="font-size: 14px; line-height: 160%;"><span style="font-size: 16px; line-height: 25.6px; color: #000000;">+11 111 333 4444</span></p>
                                <p style="font-size: 14px; line-height: 160%;"><span style="font-size: 16px; line-height: 25.6px; color: #000000;">rankraze.com</span></p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:10px 10px 33px;font-family:'Cabin',sans-serif;" align="left">

                              <div align="center">
                                <div style="display: table; max-width:244px;">
                                  <!--[if (mso)|(IE)]><table width="244" cellpadding="0" cellspacing="0" border="0"><tr><td style="border-collapse:collapse;" align="center"><table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:244px;"><tr><![endif]-->


                                  <!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 17px;" valign="top"><![endif]-->
                                  <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 17px">
                                    <tbody>
                                      <tr style="vertical-align: top">
                                        <td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                                          <a href="https://facebook.com/" title="Facebook" target="_blank">
                                            <img src="https://cdn.tools.unlayer.com/social/icons/circle-black/facebook.png" alt="Facebook" title="Facebook" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
                                          </a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <!--[if (mso)|(IE)]></td><![endif]-->

                                  <!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 17px;" valign="top"><![endif]-->
                                  <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 17px">
                                    <tbody>
                                      <tr style="vertical-align: top">
                                        <td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                                          <a href="https://linkedin.com/" title="LinkedIn" target="_blank">
                                            <img src="https://cdn.tools.unlayer.com/social/icons/circle-black/linkedin.png" alt="LinkedIn" title="LinkedIn" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
                                          </a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <!--[if (mso)|(IE)]></td><![endif]-->

                                  <!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 17px;" valign="top"><![endif]-->
                                  <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 17px">
                                    <tbody>
                                      <tr style="vertical-align: top">
                                        <td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                                          <a href="https://instagram.com/" title="Instagram" target="_blank">
                                            <img src="https://cdn.tools.unlayer.com/social/icons/circle-black/instagram.png" alt="Instagram" title="Instagram" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
                                          </a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <!--[if (mso)|(IE)]></td><![endif]-->

                                  <!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 17px;" valign="top"><![endif]-->
                                  <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 17px">
                                    <tbody>
                                      <tr style="vertical-align: top">
                                        <td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                                          <a href="https://youtube.com/" title="YouTube" target="_blank">
                                            <img src="https://cdn.tools.unlayer.com/social/icons/circle-black/youtube.png" alt="YouTube" title="YouTube" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
                                          </a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <!--[if (mso)|(IE)]></td><![endif]-->

                                  <!--[if (mso)|(IE)]><td width="32" style="width:32px; padding-right: 0px;" valign="top"><![endif]-->
                                  <table align="left" border="0" cellspacing="0" cellpadding="0" width="32" height="32" style="width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px">
                                    <tbody>
                                      <tr style="vertical-align: top">
                                        <td align="left" valign="middle" style="word-break: break-word;border-collapse: collapse !important;vertical-align: top">
                                          <a href="https://email.com/" title="Email" target="_blank">
                                            <img src="https://cdn.tools.unlayer.com/social/icons/circle-black/email.png" alt="Email" title="Email" width="32" style="outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important">
                                          </a>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <!--[if (mso)|(IE)]></td><![endif]-->


                                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
                                </div>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!--[if (!mso)&(!IE)]><!-->
                    </div>
                    <!--<![endif]-->
                  </div>
                </div>
                <!--[if (mso)|(IE)]></td><![endif]-->
                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
              </div>
            </div>
          </div>



          <div class="u-row-container" style="padding: 0px;background-color: transparent">
            <div class="u-row" style="Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #003399;">
              <div style="border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;">
                <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" border="0"><tr><td style="padding: 0px;background-color: transparent;" align="center"><table cellpadding="0" cellspacing="0" border="0" style="width:600px;"><tr style="background-color: #003399;"><![endif]-->

                <!--[if (mso)|(IE)]><td align="center" width="600" style="width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;" valign="top"><![endif]-->
                <div class="u-col u-col-100" style="max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;">
                  <div style="height: 100%;width: 100% !important;">
                    <!--[if (!mso)&(!IE)]><!-->
                    <div style="box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;">
                      <!--<![endif]-->

                      <table style="font-family:'Cabin',sans-serif;" role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tbody>
                          <tr>
                            <td style="overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:'Cabin',sans-serif;" align="left">

                              <div style="color: #fafafa; line-height: 180%; text-align: center; word-wrap: break-word;">
                                <p style="font-size: 14px; line-height: 180%;"><span style="font-size: 16px; line-height: 28.8px;">Copyrights &copy; Company All Rights Reserved</span></p>
                              </div>

                            </td>
                          </tr>
                        </tbody>
                      </table>

                      <!--[if (!mso)&(!IE)]><!-->
                    </div>
                    <!--<![endif]-->
                  </div>
                </div>
                <!--[if (mso)|(IE)]></td><![endif]-->
                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->
              </div>
            </div>
          </div>


          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
        </td>
      </tr>
    </tbody>
  </table>
  <!--[if mso]></div><![endif]-->
  <!--[if IE]></div><![endif]-->
</body>

</html>
</code>''',
      }
    });
  }

}








