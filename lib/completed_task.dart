import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:hovering/hovering.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webpage/Login_page/login_page.dart';
import '../Hr_Page/hr_page.dart';

class completed_task extends StatefulWidget {
  String? id;
  completed_task(this.id);
  @override
  State<completed_task> createState() => _completed_taskState();
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

class _completed_taskState extends State<completed_task> {
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
  @override
  void initState() {
    get12();
    gettime();
    getcat();
    // TODO: implement initState
    super.initState();
  }


  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool startStop = true;
  String elapsedTime = '';
  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
// TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    final Focus1 = FocusNode();
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ShowUpAnimation(
        curve: Curves.fastOutSlowIn,
        direction: Direction.horizontal,
        delayStart: Duration(milliseconds: 200),
        child:
        SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left:width/62.2,top:height/50,right:width/62.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height:height/1.14,
          width:width/1.24,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                    height: height/1.14,
                    width: width/1.33,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            color:Color(0xff5F67EC),
                          ),
                          height:height/18.78,
                          width: width/1.33,
                          child: Center(
                            child: Text('Completed Task',style: GoogleFonts.montserrat(
                                fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/81.13),),
                          ),
                        ),
                        SizedBox(height:height/93.9,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Container(
                            width:width/2.70,
                            height:height/1.23,
                            child: Column(
                              children: [
                                Container(
                                  width:width/2.70,
                                  height:height/23.47,
                                  color:Color(0xff5F67EC),
                                  child:Center(
                                    child: Text('OnTime Submit',style: GoogleFonts.montserrat(
                                        fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/100),),
                                  ),
                                ),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where('status',isEqualTo: 'complete').where('timing',isEqualTo: 'before').snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container(
                                          width: 80,
                                          height: 80,
                                          child: Center(child:Lottie.asset("assets/loading1.json"),));
                                    }
                                    return ListView.builder(
                                      shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return
                                            Padding(
                                              padding: EdgeInsets.only(top:height/187.8),
                                              child: Container(
                                                width:width/2.70,
                                                height:height/18.78,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffe9ffe0),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Row(children: [
                                                  SizedBox(width:width/336),
                                                  Icon(Icons.circle_sharp,size:width/140,),
                                                  SizedBox(width:width/336,),
                                                  Text(snapshot.data!.docs[index]['project name'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700,fontSize: width/112),),
                                                  SizedBox(width:width/336,),
                                                  Text('-'),
                                                  SizedBox(width:width/336,),
                                                  Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize: width/112),),
                                                  SizedBox(width:width/336,),
                                                  Text('-'),
                                                  SizedBox(width:width/336,),
                                                  Text(snapshot.data!.docs[index]['taskfromname'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize: width/112),),

                                                ],),
                                              ),
                                            );
                                        });
                                  },),




                            ],),
                          ),
                            Container(
                              width:width/2.70,
                              height:height/1.23,
                              child: Column(
                                children: [
                                  Container(
                                    width:width/2.70,
                                    height:height/23.47,
                                    color:Color(0xff5F67EC),
                                    child:Center(
                                      child: Text('Late Submit',style: GoogleFonts.montserrat(
                                          fontWeight:FontWeight.bold,color: Colors.white,fontSize:width/100),),
                                    ),
                                  ),
                                  StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection('User').doc(widget.id).collection('MyTasks').where('status',isEqualTo: 'complete').where('timing',isEqualTo: 'after').snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return Container(
                                            width: 80,
                                            height: 80,
                                            child: Center(child:Lottie.asset("assets/loading1.json"),));
                                      }
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            return
                                              Padding(
                                                padding: EdgeInsets.only(top:height/187.8),
                                                child: Container(
                                                  width:width/2.70,
                                                  height:height/18.78,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffffe0e0),
                                                      borderRadius: BorderRadius.circular(8)
                                                  ),
                                                  child: Row(children: [
                                                    SizedBox(width:width/336),
                                                    Icon(Icons.circle_sharp,size: width/140,),
                                                    SizedBox(width:width/336,),
                                                    Text(snapshot.data!.docs[index]['project name'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700,fontSize: width/112),),
                                                    SizedBox(width:width/336,),
                                                    Text('-'),
                                                    SizedBox(width:width/336,),
                                                    Text(snapshot.data!.docs[index]['taskname'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize: width/112),),
                                                    SizedBox(width:width/336,),
                                                    Text('-'),
                                                    SizedBox(width:width/336,),
                                                    Text(snapshot.data!.docs[index]['taskfromname'],style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500,fontSize: width/112),),

                                                  ],),
                                                ),
                                              );
                                          });
                                    },),




                                ],),
                            ),

                        ],)


                      ],
                    ),

                  ),
                )
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
  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

  DateTime dt1=DateTime.now();
  DateTime dt2=DateTime.now();
  gettime() async {

  }

  check(thisdocid) async {
    var doumet= await FirebaseFirestore.instance.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      dt1=DateTime.parse(val!["chkti"]);
      dt2=DateTime.parse("2022-12-25 18:30:00");
    });
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
              "timing":"before",

            }
        );
      }

      if(dt1.compareTo(dt2) != 1){
        _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update(
            {
              "timing":"after",

            }
        );
      }

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
  timeupdate(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("MyTasks").doc(thisdocid).update({
      "submittime": "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
    });
  }
  get12() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      myname=val!["name1"];
      myid=val["username"];
    });
  }
  getcat() async {
    var doumet= await FirebaseFirestore.instance.collection("User").doc(widget.id).get();
    Map<String,dynamic>? val =doumet.data();
    setState(() {
      catcat=val!["category"];
    });
  }

  Future Uploadtaskfromid() async{
    await _firebase.collection('User').doc(widget.id).collection("AssignedTasks").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'checktime':"${deadlinedatefield.text} ${deadlinetimefield.text}",
      'assignedtoname':empnamefield.text,
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'timing':'',
      'project name':projectnamefield.text,

    });
  }
  Future Uploadtasktoid() async{
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
    await _firebase.collection('User').doc(userid).collection("MyTasks").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      'project name':projectnamefield.text,
      "view":'false',
      "status":"given",
      "submittime":'',
      'timing':'',
      'checktime':"${deadlinedatefield.text} ${deadlinetimefield.text}",

    });
    clearall();
    Navigator.pop(context);
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
    await _firebase.collection('User').doc(widget.id).collection("Assignedtask").doc(thisdocid).update({
      "view":true

    });
  }
  assignedtaskget2(thisdocid) async {
    await _firebase.collection('User').doc(widget.id).collection("Assignedtask").doc(thisdocid).update({
      "view":false

    });
  }


  Future Uploadtasktoid2() async{
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
      'timing':''


    });

  }
  Future Uploadtasktoid3() async{
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
    await _firebase.collection('User').doc(userid).collection("Assignedtask").doc().set({
      'taskname':tasknamefield.text,
      'taskdescription':taskdescriptionfield.text,
      'deadlinedate':deadlinedatefield.text,
      'deadlinetime':deadlinetimefield.text,
      'chkti':"${deadlinedatefield1.text} ${deadlinetimefield1.text}",
      'assignedtoname':empnamefield.text,
      'assignedtoid':empidfield.text,
      "taskfromname":myname,
      "taskfromid":myid,
      "view":'false',
      "status":"given",
      "submittime":'',
      'project name':projectnamefield.text,
      'timing':''

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
  clearall(){
    tasknamefield.clear();
    empnamefield.clear();
    empidfield.clear();
    deadlinedatefield.clear();
    deadlinetimefield.clear();
    taskdescriptionfield.clear();
  }
  startOrStop() {
    if(startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }
  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }
  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }
  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
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

}


