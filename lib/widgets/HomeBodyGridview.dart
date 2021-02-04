import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/BosEvTemizligi.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/HaliYikama.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/EvTemizligi.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/PerdeYikama.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/KoltukYikama.dart';
import 'package:temizlik_kapinda_app/screens/HizmetlerIcerikSayfalari/OfisTemizligi.dart';
class HomeTabbar extends StatefulWidget {
  @override
  _HomeTabbarState createState() => _HomeTabbarState();
}

class _HomeTabbarState extends State<HomeTabbar> {
  List cardNames = [
    'Ev Temizliği',
    'Ofis Temizliği',
    'Boş Ev Temizliği',
    'Halı Yıkama',
    'Perde Yıkama',
    'Koltuk Yıkama',
  ];
  List cardIcons = [
    'assets/icons/ev.png',
    'assets/icons/ofis.png',
    'assets/icons/firca.png',
    'assets/icons/hali.png',
    'assets/icons/perde.png',
    'assets/icons/koltuk.png',
  ];

  int checkedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
        ),
        Text("data"),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemCount: cardNames.length,
          itemBuilder: (BuildContext context, int index) {
            return buildCard(index);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
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
                if (checkedIndex==0)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EvTemizligi()));

                if(checkedIndex==1)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OfisTemizligi()));
                if(checkedIndex==2)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BosEvTemizligi()));
                if(checkedIndex==3)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HaliYikama()));
                if(checkedIndex==4)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PerdeYikama()));
                if(checkedIndex==5)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>KoltukYikama()));
              },
            ),
          ),

        )
      ],
    );
  }

  Widget buildCard(int index) {
    bool checked = index == checkedIndex;
    //String name = cardNames[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedIndex = index;
          print(index);
          print("c"+checkedIndex.toString());
        });
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: checked ? Colors.orange : Colors.white,
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.12,
                  child: Center(
                      child: Container(
                        child: Image.asset(
                          cardIcons[index],
                        ),
                        height: 50,
                      )),
                ),
                Text(cardNames[index]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
class HomeTabbar extends StatelessWidget {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("TEMIZLIKYOLDA.COM"),
        GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          shrinkWrap: true,
          children: [
            EvTemizligi(),
            OfisTemizligi(),
            BosEvTemizligi(),
            Dezenfeksiyon(),
            Ilaclama(),
            IsBasvurusu()
          ],
        ),
      ],
    );
  }
}
*/
