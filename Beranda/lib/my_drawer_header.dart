import 'package:beranda/artikel.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'cookierequest.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffb1b1),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 160,
            // child: Align(
            //   // alignment: Alignment,
            //   child: Image.asset('assets/images/Logo.png',
            //     height: 50,
            //     width: 60,
            //   ),
            // ),
            child: Align(
              alignment: Alignment(-0.90, 1.6),
              child: Text(
                'Hello ' + context.watch<CookieRequest>().username + '!',
                style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Baloo Bhaijaan 2',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
