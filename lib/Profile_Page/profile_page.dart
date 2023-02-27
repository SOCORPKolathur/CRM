import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/calender.dart';
import 'package:webpage/team_chat.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../group_chat.dart';

class profile_page extends StatefulWidget {
  String? id;
  profile_page(this.id);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {


  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  String id="";
 int totalcount=0;
 String total="given";
 int aftercount=0;
 int beforecount=0;
 int ontimecount=0;
 var pages;
 int n=1;
 int completecount =0;
 int takencount =0;
 int givencount =0;
 double gtcount =0;


 TextEditingController usernamefield = TextEditingController();
 TextEditingController passfield = TextEditingController();
 TextEditingController oldpassfield = TextEditingController();
 TextEditingController newpassfield = TextEditingController();




 @override
 void initState() {
   check();
   check3();
   getgivencount();
   gettakencount();
   gettaskcount();
   taskbeforefn();
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    forget_password_show(){
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
                        Text('Update Password',style: GoogleFonts.montserrat(
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


                                    update_new_password();
                                    password_update_done_show();


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

                    SizedBox(height:height/20,),
                    Container(
                      width:width/1.8181,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Old Pass',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                  controller: oldpassfield,
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
                          Text('New Pass',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize:width/124.4,color: Color(0xff0B014B),)),
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
                                  textInputAction: TextInputAction.next,
                                  controller: newpassfield,
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
              TextButton(onPressed: (){
                getid();

              }, child: Text("New Password"))
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
    return Scaffold(
      body: SingleChildScrollView(
        child: ShowUpAnimation(
          curve: Curves.fastOutSlowIn,
          direction: Direction.horizontal,
          delayStart: Duration(milliseconds: 200),
          child:
          FutureBuilder<dynamic>(
            future: FirebaseFirestore.instance.collection('User').doc(widget.id).get(),
            builder: (context, snapshot) {
              if(snapshot.hasData==null)
              {
                return Container(
                    width: 80,
                    height: 80,
                    child: Center(child:Lottie.asset("assets/Loading1.json"),));
              }
              Map<String,dynamic>?value = snapshot.data!.data();
              return
                Padding(
                  padding:EdgeInsets.only(left: width/93.3,top:height/50),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Material(
                            elevation: 15,
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: width/4.44,
                              height: height/1.050,
                              child: Column(
                                children: [
                                  SizedBox(height:height/30,),
                                  GestureDetector(
                                    onTap: (){
                                      print(width);
                                    },
                                    child: CircleAvatar(
                                      radius: width/26.6666,
                                      backgroundImage:NetworkImage(value!['userimage']),

                            ),
                                  ),

                                  SizedBox(height:height/52.15,),
                                  Center(
                                    child:Text('${value['firstname']} ${value['middlename']} ${value['lastname']}',style: GoogleFonts.montserrat(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                    ),),
                                  ),
                                  SizedBox(height:height/130.3,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Emp ID :',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: width/124.4
                                      ),),
                                      Text(value['username'],style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: width/124.4
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height:height/52.15,),
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          pages=calender(widget.id);
                                          n=6;
                                        });
                                      },

                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB946),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      width: width/7.46,
                                      height:height/28,
                                      child: Center(child: Text('Apply Leave',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/103.6
                                      ),)),
                                    ),
                                  ),
                                  SizedBox(height:height/52.15),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height:height/20.86),
                                      SizedBox(width:width/62.2),
                                      Text('Current Position',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                      ),),
                                    ],
                                  ),
                                  Padding(
                                    padding:EdgeInsets.only(top:height/130.3,right:width/233.2,bottom:height/130.3),
                                    child: Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:Color(0xffeeeeee),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        width: width/5.48,
                                        height:height/14.9,
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              SizedBox(height:height/26.07,),
                                              SizedBox(width:width/186,),
                                              Text(value['position'],style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.w600,color: Colors.black,fontSize:width/124.4
                                              ),)
                                            ],),
                                          SizedBox(width:width/124.4,),
                                          Row(children: [
                                            SizedBox(height:height/104.3,),
                                            SizedBox(width:width/186,),
                                            Text(value['shift'],style: GoogleFonts.montserrat(fontSize:width/143.53
                                            ),),
                                            SizedBox(width:width/373.2,),
                                            Icon(Icons.circle,size: 8,),
                                            SizedBox(width:width/373.2,),
                                            Text(value['branch'],style: GoogleFonts.montserrat(fontSize:width/143.53
                                            ),),

                                          ],)
                                        ],),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height:height/52.15),

                                  Divider(),
                                  SizedBox(height:height/20,),
                                  Row(children: [
                                    SizedBox(width:width/62.2),
                                    Icon(Icons.email_outlined,),
                                    SizedBox(width:width/373.2),
                                    GestureDetector(onTap: (){
                                      launch(hr_email);
                                    },
                                      child: Text('Email to HR',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                      ),),
                                    ),
                                  ],),
                                  SizedBox(height:height/34.76,),
                                  GestureDetector(
                                    onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => chat(widget.id)),
                                    );
                                  },
                                    child: Row(children: [
                                      SizedBox(width:width/62.2),
                                      Icon(Icons.email_outlined,),
                                      SizedBox(width:width/373.2),
                                      Text('Chat With Team',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                      ),),
                                    ],),
                                  ),
                                  SizedBox(height:height/34.76,),
                                  Row(children: [
                                    SizedBox(width:width/62.2),
                                    Icon(Icons.lock,),
                                    SizedBox(width:width/373.2),
                                    GestureDetector(onTap: (){
                                      forget_password_show();
                                    },
                                      child: Text('Request to change password',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                      ),),
                                    ),
                                  ],),
                                  SizedBox(height:height/14,),
                                  Text(profile_page_name,style: GoogleFonts.montserrat(fontSize:width/143.53,fontWeight: FontWeight.w500,
                                  ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width:width/62.2,),
                      Column(
                        children: [
                          Material(
                            elevation: 15,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15)  ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15)  ),
                                color: Colors.white,
                              ),
                              width:width/1.8600,
                              height:height/20,
                              child: Padding(
                                padding: EdgeInsets.only(left:width/62.2,right:width/62.2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('My Report',style: GoogleFonts.montserrat(
                                      fontSize:width/81.13,fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:height/58,),
                          Material(
                            elevation: 15,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)  ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15)  ),
                                  color:Colors.white
                              ),
                              width:width/1.86,
                              height: height/1.140,
                              child: Padding(
                                padding: EdgeInsets.only(left:width/62.2,right:width/62.2),
                                child: Column(
                                  children: [
                                    SizedBox(height:height/40,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Performance',style: GoogleFonts.montserrat(
                                            fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                        ),),
                                      ],
                                    ),
                                    SizedBox(height:height/30,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.red,width:width/186),

                                                ),
                                                height:height/8.69,
                                                width:width/15.55,
                                                child: Center(child: Text(totalcount.toString(),style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.red,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Total Tasks ',style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                              ),),
                                            ],),
                                          SizedBox(width:width/14.35,),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.green,width:width/186)
                                                ),
                                                height:height/8.69,
                                                width:width/15.55,
                                                child: Center(child: Text(completecount.toString(),style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.green,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Completed Task',style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                              ),),
                                            ],),
                                        ],),
                                    ),
                                    SizedBox(height:height/26.07,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Task Before Submit',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text(beforecount.toString(),style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/8),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Task After Submit',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text(aftercount.toString(),style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                        ],),
                                    ),
                                    SizedBox(height:height/26.07,),
                                    Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        height:height/20.86,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child:
                                        gtcount<=25 ?
                                        Row(
                                          children: [
                                            SizedBox(width:width/233.25,),
                                            Icon(Icons.warning_amber_outlined,color: Colors.red,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('your performance very poor',style: GoogleFonts.montserrat(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],):
                                        gtcount<=50 ?
                                        Row(
                                          children: [
                                            SizedBox(width:width/233.25,),
                                            Icon(Icons.ac_unit,color: Colors.red,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('your performance is going good,but.still need a improvement',style: GoogleFonts.montserrat(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],):
                                        gtcount<=75 ?
                                        Row(
                                          children: [
                                            SizedBox(width:width/233.25,),
                                            Icon(Icons.warning_amber_outlined,color: Colors.red,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('keep work man i can do it',style: GoogleFonts.montserrat(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],):
                                         gtcount<=100 ?
                                        Row(
                                          children: [
                                            SizedBox(width:width/233.25,),
                                            Icon(Icons.verified_user_sharp,color: Colors.green,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('Good Work man ,Keep It Up',style: GoogleFonts.montserrat(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],):
                                            SizedBox()
                                      ),
                                    ),
                                    SizedBox(height:height/40,),
                                    SizedBox(height:height/100,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Worked Days',style: GoogleFonts.montserrat(
                                            fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                        ),),
                                      ],
                                    ),
                                    SizedBox(height:height/30,),
                                    Container(
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.red,width:width/186),

                                                ),
                                                height:height/8.69,
                                                width:width/15.55,
                                                child: Center(child: Text(totaldays.toString(),style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.red,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Total Working Day',style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                              ),),
                                            ],),
                                          SizedBox(width:width/14.35,),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.green,width:width/186)
                                                ),
                                                height:height/8.69,
                                                width:width/15.55,
                                                child: Center(child: Text('04',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.green,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Leave Taken',style: GoogleFonts.montserrat(
                                                  fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                              ),),
                                            ],),
                                        ],),
                                    ),
                                    SizedBox(height:height/26.07,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Sick Leave',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('04',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Sudden Leave',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('06',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Casual Leave',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('05',style: GoogleFonts.montserrat(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                        ],),
                                    ),
                                    SizedBox(height:height/26.07,),
                                    Material(
                                      elevation: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        height:height/20.86,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width:width/233.25,),
                                            Icon(Icons.verified_user,color: Colors.green,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('your Attendance Record Is Well Maintained, Keep It Up.....,,',style: GoogleFonts.montserrat(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          )
                        ],)
                    ],),
                );
            },
          ),
        ),
      ),

    );
  }


 getid() async {
   final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
       .where('username', isEqualTo: usernamefield.text )
       .where('password', isEqualTo: oldpassfield.text )
       .get();

   final List <DocumentSnapshot> documents = result.docs;

   if (documents.length > 0) {
     for(int i=0;i<documents.length;i++){
       id=documents[i].id;
     }
     print(id);

   }
   else
   {
     emp_add_done_show();
   }
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
 gettaskcount() async {
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').get();
    setState(() {
      totalcount= document.docs.length.toInt() + 0;

    });
  }
  taskbeforefn() async {
   print(" i was called");
   var  document3 = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where('timing',isEqualTo: 'after').get();
   setState(() {
     aftercount= document3.docs.length;

   });
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where('timing',isEqualTo: 'before').get();
    setState(() {
      beforecount= document.docs.length;

    });
    var  document2 = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where("status",isEqualTo: "complete").get();
    setState(() {
      completecount= document2.docs.length;
    });
    print(beforecount);
    print(completecount);
   setState(() {
     gtcount = (beforecount / completecount) * 100;
   });
  }
  getgivencount() async {
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where("status",isEqualTo: "given").get();
    setState(() {
      givencount= document.docs.length.toInt() + 0;
    });
  }
  gettakencount() async {
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where("status",isEqualTo: "taken").get();
    setState(() {
      takencount= document.docs.length.toInt() + 0;
    });
  }
 forgotpassword() async {
   final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
       .where('password', isEqualTo: oldpassfield.text )
       .get();

   final List <DocumentSnapshot> documents = result.docs;

   if (documents.length > 0) {
     return
       update_new_password();


   }
   else
   {
     emp_add_done_show();
   }


 }
 Future<void> emp_add_done_show() async {
   return showDialog<void>(
     context: context,
     barrierDismissible: false, // user must tap button!
     builder: (BuildContext context) {
       return AlertDialog(
         title: const Text('Upload Success'),
         content: SingleChildScrollView(
           child: ListBody(
             children: const <Widget>[
               Text('Employee Added Successfully'),
             ],
           ),
         ),
         actions: <Widget>[
           TextButton(
             child: const Text('Ok'),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       );
     },
   );
 }
 Future<void> password_update_fail_show() async {
   return showDialog<void>(
     context: context,
     barrierDismissible: false, // user must tap button!
     builder: (BuildContext context) {
       return AlertDialog(
         title: const Text('Update Error'),
         content: SingleChildScrollView(
           child: ListBody(
             children: const <Widget>[
               Text('your password is taken by someone else'),
             ],
           ),
         ),
         actions: <Widget>[
           TextButton(
             child: const Text('Ok'),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       );
     },
   );
 }
 Future<void> password_update_done_show() async {
   return showDialog<void>(
     context: context,
     barrierDismissible: false, // user must tap button!
     builder: (BuildContext context) {
       return AlertDialog(
         title: const Text('Update Success'),
         content: SingleChildScrollView(
           child: ListBody(
             children: const <Widget>[
               Text('Password Successfully Updated'),
             ],
           ),
         ),
         actions: <Widget>[
           TextButton(
             child: const Text('Ok'),
             onPressed: () {
               Navigator.of(context).pop();
               Navigator.pop(context);
             },
           ),
         ],
       );
     },
   );
 }
 Future update_new_password() async{
   await  _firebase.collection('User').doc(id).update({
     'password':newpassfield.text,
   });
   password_update_done_show();
 }

 String _formatDateTime(DateTime dateTime) {
   return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
 }

  String date1='';

  DateTime dt1=DateTime.now();
  DateTime dt2=DateTime.now();
 check() async {
   var doumet= await FirebaseFirestore.instance.collection('date').doc('3ba8Iq61VLtTX1eDLo7M').get();
   Map<String,dynamic>? val =doumet.data();
   String date2='';
   setState(() {
     date2 = _formatDateTime(DateTime.now());
   });
   setState(() {
     dt1=DateTime.parse(val!["date"]);
     dt2=DateTime.parse(date2) ;
     Duration diff = dt2.difference(dt1);
     date1 = diff.inDays.toString();
   });
 }
 String _formatDateTime1(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  String visibility='';
  checkholiday() async {
    final docemt = await FirebaseFirestore.instance.collection('Holidays').get();
    for(int i =0;i<=docemt.docs.length;i++){
      if(docemt.docs[i]['date']==_formatDateTime1){
        setState(() {
          visibility = 'false';
        });
      }
      else
      {
        setState(() {
          visibility = 'true';
        });
      }
    }
  }


  DateTime startDate = DateTime.now();
  DateTime startDate2 = DateTime.now();
  DateTime endDate =  DateTime.now();
  List<String> holidays=[];
  List<String> mydate =[];
  final DateFormat formatter = DateFormat('dd/M/yyyy');

  getDaysInBetween() {
    final int difference = endDate.difference(startDate).inDays;
    return difference;
  }


  int year =0;
  int day= 0;
  int month=0;
  check3()async{
    var  document1 = await FirebaseFirestore.instance.collection('date').doc('3ba8Iq61VLtTX1eDLo7M').get();
    Map<String,dynamic>? val =document1.data();
    setState(() {
      startDate = DateFormat('dd/MM/yyyy').parse(val!['date']);
      year= startDate.year;
      month= startDate.month;
      day= startDate.day;
      startDate2= DateTime.utc(year,month,day);
    });    endDate =DateFormat('dd/MM/yyyy').parse("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");

    final items = List<DateTime>.generate(getDaysInBetween(), (i) {
      DateTime date = startDate2;
      return date.add(Duration(days: i));
    });


    for(int i =0;i<items.length;i++) {
      print(formatter.format(items[i]).toString());
      for(int z=0;z<holidays.length;z++) {
        if (formatter.format(items[i]).toString().contains(holidays[z])) {
          setState(() {
            mydate.add(formatter.format(items[i]).toString());
          });
          break;
        }
      }
    }
    setState(() {
      totaldays=items.length-mydate.length;
    });
  }
  int totaldays=0;


}
