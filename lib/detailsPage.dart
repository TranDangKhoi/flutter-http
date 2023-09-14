import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details Page"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Press me"),
            onPressed: () {
              goBack(context);
            },
          ),
        ));
  }

  goBack(context) {
    Navigator.pop(context);
  }
}
