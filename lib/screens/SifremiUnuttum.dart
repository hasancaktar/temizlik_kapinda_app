import 'package:flutter/material.dart';

class SifremiUnuttumScreen extends StatefulWidget {
  @override
  _SifremiUnuttumScreenState createState() => _SifremiUnuttumScreenState();
}

class _SifremiUnuttumScreenState extends State<SifremiUnuttumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 30),
            child: Text("temizlikkapında.com"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "E-posta"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Şifremi unttum"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {},
                child: Text("Şifremi Unuttum"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Giriş yap"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
