import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/screens/first-page.dart';
import 'package:shega_cloth_store_app/screens/otherScreens/checkout.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';
import 'package:shega_cloth_store_app/utils/summeryProduct.dart';

class productScreen extends StatefulWidget {
  const productScreen({
    super.key,
  });

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  int items = 0;
  int subtotal = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeUI.darker,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ThemeUI.textogr,
                  ), // Assuming 'icon' is already defined elsewhere
                ),
                SizedBox(
                  width: 120,
                ),
                Center(
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      color: ThemeUI.texto,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 30,
              color: ThemeUI.texto,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeUI.darker),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 370,
                    color: ThemeUI.lighter,
                    child: ListView(
                      children: [
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('cart')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('cart')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ThemeUI.primary,
                                ),
                              );
                            }
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              height: 410,
                              child: ListView.builder(
                                itemCount:
                                    (snapshot.data! as dynamic).docs.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['imageurl'],
                                                      ),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 20),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['title'],
                                                      style: TextStyle(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "\$${snapshot.data!.docs[index]['price']}",
                                                      style: TextStyle(
                                                        color: ThemeUI.primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await authMethod()
                                                      .deletingcarts(
                                                    snapshot.data!.docs[index]
                                                        ['userId'],
                                                  );

                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              first(
                                                                page: 2,
                                                              )));

                                                  showSnack(
                                                      'Deleted!', context);
                                                },
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  size: 40,
                                                  color: Color.fromARGB(
                                                      255, 222, 118, 122),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Row(
                                                  children: [
                                                    // ClipOval(
                                                    //   child: Material(
                                                    //     color: Color(0xffB81736),
                                                    //     child: IconButton(
                                                    //       onPressed: () {},
                                                    //       icon: Icon(
                                                    //         color: Colors.white,
                                                    //         size: 30,
                                                    //         Icons.minimize_outlined,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    // SizedBox(
                                                    //   width: 20,
                                                    // ),
                                                    // ClipOval(
                                                    //   child: Material(
                                                    //     color: Color(0xffB81736),
                                                    //     child: IconButton(
                                                    //       onPressed: () {},
                                                    //       icon: Icon(
                                                    //         Icons.add,
                                                    //         color: Colors.white,
                                                    //         size: 30,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 9),
              summery(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: MaterialButton(
                  height: 60,
                  minWidth: 300,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => checkOut(),
                      ),
                    );
                  },
                  color: ThemeUI.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ThemeUI.darker,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
