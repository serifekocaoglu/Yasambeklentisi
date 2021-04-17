import 'package:flutter/material.dart';
import 'package:flutter_app/constansts.dart';
import 'package:flutter_app/user_data.dart';
import 'package:flutter_app/hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sonuç Sayfası')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
                Hesap(_userData).hesaplama().round().toString(),
              style: kMetinStili,
            )),

          ),
          Expanded(
            flex: 1,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context,
                  );
                },
                child: Text(
                  'GERİ DÖN',
                  style: kMetinStili,
                ),))
        ],
      ),
    );
  }
}