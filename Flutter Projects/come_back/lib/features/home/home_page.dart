import "package:come_back/features/posts/postPage.dart";
import "package:flutter/material.dart";


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: post_page(),
    );
  }
}
