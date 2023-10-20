import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MapShapeSource _shapeSource;
  late List<MapModel> _mapData;

  @override
  void initState() {
    _mapData = _getMapData();
    _shapeSource = MapShapeSource.asset('assets/malaysia.json',
        shapeDataField: 'shapeName',
        dataCount: _mapData.length,
        primaryValueMapper: (int index) => _mapData[index].state,
        dataLabelMapper: (int index) => _mapData[index].stateCode,
        shapeColorValueMapper: (int index) => _mapData[index].color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  'Malaysia Map',
                style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: SfMaps(
                      layers: <MapShapeLayer>[
                       MapShapeLayer(
                      source: _shapeSource,
                      showDataLabels: true,
                )
              ],
            ),
          ),
        )
            ],
    ),
    );
  }
  static List<MapModel> _getMapData(){
    return <MapModel> [
      MapModel('Selangor', 'Selangor', Colors.amber),
      MapModel('Johor', 'Johor', Colors.cyan),
      MapModel('Kuala Lumpur', 'Kuala Lumpur', Colors.amber),
      MapModel('Malacca', 'Malacca', Colors.red),
      MapModel('Negeri Sembilan', 'Negeri /n Sembilan', Colors.purple),
      MapModel('Sabah', 'Sabah', Colors.lightGreenAccent),
      MapModel('Sarawak', 'Sarawak', Colors.indigo),
      MapModel('Kelantan', 'Kelantan', Colors.lightBlue),
      MapModel('Putrajaya', 'Putrajaya', Colors.lightBlue),
      MapModel('Terengganu', 'Terengganu', Colors.orange),
      MapModel('Pahang', 'Pahang', Colors.yellow),
      MapModel('Kedah', 'Kedah', Colors.grey),
      MapModel('Perlis', 'Perlis', Colors.blueGrey),
      MapModel('Perak', 'Perak', Colors.lightGreen),
      MapModel('Penang', 'Penang', Colors.pink),
      MapModel('Labuan', 'Labuan', Colors.purple)];
  }

}


class MapModel{
  MapModel(this.state, this.stateCode, this.color);
  String state;
  String stateCode;
  Color color ;

}
