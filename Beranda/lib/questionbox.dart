import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({Key? key}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb1b1),
        title: Align(
          alignment: Alignment(1, 1.6),
          child: Image.asset(
            'assets/images/Logo.png',
            height: 50,
            width: 60,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 25.0)),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Ajukan pertanyaan Anda disini",
                        labelText: "Question Box",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ]
                ),
      ),
        
    );
  }
}


