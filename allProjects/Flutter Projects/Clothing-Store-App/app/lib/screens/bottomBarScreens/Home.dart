import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import '/screens/otherScreens/pro.dart';
import '/screens/otherScreens/showdetails.dart';
import '/utils/likeanimation.dart';
import '/utils/pickImages.dart';
import '/utils/textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/utils/textfield.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/utils/textfield.dart';
import '/database/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import "package:firebase_storage/firebase_storage.dart";

int active_index = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final images = [
    'assets/sh11.jpg',
    'assets/sh2.jpg',
    'assets/sh3.jpg',
    'assets/sh4.jpg',
  ];

  TextEditingController userSearchController = TextEditingController();
  Uint8List? file;
  String username = '';
  late AnimationController _controller;
  late Animation _coloranimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    _coloranimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  addData() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextEditingController userpasswordController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    Map<String, dynamic> userData =
        Provider.of<UserProvider>(context).userModel;
    String name = userData['username'] ?? 'Default Name';
    String email = userData['email'] ?? 'Default Email';
    String avatarUrl = userData['profileImageUrl'] ??
        'https://images.mubicdn.net/images/cast_member/286407/cache-139299-1463178721/image-w856.jpg?size=256x';
    return Scaffold(
      backgroundColor: ThemeUI.darker,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeUI.darker),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        "Hello !",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ThemeUI.texto),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ThemeUI.texto),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeUI.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/order');
                      },
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeUI.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.90,
                height: 50,
                decoration: BoxDecoration(
                  color: ThemeUI.light,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(top: 7, bottom: 3, left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: ThemeUI.textogr,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width:
                            280, // Adjusted width to accommodate the text field
                        child: Align(
                          child: TextField(
                            controller: userSearchController,
                            decoration: InputDecoration(
                              hintText: 'Search here',
                              hintStyle: TextStyle(color: ThemeUI.textogr),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(color: ThemeUI.textogr),
                            maxLines: 1,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                width: size.width * 0.90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: ThemeUI.light,
                    child: CarouselSlider.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index, realIndex) {
                        return BuildImages(imagee: images[index]);
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: false,
                        viewportFraction: 1.1,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        autoPlayAnimationDuration: Duration(microseconds: 50),
                        autoPlay: true,
                        reverse: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayCurve: Curves.decelerate,
                        height: 180,
                        onPageChanged: (index, reason) {
                          setState(() {
                            active_index = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              indicator(index: images.length),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text(
                                  'Featured',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Pro(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ThemeUI.primary,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('products')
                                .snapshots(),
                            builder: (
                              context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot,
                            ) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: ThemeUI.primary,
                                  ),
                                );
                              }
                              return SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return buildAdvertise(
                                      image: snapshot.data!.docs[index]
                                          ['photourl'],
                                      title: snapshot.data!.docs[index]
                                          ['title'],
                                      price: snapshot.data!.docs[index]
                                          ['price'],
                                      discription: snapshot.data!.docs[index]
                                          ['description'],
                                      like: snapshot.data!.docs[index],
                                      index: index,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      'Most Popular',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Pro(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ThemeUI.primary,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('products')
                                .snapshots(),
                            builder: (
                              context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot,
                            ) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                );
                              }
                              return SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return buildAdvertise(
                                      image: snapshot.data!.docs[index]
                                          ['photourl'],
                                      title: snapshot.data!.docs[index]
                                          ['title'],
                                      price: snapshot.data!.docs[index]
                                          ['price'],
                                      discription: snapshot.data!.docs[index]
                                          ['description'],
                                      like: snapshot.data!.docs[index],
                                      index: index,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
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

class buildAdvertise extends StatefulWidget {
  final int index;
  final String title;
  final String price;
  final discription;
  final image;
  final like;
  const buildAdvertise({
    super.key,
    required this.index,
    required this.price,
    required this.title,
    required this.image,
    required this.discription,
    required this.like,
  });

  @override
  State<buildAdvertise> createState() => _buildAdvertiseState();
}

class _buildAdvertiseState extends State<buildAdvertise> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => showDetails(
              title: widget.title,
              discription: widget.discription,
              price: widget.price,
              images: widget.image,
              indexs: widget.index,
              like: widget.like,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: ThemeUI.lighter,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.image,
                              ),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Positioned(
                        right: 0,
                        child: likeAnimation(
                          product: widget.like,
                          snap: FirebaseAuth.instance.currentUser!,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ThemeUI.texto,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '\$${widget.price}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ThemeUI.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildImages extends StatelessWidget {
  final String imagee;
  const BuildImages({super.key, required this.imagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagee), fit: BoxFit.cover),
      ),
    );
  }
}

class indicator extends StatelessWidget {
  final int index;
  const indicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        activeIndex: active_index,
        count: index,
        effect: JumpingDotEffect(
            activeDotColor: ThemeUI.primary, dotColor: ThemeUI.light));
  }
}
