import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:shesecure/pages/phone.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {

  final _auth = FirebaseAuth.instance;
  var code ='';
  Future<bool> veriflyOTP(verificationID, sms)async{
    var cred = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationID, smsCode: sms));
    return cred.user != null ? true : false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text("OTP Verification", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Enter the OTP below.")
                ],
              ),
              SizedBox(height: 20,),
  
              Container(
                child: Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
                                  ),
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Didn't got otp yet?",
              style: TextStyle(
                color: Colors.black26,
            
              )))
                
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: ()async{
          bool val = await veriflyOTP(phone.verificationId, code);
          if(val==true){
            Navigator.pushNamed(context, '/createpost');
          }
        },
        child: Icon(Icons.verified, color: Colors.blueAccent,),
      ),
    );
  }
}