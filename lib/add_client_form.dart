import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:io' as io;

import 'package:lottie/lottie.dart';

class add_client_form extends StatefulWidget {
  String? id;
  String? name;
  add_client_form(this.id,this.name);

  @override
  State<add_client_form> createState() => _add_client_formState();
}

class _add_client_formState extends State<add_client_form> with TickerProviderStateMixin{

  getempid() async {
    final docemt = await FirebaseFirestore.instance.collection('User').get();
    for(int i =0;i<=docemt.docs.length;i++){
      if(docemt.docs[i]['name1']==clientempnamefield.text){
        setState(() {
          clientempidfield.text=docemt.docs[i]['username'];
        });
      }

    }
  }

  @override
  void initState() {
    clientnamefield.text=widget.id!;
    getclientcount();
    super.initState();
  }
  final TextEditingController clientnamefield=TextEditingController();
  final TextEditingController clientmobilefield=TextEditingController();
  final TextEditingController clientemailfield=TextEditingController();
  final TextEditingController clientlocationfield=TextEditingController();
  final TextEditingController clientempnamefield=TextEditingController();
  final TextEditingController clientempidfield=TextEditingController();
  final TextEditingController projecttittlefield=TextEditingController();
  final TextEditingController projecttypefield=TextEditingController();
  final TextEditingController timeperiodefield=TextEditingController();

  int clientid=0;

  final Focus1 = FocusNode();
  final Focus2 = FocusNode();
  final Focus3 = FocusNode();
  final Focus4 = FocusNode();
  final Focus5 = FocusNode();
  final Focus6 = FocusNode();
  final Focus7 = FocusNode();

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
                                Text('Add New Client',style: GoogleFonts.montserrat(
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
                                      addnewclient();
                                      leadschange(widget.id);
                                      _showMyDialog();
                                      clearall();

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
                                        Text('Client Id*',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                child: Text(clientid.toString(),style: GoogleFonts.montserrat(
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
                                        Text('Client Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                controller: clientnamefield,
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
                                    width:width/5,
                                    child: Column(
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
                                                  FocusScope.of(context).requestFocus(Focus3);
                                                },
                                                focusNode: Focus2,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: clientmobilefield,
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
                                                onFieldSubmitted: (i){
                                                  FocusScope.of(context).requestFocus(Focus4);
                                                },
                                                focusNode: Focus3,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: clientemailfield,
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
                                        Text('Location',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                onFieldSubmitted: (i){
                                                  FocusScope.of(context).requestFocus(Focus5);
                                                },
                                                focusNode: Focus4,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: clientlocationfield,
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
                                        Text('Project Tittle',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                  FocusScope.of(context).requestFocus(Focus6);
                                                },
                                                focusNode: Focus5,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: projecttittlefield,
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
                                        Text('Project Type',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                  FocusScope.of(context).requestFocus(Focus7);
                                                },
                                                focusNode: Focus6,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: projecttypefield,
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
                                        Text('Time Periode',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B))),
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
                                                onFieldSubmitted: (i){

                                                },
                                                focusNode: Focus7,
                                                style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontSize: width/110,
                                                  fontWeight: FontWeight.w500,),
                                                controller: timeperiodefield,
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


                                ],
                              ),
                              SizedBox(height:height/26.07,),

                              Row(
                                children: [
                                  Container(
                                    width:width/4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Employee Name',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                                        contentPadding: EdgeInsets.only(bottom: 10),
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
                                                        clientempnamefield.text= value.toString();
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
                                  SizedBox(width:width/46.65,),
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
                                                controller:clientempidfield,
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
                              SizedBox(height:height/26.07,),



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
  Future addnewclient() async{
    await _firebase.collection('client').doc().set({
      'name':clientnamefield.text,
      'id':clientid.toString(),
      'mobile':clientmobilefield.text,
      'email':clientemailfield.text,
      'location':clientlocationfield.text,
      'projecttittle':projecttittlefield.text,
      'projecttype':projecttypefield.text,
      'projecttimeperiode':timeperiodefield.text,
      'cempname':clientempnamefield.text,
      'cempid':clientempidfield.text,
      'projectstatus':'-',
      'startdate':"${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ",
      'action':'waiting'
    });
  }

  clearall(){
    clientempnamefield.clear();
    clientmobilefield.clear();
    clientemailfield.clear();
    clientlocationfield.clear();
    projecttittlefield.clear();
    projecttypefield.clear();
    timeperiodefield.clear();
    clientempnamefield.clear();
    clientempidfield.clear();
  }

  getclientcount() async {
    var  document = await FirebaseFirestore.instance.collection('client').get();
    setState(() {
      clientid = document.docs.length.toInt() + 001;
    });
  }
  Future<void> _showMyDialog() async {
    return AwesomeDialog(
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


  String imgUrl="";

  uploadToStorage() async{
    InputElement input = FileUploadInputElement()as InputElement ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('sliderimages').child("${file.name}").putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
        update(imgUrl);
        print(imgUrl);
      });
    });

    print(imgUrl);

  }

  update(url) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore.collection('slider').doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
      "urls": url,
    });
  }

  leadschange(thisdocid) async {
    await _firebase.collection('leads').doc(widget.name).update({
      "status":'converted'

    });
  }


}


