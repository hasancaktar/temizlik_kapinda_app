import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor.dart';
import 'package:temizlik_kapinda_app/screens/Login.dart';

class EvTemizligi extends StatefulWidget {
  const EvTemizligi({
    Key key,
  }) : super(key: key);

  @override
  _EvTemizligiState createState() => _EvTemizligiState();
}

class _EvTemizligiState extends State<EvTemizligi> {
  int checkedIndexHizmetSuresi = 0;
  int checkedIndexTemizlemeSikligi = 0;

  List<int> saatler = [
    4,
    5,
    6,
    7,
    8,
    9,
  ];
  List<String> temizlemeSikligi = [
    "Tek Seferlik",
    "Paketler",
  ];
  int _n = 1;
  void add() {
    setState(() {
      if(_n==10)
        _n;
      else
      _n++;

      print(_n);
    });
  }
  void minus() {
    setState(() {
      if (_n != 1)
        _n--;
      print(_n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Center(child: Text("Ürün Seçiniz")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Hemen Sipariş Ver!",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Column(
              children: [
                Text(
                  "Hizmet Süresi Seçin",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                hizmetSuresiGridView(6)
              ],
            ),
            Column(
              children: [
                Text(
                  "Hnagi Sıklıkla Temizlensin",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                temizlemeSikligiGridView(2)
              ],
            ),
            Column(
              children: [
                Text(
                  "Personel Sayısı",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  child: new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new FloatingActionButton(heroTag: "btn1",
                          onPressed: minus,
                          child: new Icon(Icons.remove,color: Colors.black,
                          ),
                          backgroundColor: Colors.white,),

                        new Text('$_n',
                            style: new TextStyle(fontSize: 60.0)),

                        new FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: add,
                          child: new Icon(Icons.add,color: Colors.black,
                              ),
                          backgroundColor: Colors.white,),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Toplam Tutar:"),
                Text("0.00 TL"),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(width: MediaQuery
                  .of(context)
                  .size
                  .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.07,
                child: RaisedButton(
                  child: Text("Devam Et",
                    style: TextStyle(fontSize: 25, color: Colors.white),),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                  },
                ),
              ),

            )

          ],
        ),
      ),
    );
  }

  GridView hizmetSuresiGridView(int count) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        bool checked = index == checkedIndexHizmetSuresi;
        // String name = cardNames[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              checkedIndexHizmetSuresi = index;
              print(index);
              print("c" + checkedIndexHizmetSuresi.toString());
            });
          },
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: checked ? Colors.orange : Colors.white,
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        "${saatler[index].toString()}\nsaat",
                      ),
                    ),
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: saatler.length,
      ),
    );
  }

  GridView temizlemeSikligiGridView(int count) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        bool checked = index == checkedIndexTemizlemeSikligi;
        // String name = cardNames[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              checkedIndexTemizlemeSikligi = index;
              print(index);
              print("c" + checkedIndexTemizlemeSikligi.toString());
            });
          },
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: checked ? Colors.orange : Colors.white,
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        temizlemeSikligi[index],
                      ),
                    ),
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
