import 'package:flutter/material.dart';

class DocsPage extends StatelessWidget {
  const DocsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Docs',
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        ),
      ),
    );
  }
}
