import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:userauthentication/number.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade300),
        borderRadius: BorderRadius.circular(0),
        color: Colors.blue.shade300,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.blue.shade300),
      borderRadius: BorderRadius.circular(0),
      color: Colors.blue.shade300,
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.blue.shade300,
      ),
    );
var code="";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, "number");
        },
        icon: Icon(Icons.arrow_back,color: Colors.black,),),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child:   Text('Verify Phone',style: TextStyle(
                  fontSize: 22 ,fontWeight: FontWeight.bold,
                ),
                ),),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 78,right: 78),
                child:  Text('Code is sent to your number',style: TextStyle(
                    fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,
                ), ),
              SizedBox(
                height: 30,
              ),
              Padding(padding: EdgeInsets.only(left: 15,right: 20),
                  child:  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    length: 6,
                    validator: (s) {
                      return s == '2222' ? null : '';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onChanged: (value){
                      code=value;
                    },
                    onCompleted: (pin) => print(pin),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(left: 60,right: 60),
              child: Row(
                children: [
                  Text('Didn''t recieve the code?',style: TextStyle(color: Colors.grey),),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Request Again',)
              ],
              )),

              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(onPressed: () async{
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: MyNumber.verify, smsCode: code);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                    }
                   catch(e){
                      print("Wrong Otp");
                   }
                  }, child: Text('VERRIFY AND CONTINUE'),style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900,shape: RoundedRectangleBorder()),)
              )

            ],
          ),
        ),
      ),
    );


  }
}
