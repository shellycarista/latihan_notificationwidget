import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey =new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: Text("Latihan Notification")),
      body: Center(
        child: Builder(builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(onPressed: (){showToast();}, child: Text("Show Toast"),),
        MaterialButton(onPressed: (){showSnackBar();}, child: Text("Show SnackBar"),),
        MaterialButton(onPressed: (){showBasicAlert(context);}, child: Text("Show Basic Alert"), )
      ],
        ))),
      )
    );
  }

  void showToast(){
    setState(() {
      Fluttertoast.showToast(
        msg: "This is Toast Notification",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
    );
    });
  }

  void showSnackBar(){
    setState(() {
      final snackBar = SnackBar(
        content: Text('Hey! This is a Snackbar'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(label: 'Undo',
        onPressed: (){},
        ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void showBasicAlert(BuildContext context){
    setState(() {
      Widget buttonOK = MaterialButton(
        child: Text("OK"),
        onPressed:(){
          Navigator.of(context).pop();
        }
      );
      Widget buttonCancel = MaterialButton(
        child: Text("Cancel"),
        onPressed:(){
          Navigator.of(context).pop();
        }
      );

      AlertDialog alert = AlertDialog(
        title: Text("Basic Alert"),
        content: Text("This is an Alert Dialog Message!"),
        actions: [
        buttonOK,
        buttonCancel],
      );
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return alert;
        });
    });
  }
}


