import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Data {
  final String destino;
  final double distancia;
  final double elevacao;

  Data(this.destino, this.distancia, this.elevacao);
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final pedaladas = [
    BikeTrail('Peirópolis', 51.8, 529, key: UniqueKey(),),
    BikeTrail('Ponte do Golfo', 103.0, 978, key: UniqueKey(),),
    BikeTrail('Santa Rosa', 54.5, 639, key: UniqueKey(),),
    BikeTrail('Vale Encantado', 62.2, 875, key: UniqueKey(),),
    BikeTrail('Estação Batuíra', 45.3, 554, key: UniqueKey(),),
    BikeTrail('Cascalheira', 51.7, 575, key: UniqueKey(),),
    BikeTrail('Capelinha', 57.3, 413, key: UniqueKey(),),
    BikeTrail('IFTM', 25.0, 345, key: UniqueKey(),),
    BikeTrail('Serrinha', 56.1, 646, key: UniqueKey(),),
    BikeTrail('Mirante', 60.1, 690, key: UniqueKey(),),
  ];

  final List<BikeTrail> pedaladas_add = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Icon(Icons.directions_bike_outlined),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text('CICLISMO'),
              ),
            ],
          ),
        ),
        body: ListView(
          children: pedaladas_add,
          key: UniqueKey(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState((){
              pedaladas_add.add(pedaladas.removeAt(0));
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class BikeTrail extends StatelessWidget {
  final String destino;
  final double distancia;
  final double elevacao;

  const BikeTrail(this.destino, this.distancia, this.elevacao, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: Colors.lightGreen[100],
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 350,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.location_on_sharp),
                  ),
                  Text(
                    'Destino: $destino',
                    style: TextStyle(
                        fontSize: 24, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 350,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.route),
                  ),
                  Text(
                    'Distância: $distancia Km',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 350,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.terrain),
                  ),
                  Text(
                    'Elevação: $elevacao m',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}