import 'dart:async';
import 'dart:math';

StreamController<List<int>> streamController = StreamController();

class Data {
  List<int> numbers = [];
  int length;

  Data({this.length});

  randomize() {
    numbers = [];
    for (int i = 0; i < length; i++) {
      numbers.add(Random().nextInt(length));
    }
    streamController.add(numbers);
  }
}
