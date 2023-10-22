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
  late MapZoomPanBehavior _mapZoomPanBehavior;
  @override
  void initState() {
    _mapZoomPanBehavior=
        MapZoomPanBehavior(
            focalLatLng: MapLatLng(-20, 147),
          zoomLevel: 3,
        enableDoubleTapZooming: true,
        enablePinching: true ,
        minZoomLevel: 3,
        maxZoomLevel: 7);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: SfMaps(
            layers: [
              MapTileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                zoomPanBehavior: _mapZoomPanBehavior,
              )
            ],
          )
          )
    )
    );

  }

}


