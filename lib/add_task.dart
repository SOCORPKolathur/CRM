import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'carrer.dart';
import 'add_emp_form.dart';

class add_task extends StatefulWidget {
  const add_task({Key? key}) : super(key: key);

  @override
  State<add_task> createState() => _add_taskState();
}

class _add_taskState extends State<add_task> with TickerProviderStateMixin{
  final TextEditingController taskdescriptionfield=TextEditingController();
  final TextEditingController tasknamefield=TextEditingController();
  final TextEditingController deadlinetimefield=TextEditingController();
  final TextEditingController deadlinedatefield=TextEditingController();
  final TextEditingController empnamefield=TextEditingController();
  TextEditingController empidfield=TextEditingController();
  final Focus1 = FocusNode();
  final Focus2 = FocusNode();
  final Focus3 = FocusNode();
  final Focus4 = FocusNode();
  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return
      Scaffold(
          body:ShowUpAnimation(
            animationDuration: Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            direction: Direction.vertical,
            child: Padding(
              padding:EdgeInsets.only(top:height/52.15,left:width/93.3),
              child:
              Column(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white
                      ),
                      height:height/1.14,
                      width:width/1.24,
                      child: Column(
                        children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Color(0xff5F67EC),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                            ),
                            width:width/1.24,
                                  height: height/18,
                            child:Padding(
                              padding:EdgeInsets.only(top:height/104.3,bottom:height/104.3,left: width/60,right: width/60,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Add To Task',style: GoogleFonts.montserrat(
                                      fontSize:width/80,fontWeight: FontWeight.bold,color: Colors.white
                                  ),),
                                  Container(decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                    height: height/20.86,
                                    width: width/23.32,
                                    child: Row(
                                      children: [
                                        SizedBox(width: width/622,),
                                      Icon(Icons.done,size:width/124.4,),
                                      SizedBox(width:width/233.25),
                                      Text('Done',style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize:width/124.4
                                      ),),
                                    ],),
                                  )
                                ],
                              ),
                            )
                        ),
                        Padding(
                          padding:EdgeInsets.only(top:height/69.53,bottom:height/69.53,left:width/10,right: width/46.65),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                            SizedBox(height:height/15,),
                            Row(
                              children: [
                                Container(
                                  width:width/4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Employee Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
                                      SizedBox(height:height/208.6,),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:  BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                          height:height/23.17,
                                          child: StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance.collection('Users').snapshots(),
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
                                                    return data["Name"].toString();
                                                  }).toList().cast<String>(),
                                                  onChanged: (value){
                                                    setState(() {
                                                      empnamefield.text= value.toString();
                                                    });
                                                  },
                                                );
                                              }
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
                                      Text('Employee ID',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),

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
                                      Text('Deadline-Date',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                      Text('Deadline-Time',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                              ),),
                                          )),
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
                                  Text('Task Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                  Text('Task Description',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                  ),
                ],
              ),

            ),
          )
      );
  }
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  Future UploadtaskCommon() async{
    await _firebase.collection('User').doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,

    });
  }
  Future Uploadtaskempid() async{
    await _firebase.collection('User').doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,

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


}
