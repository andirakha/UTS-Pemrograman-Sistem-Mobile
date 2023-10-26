import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

const double pi = 3.1415926535897932;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? heading = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 135, 135),
        centerTitle: true,
        title: Text("Kompas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${heading!.ceil()}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/cadrant.png"),
                Transform.rotate(
                  angle: ((heading ?? 0) * (pi / 180) * -1),
                  child: Image.asset(
                    "assets/compass.png",
                    scale: 1.1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
