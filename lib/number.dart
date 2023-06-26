import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class MyNumber extends StatefulWidget {
  const MyNumber({super.key});
  static String verify="";


  @override
  State<MyNumber> createState() => _MyNumberState();
}

class _MyNumberState extends State<MyNumber> {
  Country selectedCountry=Country(phoneCode: "91", countryCode: "IN", e164Sc: 0, geographic: true, level: 1, name: "India", example: "India", displayName:"India", displayNameNoCountryCode: "IN", e164Key: "");
  TextEditingController countrycode=TextEditingController();
  var phone="";
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text='+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, "language");
        },
          icon: Icon(Icons.close,color: Colors.black,),),
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
                child:   Text('Please enter your mobile number',style: TextStyle(
                  fontSize: 22 ,fontWeight: FontWeight.bold,
                ),
                ),),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 78,right: 78),
                child:  Text('You will recieve a 4 digit code to verify next.',style: TextStyle(
                    fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,
                ), ),
              SizedBox(
                height: 30,
              ),

              Container(
                width: 350,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black)
                ),
                child:  Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 70,
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(context: context,countryListTheme: const CountryListThemeData(bottomSheetHeight: 500), onSelect: (value){
                            setState(() {
                              selectedCountry=value;
                            });
    }
                          );
                        },
                        child: Text("${selectedCountry.flagEmoji}  +${selectedCountry.phoneCode}",
                        style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                        )
                      )
                    ),
                    SizedBox(
                      width: 0,
                    ),
                    Text('-',style: TextStyle(fontSize: 20),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value){
                          phone=value;
                        },
                      decoration: InputDecoration(border: InputBorder.none,hintText: 'Mobile Number',),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(onPressed: ()async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MyNumber.verify=verificationId;
                        Navigator.pushNamed(context, "otp");
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    //Navigator.pushNamed(context, "otp");
    },
                    child: Text('CONTINUE'),style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900,shape: RoundedRectangleBorder()),)
              )

            ],
          ),
        ),
      ),
    );

  }
}
