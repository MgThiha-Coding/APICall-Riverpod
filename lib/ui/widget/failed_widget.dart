import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final String errorMessage;
  const FailedWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage.toString(),
        style: TextStyle(color: Colors.red, fontSize: 19),
      ),
    );
  }
}
