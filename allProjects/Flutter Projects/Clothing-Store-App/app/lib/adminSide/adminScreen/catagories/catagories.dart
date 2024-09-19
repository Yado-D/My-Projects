import 'package:flutter/widgets.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';

import '/adminSide/adminScreen/products/products.dart';
import '/utils/collections.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: ThemeUI.darker),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ThemeUI.texto,
                      ),
                      iconSize: 26,
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      'Catagories',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ThemeUI.texto),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    CategoryCard(
                      imageIndex: 0,
                      title: 'Mens',
                    ),
                    CategoryCard(
                      imageIndex: 2,
                      title: 'Kids',
                    ),
                    CategoryCard(
                      imageIndex: 1,
                      title: 'Womens',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final int imageIndex;
  final String title;

  const CategoryCard({
    Key? key,
    required this.imageIndex,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 190,
        width: 200,
        child: Card(
          elevation: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Replace the onTap logic with the intended navigation
                  if (title == 'Mens') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => products(
                                title: title,
                                filter: 'men',
                              )),
                    );
                  } else if (title == 'Kids') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => products(
                                title: title,
                                filter: 'kid',
                              )),
                    );
                  } else if (title == 'Womens') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => products(
                                title: title,
                                filter: 'women',
                              )),
                    );
                  }
                },
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        collection().im[imageIndex],
                      ),
                    ),
                  ),
                ),
              ),
              Text(title),
              IconButton(
                onPressed: () {
                  // Handle delete logic here
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
