
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_employee_page.dart';

class Viewcandi extends StatefulWidget {
  String  name7;
  String  name8;
  String  name9;
  String  name10;
  String  name11;
  String  name12;

  Viewcandi(this.name7,this.name8,this.name9,this.name10,this.name11,this.name12);


  @override
  State<Viewcandi> createState() => _ViewcandiState();
}

class _ViewcandiState extends State<Viewcandi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 20),
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 30,width: 120,
                decoration: BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(32)),
                child: Center(child: Text('Add Employee',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Leave Request',style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Attendances list',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
              ),
              SizedBox(width: 30,),
              Container(height: 30,width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32)),
                child: Center(child: Text('Candidates',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(width: 220,),
              Container(height: 30,width: 100,
                decoration: BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(32)),
                child: Center(child: Text('Add hr',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0,right: 8.0,bottom: 8.0,top: 80),
            child: Text('View Candidates',style: GoogleFonts.poppins(color: Color(0xff000000),fontWeight: FontWeight.bold,fontSize: 18),),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 55),
            width: 1000,height: 60,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 2)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Date Applied ',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('Candidate Name ',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('Stage ',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('Role',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('Contact',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('View Candidate',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
                Text('More',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14),),
              ],),

          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(top: 10,left: 55),
            width: 1000,height: 60,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 2)]),
            child: Row(
              children: [
                Container(

                  child: Text(widget.name7,),
                  height: 30,width: 100,

                  margin: EdgeInsets.only(left: 50),
                  padding: EdgeInsets.only(left: 10),
                ),
                Container(child: Center(
                  child: Text(widget.name8,
                    style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16,
                       ),),
                ),

                  height: 30,
                  width: 120,
                  margin: EdgeInsets.only(left: 50),

                ),
                Container(child: Center(
                  child: Text(widget.name9,style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16,
                      textStyle: TextStyle()),),
                ),
                  height: 30,width: 80,
                  margin: EdgeInsets.only(left: 70),
                ),
                Container(child: Text(widget.name10,style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16,
                    ),),
                  height: 30,width: 100,

                  margin: EdgeInsets.only(left: 20),
                ),
                Container(child: Text(widget.name11,style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16,
                    ),),
                    height: 30,width: 110,
                    margin: EdgeInsets.only(left: 10)
                ),
                Container(child: Center(
                  child: Text(widget.name12,style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16,
                      ),),
                ),
                  height: 30,width: 100,
                  margin: EdgeInsets.only(left: 20,right: 80),
                ),
                IconButton(onPressed: (){
                  showmodel2(BuildContext ,context);
                }, icon:Icon(Icons.more_vert)),
              ],),

          ),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
}

Future showmodel2(BuildContext,context)=>showDialog(
    useSafeArea: true,
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    context: context, builder: (context) =>Container(
  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,blurRadius: 2)],color: Colors.white70),
  margin: EdgeInsets.only(top:120,left: 800,right: 420,bottom: 400),
  padding: EdgeInsets.all(2.0),
  height: 100,
  width: 50,

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.mail_outline_outlined),
          SizedBox(width: 10,),
          Text('Email Candidates',style: GoogleFonts.poppins(fontSize: 10,color: Colors.lightBlueAccent),),
        ],),

      GestureDetector(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => all_employee_page(),));

      },
        child: Row(
          children: [
            Icon(Icons.edit_calendar),
            SizedBox(width: 10,),
            Text('Edit Candidates',style: GoogleFonts.poppins(fontSize: 10,color: Colors.lightBlueAccent))
]
)
      )

])
)
);