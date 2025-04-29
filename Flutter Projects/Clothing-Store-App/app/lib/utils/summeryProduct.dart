import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';

class summery extends StatefulWidget {
  const summery({super.key});

  @override
  State<summery> createState() => _summeryState();
}

class _summeryState extends State<summery> {
  List<Map<String, dynamic>> userdata = [];
  var count = 0;
  var price = 0;
  var discount = 0;
  var delivery = 0;

  @override
  Future<List<Map<String, dynamic>>> getDataFromFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Map<String, dynamic>> dataList = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot document in querySnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          dataList.add(data);
        }
      } else {
        print('No documents found in the collection.');
      }
    } catch (e) {
      print('Error retrieving data from Firestore: $e');
    }

    return dataList;
  }

  Future<void> fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = await getDataFromFirestore();
    setState(() {
      price = 0;
      count = 0;
    });
    // Use the dataList variable to access the retrieved data
    for (var data in dataList) {
      int prico = int.parse(data["price"]);
      setState(() {
        price += prico;
        count += 1;
      });
    }
    setState(() {
      discount = (price * 0.15).round();
      delivery = (price * 0.05).round();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchDataFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: TextStyle(
              color: ThemeUI.texto,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
              Text('${count}',
                  style: TextStyle(
                    color: ThemeUI.texto,
                    fontSize: 14,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$${price}',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$${discount}',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$${delivery}',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 4,
            color: const Color.fromARGB(137, 255, 255, 255),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Total',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$${price + delivery - discount}',
                style: TextStyle(
                  color: ThemeUI.texto,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
