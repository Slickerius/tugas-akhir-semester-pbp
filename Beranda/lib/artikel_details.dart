import 'package:flutter/material.dart';
import 'artikel.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jiffy/jiffy.dart';

class ArticlePage extends StatelessWidget {
  final Artikel artikel;

  // ignore: use_key_in_widget_constructors
  const ArticlePage({required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(artikel.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    getDate(artikel),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //let's add the height

                    image: DecorationImage(
                        image: NetworkImage(artikel.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Html(
                  data: artikel.body,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getDate(Artikel artikel) {
  var date = Jiffy(artikel.pubDate).yMMMMd;
  return date;
}
