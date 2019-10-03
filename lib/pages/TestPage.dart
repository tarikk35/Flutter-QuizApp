import 'package:flutter/material.dart';
import 'package:quiz_app/models/User.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _func,
          child: Text('CLICK'),
        ),
      ),
    );
  }

  void _func() {
    Map<String,dynamic> map = {
      'id': 'Id8',
      'token': 'Token8',
      'email': 'a',
      'fullName': 'Alp İmrek',
      'imageUrl': null,
      'totalScore': 92,
      'results': null
    };
    final item = User.fromJson(map);
    print(item.categorySuccess.artSuccess);
  }
}
