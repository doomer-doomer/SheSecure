import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class phone extends StatefulWidget {
  const phone({super.key});
  static String verificationId ='';

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  var phno = '';

  var _auth = FirebaseAuth.instance;
  

  verifyPhno(String num) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: num,
      verificationCompleted: (credentials) async{
        await _auth.signInWithCredential(credentials);
      }, 
      verificationFailed: (e){}, 
      codeSent: (verificationID, codesent){
        phone.verificationId = verificationID;
        Navigator.popAndPushNamed(context, '/auth');
      }, 
      codeAutoRetrievalTimeout: (e){}
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        
        padding: EdgeInsets.all(30),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone Verification.", style: Theme.of(context).textTheme.headlineMedium,),
              Text("Complete phone verification to generate an OTP."),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.blueAccent,),
                  labelText: "Enter phone number"
                ),
                onChanged: ((value){
                  setState(() {
                    phno = value;
                  });
                  
                }),
              ),
            
              ],
              
            ),
            SizedBox(height: 100,),
           
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
        verifyPhno(phno);
        //Navigator.pushNamed(context, '/auth');
      },
      child: Icon(Icons.skip_next, color: Colors.blueAccent,),
      
      ),
    );
  }
}