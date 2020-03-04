import 'package:flutter/material.dart';

class BottomRow extends StatefulWidget {
  BottomRow({Key key}) : super(key: key);

  @override
  _BottomRowState createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: FlatButton(
              child: Text(
                "Start",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            child: FlatButton(
              child: Text(
                "Randomize",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            child: FlatButton(
              child: Text(
                "Speed",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
