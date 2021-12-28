import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'artikel.dart';
import 'main.dart';
import 'package:provider/provider.dart';
import 'cookierequest.dart';
import 'login.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyDashboardPage(),
    );
  }
}

class MyDashboardPage extends StatefulWidget {
  @override
  _MyDashboardPageState createState() => new _MyDashboardPageState();
}

class getRequest {
  static var request = null;
}

class _MyDashboardPageState extends State<MyDashboardPage> {
  var currentPage = DrawerSections.dashboard;
  int activeIndex = 0;
  final urlImages = [
    'assets/images/berita2.jpeg',
    'assets/images/berita3.jpeg',
    'assets/images/berita4.jpeg'
  ];
  String colorGroupValue = '';
  var loggedIn2 = Getter.finale;

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  String nama = "";
  String email = "";
  String komentar = "";

  @override
  Widget build(BuildContext context) {
    var container;
    getRequest.request = context.watch<CookieRequest>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1,
                  autoPlay: true,
                  pageSnapping: false,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  // reverse: true,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: urlImages.length,
                itemBuilder: (context, index,realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
              ),
              const SizedBox(height: 20),
              buildIndicator(),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Baca artikel lebih lanjut ',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 4.0),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, '/artikel');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ArtikelPage()),); // Masih belum mau ke page artikel sesungguhnya
                        currentPage = DrawerSections.artikel;
                        container = ArtikelPage();

                      },
                      child: Text(
                        'di sini',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Text(
                    'Sekilas Mengenai VAKSINFO ',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting \nindustry. Lorem Ipsum has been the industrys standard dummy \ntext ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
                child: Center(
                  child: Text(
                    'Feedback Form',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: "Masukkan nama Anda",
                        labelText: "Nama",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 25.0)),
                    TextField(
                      controller: myController2,
                      decoration: InputDecoration(
                        hintText: "Masukkan alamat e-mail Anda",
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 25.0)),
                    TextField(
                      maxLines: 10,
                      controller: myController3,
                      decoration: InputDecoration(
                        hintText: "Ceritakan apa yang Anda alami",
                        labelText: "Komentar",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 25.0)),
                    Row(
                        children: <Widget> [
                          Radio(
                              value: 'TP',
                              groupValue: colorGroupValue,
                              onChanged: (val) {
                                setState(() {
                                  colorGroupValue = val as String;
                                });

                              }
                          ),
                          Text("Tidak Puas :("),
                        ]
                    ),
                    Row(
                        children: <Widget> [
                          Radio(
                              value: 'P',
                              groupValue: colorGroupValue,
                              onChanged: (val) {
                                setState(() {
                                  colorGroupValue = val as String;
                                });
                              }
                          ),
                          Text("Puas :)"),
                        ]
                    ),
                    Padding(padding: EdgeInsets.only(top: 25.0)),
                    buildButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.grey,
    ),
    width: double.infinity,
    child: Image.asset(
      urlImage,
      fit: BoxFit.cover,
    ),

  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: SlideEffect(
        dotWidth: 15,
        dotHeight: 5,
        activeDotColor: Color(0xffffb1b1),
        dotColor: Colors.black12,
      )
  );

  Widget buildButton() => OutlinedButton(
    style: OutlinedButton.styleFrom(
      shape: StadiumBorder(),
      side: BorderSide(width: 2, color: Colors.indigo),
    ),
    child:
    Text('SUBMIT',
      style: TextStyle(
        fontSize: 16,
        color: Colors.indigo,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      nama = myController.text;
      email = myController2.text;
      komentar = myController3.text;
      final response = await getRequest.request.login(
          "https://vaksinfo.herokuapp.com/authentication/feedbackjson",
          jsonEncode(<String, String>{
            'nama': nama,
            'email': email,
            'komentar': komentar,
          }));
      print(response);
      if (loggedIn2) {
        // Kirim data ke json?
        final snackBar = SnackBar(
          duration: const Duration(seconds: 5),
          content: Text(
              "Terima kasih atas feedback yang Anda berikan :)"),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
        myController.clear();
        myController2.clear();
        myController3.clear();
      } else {
        final snackBar = SnackBar(
          duration: const Duration(seconds: 5),
          content: Text("Silakan Login terlebih dahulu dengan menekan menu di samping."),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
        print("Gagal kirim feedback");
      }

    },
  );

  Widget buildSmallButton(bool isDone) {
    final color = isDone ? Colors.green : Color(0xffffb1b1);

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Container(
        width: 30,
        height: 30,
        child: isDone ? Icon(Icons.done, size: 52, color: Colors.white) : CircularProgressIndicator(color: Colors.black, strokeWidth: 4.0),
      ),
    );
  }
}