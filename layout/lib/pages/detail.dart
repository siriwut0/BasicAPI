import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final v1, v2, v3;
  DetailPage(this.v1, this.v2, this.v3);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _v1, _v2, _v3;

  @override
  void initState() {
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(_v1),
            Image.network(_v2),
            Text(_v3),
          ],
        ),
      ),
    );
  }
}
