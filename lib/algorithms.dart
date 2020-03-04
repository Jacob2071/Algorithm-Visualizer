import 'dart:async';

import 'package:algorithm_visualizer/data.dart';

class Algorithms {
  Data data;
  int delay;

  Algorithms({this.data, this.delay});

  Future<void> bubbleSort() async {
    for (int i = 0; i < data.numbers.length; i++) {
      for (int j = 0; j < data.numbers.length - 1 - i; j++) {
        if (data.numbers[j] > data.numbers[j + 1]) {
          int t = data.numbers[j];
          data.numbers[j] = data.numbers[j + 1];
          data.numbers[j + 1] = t;
        }
        await Future.delayed(Duration(microseconds: delay));
        streamController.add(data.numbers);
      }
    }
  }

  mergeSort(int leftIndex, int rightIndex) async {
    Future<void> merge(int leftIndex, int middleIndex, int rightIndex) async {
      int leftSize = middleIndex - leftIndex + 1;
      int rightSize = rightIndex - middleIndex;

      List leftList = new List(leftSize);
      List rightList = new List(rightSize);

      for (int i = 0; i < leftSize; i++)
        leftList[i] = data.numbers[leftIndex + i];
      for (int j = 0; j < rightSize; j++)
        rightList[j] = data.numbers[middleIndex + j + 1];

      int i = 0,
          j = 0;
      int k = leftIndex;

      while (i < leftSize && j < rightSize) {
        if (leftList[i] <= rightList[j]) {
          data.numbers[k++] = leftList[i++];
        } else {
          data.numbers[k++] = rightList[j++];
        }

        await Future.delayed(Duration(microseconds: delay + 2000));
        streamController.add(data.numbers);
      }

      while (i < leftSize) {
        data.numbers[k++] = leftList[i++];

        await Future.delayed(Duration(microseconds: delay + 2000));
        streamController.add(data.numbers);
      }

      while (j < rightSize) {
        data.numbers[k++] = rightList[j++];

        await Future.delayed(Duration(microseconds: delay + 2000));
        streamController.add(data.numbers);
      }
    }

    if (leftIndex < rightIndex) {
      int middleIndex = (rightIndex + leftIndex) ~/ 2;

      await mergeSort(leftIndex, middleIndex);
      await mergeSort(middleIndex + 1, rightIndex);

      await Future.delayed(Duration(microseconds: delay + 2000));

      streamController.add(data.numbers);

      await merge(leftIndex, middleIndex, rightIndex);
    }
  }

  Future<void> quickSort() async {}

  void selectionSort() {}
}
