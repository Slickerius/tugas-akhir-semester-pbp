// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'artikel.dart';
import 'artikel_details.dart';
import 'package:jiffy/jiffy.dart';

Widget artikelListTile(Artikel artikel, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(artikel: artikel)));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(artikel.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              getDate(artikel),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontFamily: 'Montserrat',
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            artikel.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    ),
  );
}

getDate(Artikel artikel) {
  var date = Jiffy(artikel.pubDate).yMMMMd;
  return date;
}
