
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(),
              child: Icon(Icons.image_rounded,size: 50,)),
              SizedBox(
                height: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 25,right: 25),
              child:   Text('Please select your Language',style: TextStyle(
                fontSize: 22 ,fontWeight: FontWeight.bold,
              ),
              ),),
              SizedBox(
                height: 10,
              ),
        Padding(padding: EdgeInsets.only(left: 78,right: 78),
       child:  Text('You can change the language at any time.',style: TextStyle(
           fontSize: 16,color: Colors.grey),textAlign: TextAlign.center,
       ), ),
              SizedBox(
                height: 20,
              ),

              Container(
              width: 200,
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
                  child:  Text('English') , ),
                    Padding(padding: EdgeInsets.only(left: 115)),
                    Icon(Icons.arrow_drop_down,color: Colors.grey,)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "number");}, child: Text('NEXT'),style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900,shape: RoundedRectangleBorder()),)
              ),


            ],
          ),
        ),
      ),
    );
  }
}
