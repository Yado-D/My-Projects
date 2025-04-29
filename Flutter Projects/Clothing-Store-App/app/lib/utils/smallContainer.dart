import 'package:flutter/material.dart';

class smallcont extends StatelessWidget {
  final ontapp;
  final images;
  const smallcont({
    super.key,
    required this.ontapp,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontapp,
        child: Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Image.asset(
            images,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
