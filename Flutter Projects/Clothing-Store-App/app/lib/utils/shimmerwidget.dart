import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shimmer/shimmer.dart';

class shimmer extends StatelessWidget {
  const shimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: ThemeUI.light,
        highlightColor: ThemeUI.lighter,
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
}
