import 'package:flutter/material.dart';

class DestekScreen extends StatefulWidget {
  @override
  _DestekScreenState createState() => _DestekScreenState();
}

class _DestekScreenState extends State<DestekScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Center(child: Text("İletişim")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:30.0),
            child: Text("Temizlikkapında.com"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Whatsapp",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Çağrı Merkezi",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                       EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Center(
                        child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 70,
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 50),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Center(
                        child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 70,
                    )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
