import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:provider/provider.dart';
import 'cookierequest.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage(),
        '/redirect': (BuildContext context) => new HomePage(),
      },
      home: new MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class Getter {
  static bool finale = false;
}

class _MyLoginPageState extends State<MyLoginPage> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return new Scaffold(
        body: SingleChildScrollView(
      //untuk menghindari overflow dibawah
      padding: EdgeInsets.all(32),
      reverse:
          true, // untuk membuat page ke paling bawah saat keyboard dimunculkan
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0.0),
                  child: Text('/',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50.0, 60.0, 0.0, 0.0),
                  child: Text('VAKS',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 125.0, 0.0, 0.0),
                  child: Text('INFO',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(205.0, 125.0, 0.0, 0.0),
                  child: Text('/',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        labelText: 'USERNAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: myController2,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () async {
                          username = myController.text;
                          password1 = myController2.text;
                          // 'username' and 'password' should be the values of the user login form.
                          final response = await request.login(
                              "https://vaksinfo.herokuapp.com/authentication/",
                              {
                                'username': username,
                                'password': password1,
                              });
                          Getter.finale = request.loggedIn;
                          if (request.loggedIn) {
                            // Code here will run if the login succeeded.
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 5),
                              content: Text(
                                  "Berhasil login, silahkan kembali ke halaman anda dengan menekan menu disamping"),
                              backgroundColor: Colors.green,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            // Code here will run if the login failed (wrong username/password).
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 5),
                              content: Text("Email atau Password salah!"),
                              backgroundColor: Colors.red,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              )),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Belum punya akun ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Daftar disini',
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
