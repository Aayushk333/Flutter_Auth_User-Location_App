import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyCustomForm extends StatefulWidget{
  _MyCustomFormState createState()=>_MyCustomFormState();
}
String firstname;

class _MyCustomFormState extends State<MyCustomForm>{
bool _autoValidate = false;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

File _image ; 
Future getImage(bool isCamera) async {
    File image;
    if(isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }

    else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
   
}



  @override 
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Message"),
        backgroundColor: Colors.black,
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
         
          children: <Widget>[
            Container(
              width: 350.0,
              height: 100.0,
              decoration: BoxDecoration(border: Border.all(width:2.0)),
              child: new Form( 
                 key: _formKey,
                 autovalidate: _autoValidate,
              child: TextFormField(
                  decoration: InputDecoration(
                  labelText: "Type your Message here",
                  icon: Icon(Icons.text_fields),
                ),
                keyboardType: TextInputType.text,
                validator: (String value){
                  firstname = value;
                  if(value.isEmpty)
                    return "Please type your help message !";
                  else 
                    return null;
                },
              ),
            ),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Submit',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              onPressed: _validateInputs,
              ),
            IconButton(
              icon: Icon(Icons.insert_drive_file) ,
              onPressed: (){
                getImage(false);
              }

              ),
            SizedBox(height: 10.0,),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: (){
                getImage(true);
              }
            ,),
            _image == null ? Container () : Image.file(_image,height: 300.0,width:450.0,),
          ],
            ), 
        
    
          ),
    );
      }

 

 void _validateInputs(){

   if(_formKey.currentState.validate())
      {   Navigator.pushNamed(context,'/third');   }

      else {
        setState(() {
          _autoValidate = true;
        });
            }
 }
 
}