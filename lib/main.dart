import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fontlu Sayac',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  double fontSize = 50;
//Sayacın renk bölümü 0 dan kucukse kırmızı buyukse pembe
  Color _TextColor(int count) {
    if (count > 0) {
      return Colors.pink;
    } else if (count == 0) {
      return Colors.black;
    } else {
      return Colors.red;
    }
  }

//Font büyütme(2 font)
  void incrementFontsize() {
    setState(() {
      fontSize += 2;
    });
  }

//Font küçültme (2 font)
  void decrementFontsize() {
    setState(() {
      fontSize -= 2;
    });
  }

//Sayac degerini 1 arttırır
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

//Sayac degeri 1 düşürür
  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  //Appbar 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fontlu Sayac'),
        //Font tusları
        actions: [
          IconButton(
            onPressed: incrementFontsize,
            icon: Icon(Icons.arrow_circle_up),
          ),
          IconButton(
            onPressed: decrementFontsize,
            icon: Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
      //boddy
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sayaç',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: fontSize,
                // Yazının renginin belirlendigi kısım.
                color: _TextColor(counter),
              ),
            ),
            //Sayı degerini yükselmemize yarayan butonlar
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: incrementCounter,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: decrementCounter,
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}