import 'package:flutter/material.dart';

class InfoVaksinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildCard('Sinovac'),
              BuildCard("Astrazeneca")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildCard('Sinopharm'),
              BuildCard('Moderna')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildCard('Pfizer'),
              BuildCard('Novavax')
            ],
          )
        ],
      )
    );
  }

  Card BuildCard(String namavaksin) {
    return Card(
              color: Color(0xffffb1b1),
              elevation: 5,
              child: SizedBox(
                height: 120,
                width: 120,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    namavaksin,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
                ),
              ),
            );
  }
}
