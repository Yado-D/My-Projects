import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';

import '/screens/otherScreens/filter.dart';
import '/screens/otherScreens/showdetails.dart';
import '/utils/likeanimation.dart';
import '/utils/shimmerwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isShowData = false;
  bool isfinished = false;

  Future<QuerySnapshot<Object?>> performSearchAndFilter(String searchQuery,
      [String gender = '', String color = '']) {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('products');
    Query filteredQuery = usersRef;

    if (gender.isNotEmpty) {
      filteredQuery = filteredQuery.where('gender', isEqualTo: gender);
    }

    if (color.isNotEmpty) {
      filteredQuery = filteredQuery.where('color', isEqualTo: color);
    }

    filteredQuery = filteredQuery
        .where('title', isGreaterThanOrEqualTo: searchQuery)
        .where('title', isLessThan: searchQuery + 'z');

    return filteredQuery.orderBy('title').get();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = {};
    if (ModalRoute.of(context)!.settings.arguments != null) {
      arguments =
          ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    }

    return Scaffold(
      backgroundColor: ThemeUI.darker,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeUI.darker),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                isShowData = true;
                                print(arguments["color"]);
                                print(arguments["gender"]);
                              });
                            },
                            style: TextStyle(color: ThemeUI.texto),
                            decoration: InputDecoration(
                              focusColor: ThemeUI.texto,
                              fillColor: ThemeUI.texto,
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.search,
                                  color: ThemeUI.texto,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  searchController.clear();
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: ThemeUI.texto,
                                ),
                              ),
                              hintText: 'search here',
                              hintStyle: TextStyle(color: ThemeUI.textogr),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Results for\" ${searchController.text}\"',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeUI.textogr),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ThemeUI.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(2),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/filter',
                                    arguments: searchController.text);
                              },
                              child: Text(
                                'Filter',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    searchController.text != ''
                        ? FutureBuilder(
                            future: arguments["gender"] != null ||
                                    arguments["color"] != null
                                ? performSearchAndFilter(
                                    searchController.text,
                                    arguments["color"] as String,
                                    arguments['gender'] as String)
                                : performSearchAndFilter(searchController.text),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    children: List.generate(
                                      7,
                                      (index) => const shimmer(),
                                    ),
                                  ),
                                );
                              }
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 40,
                                    crossAxisSpacing: 5,
                                    children: List.generate(
                                        snapshot.data!.docs.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => showDetails(
                                                indexs: index,
                                                title: snapshot
                                                    .data!.docs[index]['title'],
                                                price: snapshot
                                                    .data!.docs[index]['price'],
                                                images: snapshot.data!
                                                    .docs[index]['photourl'],
                                                discription: snapshot.data!
                                                    .docs[index]['description'],
                                                like:
                                                    snapshot.data!.docs[index],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(7),
                                          height: 80,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 110,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['photourl'],
                                                        ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 5,
                                                    child: likeAnimation(
                                                      product: snapshot
                                                          .data!.docs[index],
                                                      snap: FirebaseAuth
                                                          .instance
                                                          .currentUser!,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['title'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$${snapshot.data!.docs[index]['price']} ',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                ThemeUI.primary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    ClipOval(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: Material(
                                                        color: ThemeUI.primary,
                                                        child: IconButton(
                                                          onPressed: () async {
                                                            setState(() {
                                                              isfinished =
                                                                  false;
                                                            });
                                                            String res =
                                                                await authMethod()
                                                                    .toCart(
                                                              imageurl: snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['photourl'],
                                                              title: snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['title'],
                                                              price: snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['price'],
                                                            );
                                                            setState(() {
                                                              isfinished = true;
                                                            });
                                                            if (res ==
                                                                'success') {
                                                              showSnack(
                                                                  'Added to cart',
                                                                  context);
                                                            } else {
                                                              showSnack(
                                                                  'some error occured.cheak your connection',
                                                                  context);
                                                            }
                                                            setState(() {
                                                              isfinished = true;
                                                            });
                                                          },
                                                          icon: Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            },
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              children: List.generate(
                                7,
                                (index) => const shimmer(),
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
