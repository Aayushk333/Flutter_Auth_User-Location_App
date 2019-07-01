import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override 
  _HomePageState createState()=>_HomePageState();

}



class _HomePageState extends State<Home>{


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _autoValidate = false;

@override 
Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Welcome to the Helpline Portal',style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold),
          ),
          ),
          //resizeToAvoidBottomPadding: false,
      body: Center(
        child:new Form(
           key: _formKey,
           autovalidate: _autoValidate,
           child: fORMuI(),
        
        )
      )
    );
 }

        Widget fORMuI(){
           
          return new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Login to Continue !\n",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black),),
       
              new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username'
                    ),
                   
                   validator: validateUsername,

                ),

                 new TextFormField(
                     obscureText: true,
                     decoration: const InputDecoration(labelText: 'Password'),
                     keyboardType: TextInputType.text,
                     validator: validatePassword,
                 ),
              
                 new TextFormField(
                     decoration: const InputDecoration(labelText: 'Mobile'),
                     keyboardType: TextInputType.phone,
                     validator: validateMobile,       
                ),
            
                new RaisedButton(
              color: Colors.blue,
              child: Text('Log In',style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
              onPressed: _validateInputs,
                          ),
            
        ],   
            
    );
      
}
 String temp;
  String validateUsername(String value) {
    temp=value;
    if (value.isEmpty)
      return 'Username must be provided';
    else if (value.length <6)
       return 'Username must be 6 characters long';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }


  String validatePassword(String value){
    if(value.isEmpty)
       return "Please enter the password";
    else if(value != temp)
       return "Username and Password do not match";
    else 
       return null;
  }


void _validateInputs()
{     if(_formKey.currentState.validate())
      {   Navigator.pushNamed(context,'/second');   }

      else {
        setState(() {
          _autoValidate = true;
        });
            }

}

}