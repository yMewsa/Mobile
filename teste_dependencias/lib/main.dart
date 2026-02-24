import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Aplicativo de oi")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Oiiiie!",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
              );
            },
            child: Text("Me manda oi"),
          ),
        ),
      ),
    ),
  );
}
