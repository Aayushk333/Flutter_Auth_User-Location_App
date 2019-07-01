import 'package:flutter/material.dart';
import 'package:location/location.dart';



class GetLocationPage extends StatefulWidget {
  final firstname;
  GetLocationPage({this.firstname});
  @override
  _GetLocationPageState createState() => _GetLocationPageState(firstname : firstname);
}

class _GetLocationPageState extends State<GetLocationPage> {
  final firstname;
  _GetLocationPageState({this.firstname});
  var location = new Location();

  Map<String, double> userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Your Current Location"),
        backgroundColor: Colors.black87,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              FlatButton(
              color: Colors.blue,
              child: Text("Your Message :" , style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.black)),
              onPressed: (){},
            ),
            Container(
              padding: EdgeInsets.all(3.0),
              width: 350,
              height:250,
              decoration: BoxDecoration(border: Border.all(width: 3.0)),
              child: Text(firstname,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.pink),
              
              ),
              ),
         
             Text('\n\n'),
            userLocation == null
                ? CircularProgressIndicator()
                : Text("\t\t\t\tLatitude : " +
                    userLocation["latitude"].toString() +
                    "\n\n" + "\t\t\t\tLongitude : " +
                    userLocation["longitude"].toString() + "\n\n",style: TextStyle(fontSize: 20.0),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.blue,
                child: Text("Get Location", style: TextStyle(color: Colors.white),),
              ),
            ),
         
          ],
        ),
      ),
      
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}