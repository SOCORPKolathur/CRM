import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class profile_page extends StatefulWidget {
  String? id;
  profile_page(this.id);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
 int totalcount=0;
 var total="given";
 var taskafter="";
 var taskbefore="";
 var taskontime="";
 @override
 void initState() {
   gettaskcount();
   getcompletecount();
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
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
              if(snapshot.hasData==null){
                return Center(child: CircularProgressIndicator(),);
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
                              height: height/1.15,
                              child: Column(
                                children: [
                                  SizedBox(height:height/30,),
                                  Center(
                                    child: CircleAvatar(
                                      radius: width/23.32,
                                      backgroundImage: AssetImage("assets/sri.jpg"),
                                    ),
                                  ),
                                  SizedBox(height:height/52.15,),
                                  Center(
                                    child:Text(value!['name1'],style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/81.13
                                    ),),
                                  ),
                                  SizedBox(height:height/130.3,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Emp ID :',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: width/124.4
                                      ),),
                                      Text(value['username1'],style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.w500,color: Colors.black,fontSize: width/124.4
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height:height/52.15,),
                                  GestureDetector(onTap: (){
                                    print(width);
                                    print(height);
                                  },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFB946),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      width: width/7.46,
                                      height:height/28,
                                      child: Center(child: Text('Apply Leave',style: GoogleFonts.poppins(
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
                                      Text('Current Position',style: GoogleFonts.poppins(
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
                                              Text(value['position'],style: GoogleFonts.poppins(
                                                  fontWeight:FontWeight.w600,color: Colors.black,fontSize:width/124.4
                                              ),)
                                            ],),
                                          SizedBox(width:width/124.4,),
                                          Row(children: [
                                            SizedBox(height:height/104.3,),
                                            SizedBox(width:width/186,),
                                            Text(value['shift'],style: GoogleFonts.poppins(fontSize:width/143.53
                                            ),),
                                            SizedBox(width:width/373.2,),
                                            Icon(Icons.circle,size: 8,),
                                            SizedBox(width:width/373.2,),
                                            Text(value['branch'],style: GoogleFonts.poppins(fontSize:width/143.53
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
                                      launch("mailto:srinipandiyan17300@gmail.com");
                                    },
                                      child: Text('Email to HR',style: GoogleFonts.poppins(
                                          fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                      ),),
                                    ),
                                  ],),
                                  SizedBox(height:height/34.76,),
                                  Row(children: [
                                    SizedBox(width:width/62.2),
                                    Icon(Icons.email_outlined,),
                                    SizedBox(width:width/373.2),
                                    Text('Chat With Team Leader',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                    ),),
                                  ],),
                                  SizedBox(height:height/34.76,),
                                  Row(children: [
                                    SizedBox(width:width/62.2),
                                    Icon(Icons.lock,),
                                    SizedBox(width:width/373.2),
                                    Text('Request to change password',style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                    ),),
                                  ],),
                                  SizedBox(height:height/14,),

                                  Text('www.rankraze.com',style: GoogleFonts.poppins(fontSize:width/143.53,fontWeight: FontWeight.w500,
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
                                    Text('My Report',style: GoogleFonts.inter(
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
                              height: height/1.24,
                              child: Padding(
                                padding: EdgeInsets.only(left:width/62.2,right:width/62.2),
                                child: Column(
                                  children: [

                                    SizedBox(height:height/40,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Performance',style: GoogleFonts.poppins(
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
                                                child: Center(child: Text(totalcount.toString(),style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.red,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Total Tasks ',style: GoogleFonts.poppins(
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
                                                child: Center(child: Text(completecount.toString(),style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.green,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Completed Task',style: GoogleFonts.poppins(
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
                                                Text('Task Before Submit',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('04',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Task On Submit',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('06',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Task After Submit',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('05',style: GoogleFonts.poppins(
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
                                            Icon(Icons.warning_amber_outlined,color: Colors.red,size:width/74.64,),
                                            SizedBox(width:width/233.25,),
                                            Text('your performance is going good,but.still need a improvement',style: GoogleFonts.poppins(
                                                fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/124.4
                                            ),),
                                          ],),
                                      ),
                                    ),




                                    SizedBox(height:height/40,),





                                    SizedBox(height:height/100,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Worked Days',style: GoogleFonts.poppins(
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
                                                child: Center(child: Text('03',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.red,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Total Working Day',style: GoogleFonts.poppins(
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
                                                child: Center(child: Text('04',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.green,fontSize:width/53.31
                                                ),)),
                                              ),
                                              SizedBox(width:width/186,),
                                              Text('Leave Taken',style: GoogleFonts.poppins(
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
                                                Text('Sick Leave',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('04',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Sudden Leave',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('06',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.bold,color: Colors.black,fontSize:width/116.62
                                                ),),
                                              ],),
                                          ),
                                          SizedBox(width:width/14.35,),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Casual Leave',style: GoogleFonts.poppins(
                                                    fontWeight:FontWeight.w500,color: Colors.black,fontSize:width/133.28
                                                ),),
                                                Text('05',style: GoogleFonts.poppins(
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
                                            Text('your Attendance Record Is Well Maintained, Keep It Up.....,,',style: GoogleFonts.poppins(
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
 int completecount =0;
 final FirebaseFirestore _firebase =FirebaseFirestore.instance;

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

  getcompletecount() async {
    var  document = await FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where("status",isEqualTo: "complete").get();
    setState(() {
      completecount= document.docs.length;
    });
  }


}
