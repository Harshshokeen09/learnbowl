import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('LEARN BOWL',
        style: TextStyle(
          color: Colors.red,
          fontSize: 100,
          fontWeight: FontWeight.bold
        ),
      )),
    );
  }
}
