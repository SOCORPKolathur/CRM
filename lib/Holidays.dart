import 'dart:html';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:intl/intl.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:webpage/add_client_form.dart';

import '../add_emp_form.dart';

class holiday_page extends StatefulWidget {

  const holiday_page( {Key? key}) : super(key: key);

  @override
  State<holiday_page> createState() => _holiday_pageState();
}

class _holiday_pageState extends State<holiday_page> {
  String leave='';
  @override
  void initState() {
    datecount();
    // TODO: implement initState
    super.initState();
  }

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
              padding:EdgeInsets.only(top: height/34.777,left:width/37.333),
              child: Container(
                width: width/1.244,
                height:height/1.098,
                child:
                Column(
                  children: [
                  Container(
                      width: width/1.244,
                  height: height/20.866,
                  decoration: BoxDecoration(
                      color:Color(0xff5F67EC),
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),topRight: Radius.circular(10),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Holidays List',style: GoogleFonts.montserrat(
                          color: Colors.white,fontSize:width/93.333,fontWeight: FontWeight.bold
                      ),),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: width/15,
                          height: height/35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: GestureDetector(onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(1950),//DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime.now(),
                            );
                            if(pickedDate != null ){
                              print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(formattedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need

                              setState(() {
                                leave = formattedDate;//set foratted date to TextField value.
                              });
                            }else{
                              print("Date is not selected");
                            }
                            Leaveshow();

                          },
                            child: Center(
                              child: Text('Add Leave',style: GoogleFonts.montserrat(
                                  color:Color(0xff5F67EC),fontSize:width/100,fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                  ),
                    SizedBox(height: height/200,),
                    Container(
                      width: width/1.244,
                      height: height/1.200,
                      child: holi.length!=0? GridView.builder(
                            itemCount: holi.length,
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:4,
                                childAspectRatio: 80/18,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20

                            ) ,
                            itemBuilder:(context, index) {
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    d="${holi[index].day.toString()}/${holi[index].month.toString()}/${holi[index].year.toString()}";
                                    print(d);
                                  });
                                  delete(d);
                                  print('fn clkick');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ZoomIn(
                                    animate: true,
                                    duration: Duration(milliseconds: 500),
                                    child: Container(decoration: BoxDecoration(
                                      border: Border.all(color:Colors.grey),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                      height: height/8.21,
                                      width: width/4.55,
                                      child: Center(
                                        child: Text("${holi[index].day.toString()}/${holi[index].month.toString()}/${holi[index].year.toString()}",style: GoogleFonts.montserrat(
                                          color: Colors.black,fontSize:width/93.333,fontWeight: FontWeight.bold
                                        ),),
                                      )
                                    ),
                                  ),
                                ),
                              );
                            },) :
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    )


                  ],
                ),
              ),
            ),
          )
      );
  }


  String d='';
  String e='';
  delete(d) async {
    print('fn work');
    var document =await  FirebaseFirestore.instance.collection('Holidays').get();
    for(int i=0;i<document.docs.length;i++){
      if(d==document.docs[i]['date']){
        FirebaseFirestore.instance.collection('Holidays').doc(document.docs[i].id).delete();
      }
      else{
        print('no date');
      }

      holi.clear();
    }

  }









 final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  Leaveshow(){
    return
      AwesomeDialog(
        context: context,
        width: 500,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: 'Warning',
        desc: 'Are You Sure want to make leave  ${leave} ',
        buttonsTextStyle:  GoogleFonts.montserrat(fontWeight: FontWeight.w700,fontSize: 13,color: Colors.white),
        showCloseIcon: true,
        btnCancelOnPress: () {

        },
        btnOkOnPress: () {
          setleave();
        },
      ).show();
  }
  Future setleave() async{
    await _firebase.collection('Holidays').doc().set({
      'date':leave

    });
  }
  List<DateTime> holi= [];
  datecount() async {
    var docu= await FirebaseFirestore.instance
        .collection("Holidays").orderBy('date')
        .get();
    for(int k=0;k<docu.docs.length;k++){
      setState(() {
        holi.add(DateFormat('dd/MM/yyyy').parse(docu.docs[k]['date']));
      });
    }
    setState(() {
      holi.sort((a,b) => a.compareTo(b));
    });

  }
}
