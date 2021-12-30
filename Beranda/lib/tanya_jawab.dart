import 'package:beranda/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'questionbox.dart';


class TanyaJawabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:<Widget>[
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Text",
              content: "Desc",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Text",
              content: "Desc",
            ),
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Text",
              content: "Desc",
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Question Box'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffffb1b1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestionBox()),
          );
        },
      ),
    );
  }
}

