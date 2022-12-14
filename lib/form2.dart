import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpage/viewcandidate.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
class FormPage extends StatefulWidget {

  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with TickerProviderStateMixin{
  String dropdownValue = list.first;
  final TextEditingController _date=TextEditingController();
  final TextEditingController _candidate=TextEditingController();
  final TextEditingController _stage=TextEditingController();
  final TextEditingController _role=TextEditingController();
  final TextEditingController _contact=TextEditingController();
  final TextEditingController _viewcandidate=TextEditingController();

  var dates;
  var candidate;
  var stage;
  var role;
  var contact;
  var viewcandidate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(top: 20,left: 200,right:200),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add New HR / Employee',style: GoogleFonts.inter(
                    fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black
                  ),),
                  Row(
                    children: [
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      width: 120,
                      height:40,
                      child: Center(child: Text('Cancel',style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,color: Colors.black54
                      ),)),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.green,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      width: 120,
                      height:40,
                      child: Center(child: Text('Save',style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,color: Colors.white
                      ),)),
                    ),

                  ],),

                ],
              ),
            ),
            SizedBox(height: 15,),

            Center(
              child: 
              Material(
                elevation: 15,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: Colors.deepOrange,
                  ),
                  height: 800,
                  width: 1500,
                  child:
                  Padding(
                    padding:EdgeInsets.only(left: 50,right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,),
                          width: 300,
                          child:
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                            elevation: 16,
                            style:GoogleFonts.inter(color: Colors.black,),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                              },
                            items: list.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('First Name*',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _candidate,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Middle Name',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _candidate,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Name',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _candidate,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Container(
                              width: 650,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Job Position*',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _stage,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sex',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                      ),
                                      child: TextFormField(
                                        controller: _role,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('D.O.B',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                      ),
                                      child: TextFormField(
                                        controller: _role,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 40,),
                        Row(
                          children: [
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mobile*',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 14)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _contact,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            Container(
                              width: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email',style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 15)),
                                  SizedBox(height: 5,),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,),
                                      child: TextFormField(
                                        controller: _contact,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 45.0,bottom: 5,top: 5),
                                          border:InputBorder.none,),)),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 40,),

                        Container(
                          width: 1500,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                color: Colors.greenAccent,
                              ),
                                width: 100,
                                height: 30,
                                child: Center(child: Text('Upload CV')),
                              ),
                            ],
                          ),
                        ),


                      ],),
                  ),
                ),
              ),
            ),


          ],
        )
    );

  }
  Future add()async{
    FirebaseFirestore.instance.collection('Users').doc().set(
        {
          'Id no':_date.text,
          'contact':_contact.text,
          'Email':_stage.text,
          'Role':_role.text,
          'Name':_viewcandidate.text,
        }
    );
  }



  Future delete(String docid)async{
    FirebaseFirestore.instance.collection('Users').doc(docid).delete();
  }


  Future update()async{
    FirebaseFirestore.instance.collection('Users').doc().update(
        {
          'Id no':"002",
          'contact':"9745765474",
          'Email':"123@Gmail.com",
          'Role':"Hr",
          'Name':"Dhinesh"
        }
    );
  }

  getdata(){
    FirebaseFirestore.instance.collection('Users').doc().get();
  }


}


