import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:webpage/Landing_Page/Admin_landingpage.dart';
import 'package:webpage/Landing_Page/employee_landingpage.dart';
import 'package:webpage/Landing_Page/hr_landingpage.dart';

import '../constant.dart';

class login_page extends StatefulWidget {

  const login_page( {Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool isChecked = false;
  TextEditingController usernamefield = TextEditingController();
  TextEditingController passfield = TextEditingController();
  TextEditingController oldpassfield = TextEditingController();
  TextEditingController newpassfield = TextEditingController();
  final Focus1 = FocusNode();
  final Focus2 = FocusNode();
  final Focus3 = FocusNode();


  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    final Focus1 = FocusNode();

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
                                  onFieldSubmitted: (i){
                                    FocusScope.of(context).requestFocus(Focus1);
                                  },
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
                                  focusNode: Focus1,
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
      backgroundColor: Color(0xff441d6b),
    body: Padding(
      padding:EdgeInsets.only(top:height/10.43,bottom:height/10.43,left: width/18.66,right: width/18.66 ),
      child: Column(
        children: [
          Container(decoration: BoxDecoration(
            color: Colors.white
          ),
            height:height/1.3,
            width:width/1.10,
            child: Row(
              children: [
              Container(
                width:width/2.24,
                child: Padding(
                  padding:EdgeInsets.only(left:width/11.66),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: height/5),
                      Text('Login',style:GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize:width/42
                      ),),
                      SizedBox(height: height/150,),
                      Row(
                      children: [
                        Text(login_page_quote,style:GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize:width/120
                        ),),
                        Container(
                            width:width/74.64,
                            height:height/41.72,
                            child: ClipRRect(child: SvgPicture.asset('assets/thunder.svg',color: Color(0xff5138EE),))),

                      ],
                    ),
                      SizedBox(height: height/40,),
                      Text('Email*',style:GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,fontSize:width/100
                    ),),
                      SizedBox(height: height/130.37,),
                      Container(
                      width:width/4,
                      height:height/20,
                      child: TextField(
                        style: GoogleFonts.montserrat(fontSize:width/155.5),
                        controller: usernamefield,
                        onEditingComplete: (){
                          FocusScope.of(context).requestFocus(Focus1);
                        },
                        decoration: InputDecoration(
                            hintText: 'E-mail',hintStyle:TextStyle(fontSize:width/124.4) ,
                            contentPadding: EdgeInsets.only(top:height/208.6,left:width/186.6),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                    ),
                      SizedBox(height: height/34.76,),
                      Text('Password*',style:GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,fontSize:width/100
                    ),),
                      SizedBox(height: height/130.37,),
                      Container(
                      width:width/4,
                      height:height/20,
                      child: TextField(
                        style: GoogleFonts.montserrat(fontSize:width/155.5),
                        controller: passfield,
                        onEditingComplete: (){
                          FocusScope.of(context).requestFocus(Focus2);
                        },
                        onSubmitted: (_){
                          navigation1();
                        },
                        focusNode: Focus1,
                        decoration: InputDecoration(
                            hintText: 'Password',hintStyle:TextStyle(fontSize:width/124.4) ,
                            contentPadding: EdgeInsets.only(top:height/208.6,left:width/186.6),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                    ),
                      SizedBox(height: height/208.6,),
                      Container(
                        width:width/4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Container(
                            child: Row(
                              children: [
                                Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                        ),
                                SizedBox(width: width/622,),
                                Text('Remember Me',style:GoogleFonts.montserrat(
                                    color: Color(0xff441d6b),fontSize:width/145,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),


                            GestureDetector(
                              onTap: (){
                                forget_password_show();
                              },
                              child: Text('Forgot Password',style:GoogleFonts.montserrat(
                                color: Color(0xff441d6b),fontSize:width/145,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height/34.76,),
                      GestureDetector(
                      onTap: (){
                        navigation1();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff3a0391),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        width:width/4,
                        height:height/20,
                        child: Center(child: Text('Login',style:GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,fontSize:width/90,color:Colors.white
                        ),)) ,
                      ),
                    ),
                      SizedBox(height:height/52.15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width:width/26.666,
                              height:height/14.904,
                              child: Image.asset(login_page_logo)
                          ),
                          SizedBox(width: width/10,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(login_page_name,style:GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize:width/155.5
                          ),),
                          SizedBox(width: width/10,)
                        ],
                      ),



                  ],),
                ),
              ),





                Container(
                  width:width/2.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:height/46.95,left:width/84),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text('Welcome Back !',style: GoogleFonts.montserrat(fontWeight:FontWeight.bold,fontSize: width/42,color: Colors.black),),
                          SizedBox(height: 2,),
                          Text(login_page_quote1,style: GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:width/120,color: Colors.black),),
                          Text(login_page_quote2,style: GoogleFonts.montserrat(fontWeight:FontWeight.w500,fontSize:width/120,color: Colors.black),),
                        ],),
                      ),

                    Container(
                        width:width/2.25,
                        height:height/1.530,
                        child: Lottie.asset("assets/login1.json")),

                  ],),
                )
            ],),
          ),],
      ),
    ),

    );
  }


  final FirebaseFirestore _firebase =FirebaseFirestore.instance;
  user_authentication() async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('username', isEqualTo: usernamefield.text )
        .where('password', isEqualTo: passfield.text )
        .get();

    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      return
        navigation1();
    }
    else
    {
      print('hi');
      error_show();
    }
    }
    navigation1() async {
      final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
          .where('username', isEqualTo: usernamefield.text )
          .where('password', isEqualTo: passfield.text )
          .get();

    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      for(int i=0;i<documents.length;i++){
        id=documents[i].id;
      }
      var doumet= await FirebaseFirestore.instance.collection("User").doc(id).get();
      Map<String,dynamic>? val =doumet.data();
      if(val!["category"]=="Admin")
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => landing_page_admin(id)),
        );
      }
      else if(val["category"]=='HR')
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => landing_page_hr(id)),
        );
      }
      else if(val["category"]=='Employee')
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => landing_page_employee(id)),
        );

      }
    }
    else
    {
      print('hi');
      error_show();
    }

    }
    navigation3() async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('category', isEqualTo: 'HR' )
        .get();

    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      return
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => landing_page_hr(id)),
        );
    }
    else
    {
      navigation2();
    }
    }
    navigation2() async {
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('User')
        .where('category', isEqualTo: 'Employee' )
        .get();

    final List <DocumentSnapshot> documents = result.docs;

    if (documents.length > 0) {
      return
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => landing_page_employee(id)),
        );
    }
    else
    {
      error_show();
    }
    }
    String id="";
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
      error_show();
    }
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
      error_show();
    }


    }
  Future<void> error_show() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Something Went Worng'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Check Username & Password'),
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
                clearallforgetpassword();
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
    clearallforgetpassword();
  }
  clearalllogin(){
    usernamefield.clear();
    passfield.clear();

  }
  clearallforgetpassword(){
    oldpassfield.clear();
    newpassfield.clear();

  }

  Welcome() async{
    //Admin Login Details
    await _firebase.collection('User').doc().set({
      'firstname':'Admin',
      'middlename':'',
      'lastname':'',
      'dob':'',
      'branch':'',
      'shift':'',
      'sex':'',
      'category':'',
      'position':'',
      'email':'',
      'phone':'',
      'empid':'',
      'username':"Admin",
      'password':"Admin@123",
      'userimage':'',
      'resume':'',
      'clock':DateTime.now().millisecondsSinceEpoch
    });

    //Starting Date Of CRM
    await _firebase.collection('date').doc('3ba8Iq61VLtTX1eDlo7M').set({
      'date':'1/1/2023',
    });

    //Adding Holidays
    await _firebase.collection('Holidays').doc().set({
      'date':'1/1/2023',
      'date':'8/1/2023',
      'date':'15/1/2023',
      'date':'22/1/2023',
      'date':'26/1/2023',
      'date':'29/1/2023',
      'date':'5/2/2023',
      'date':'12/2/2023',
      'date':'19/2/2023',
      'date':'26/2/2023',
      'date':'5/3/2023',
      'date':'12/3/2023',
      'date':'19/3/2023',
      'date':'26/3/2023',
      'date':'2/4/2023',
      'date':'9/4/2023',
      'date':'16/4/2023',
      'date':'23/4/2023',
      'date':'30/4/2023',
      'date':'7/5/2023',
      'date':'14/5/2023',
      'date':'21/5/2023',
      'date':'28/5/2023',
      'date':'4/6/2023',
      'date':'11/6/2023',
      'date':'18/6/2023',
      'date':'25/6/2023',
      'date':'2/7/2023',
      'date':'9/7/2023',
      'date':'16/7/2023',
      'date':'23/7/2023',
      'date':'30/7/2023',
      'date':'6/8/2023',
      'date':'13/8/2023',
      'date':'20/8/2023',
      'date':'27/8/2023',
      'date':'3/9/2023',
      'date':'10/9/2023',
      'date':'17/9/2023',
      'date':'24/9/2023',
      'date':'1/10/2023',
      'date':'8/10/2023',
      'date':'15/10/2023',
      'date':'22/10/2023',
      'date':'29/10/2023',
      'date':'5/11/2023',
      'date':'12/11/2023',
      'date':'19/11/2023',
      'date':'26/11/2023',
      'date':'3/12/2023',
      'date':'10/12/2023',
      'date':'17/12/2023',
      'date':'24/12/2023',
      'date':'31/12/2023',

    });
  }


}
