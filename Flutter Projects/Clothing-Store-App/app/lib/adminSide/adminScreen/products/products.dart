import 'package:shega_cloth_store_app/adminSide/tool.dart';

import '/adminSide/adminScreen/products/addingProduct.dart';
import '/adminSide/adminScreen/products/editPro.dart';
import '/adminSide/adminScreen/products/bottomsheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class products extends StatelessWidget {
  var title;
  var filter;
  products({super.key, required this.title, this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: StreamBuilder(
        stream: filter != null
            ? FirebaseFirestore.instance.collection('products').snapshots()
            : FirebaseFirestore.instance
                .collection('products')
                .where('gender', isEqualTo: this.filter)
                .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(color: ThemeUI.darker),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        return GestureDetector(
                          child: Container(
                            height: 200,
                            width: 250,
                            child: Card(
                              elevation: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          snapshot.data!.docs[index]
                                              ['photourl'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['title'],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => EditProduct(
                                                snap:
                                                    snapshot.data!.docs[index],
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showBottom(
                                            context,
                                            snapshot.data!.docs[index]
                                                ['userID'],
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => addPro(),
                          ),
                        );
                      },
                      backgroundColor: ThemeUI.primary,
                      child: Icon(
                        Icons.add,
                      ),
                      foregroundColor: ThemeUI.darker,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
