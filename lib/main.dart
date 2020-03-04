import 'package:algorithm_visualizer/algorithms.dart';
import 'package:algorithm_visualizer/data.dart';
import 'package:flutter/material.dart';
import 'package:algorithm_visualizer/visualizer_container.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int dataSetLength = 200;
  Data data;
  Algorithms algorithms;
  String _currentAlgo;

  @override
  void initState() {
    super.initState();

    data = Data(length: dataSetLength);
    data.randomize();
    algorithms = Algorithms(
      data: data,
      delay: 999,
    );
    _currentAlgo = "Bubble Sort";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () => getAlgorithm(),
                child: Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => data.randomize(),
                child: Text(
                  "Radomize",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    _currentAlgo,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton(
                    items: <String>[
                      'Bubble Sort',
                      'Merge Sort',
                      'Selection Sort'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _currentAlgo = value;
                      });
                    },
                  ),
                )
              ],
            ),
//            SizedBox(height: 15),
            VisualizerContainer(
              height: height,
              width: width / dataSetLength,
              size: dataSetLength,
              numbers: data.numbers,
            ),
          ],
        ),
      ),
    );
  }

  getAlgorithm() async {
    switch(_currentAlgo) {
      case "Bubble Sort":
        await algorithms.bubbleSort();
        break;
      case "Merge Sort":
        await algorithms.mergeSort(0, dataSetLength);
        break;
      default:
        break;
    }
  }
}
