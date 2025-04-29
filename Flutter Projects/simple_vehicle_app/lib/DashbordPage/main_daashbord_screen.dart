import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_vehicle_app/APIs/simple_vehicle_api_to_firebase.dart';
import 'package:simple_vehicle_app/Common/commonWidgets.dart';
import 'package:simple_vehicle_app/DashbordPage/nested_vehicle_page.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({super.key});

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<QueryDocumentSnapshot>>(
          future: simple_vehicle_firebase_api().getAllVehicleData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found.'));
            }
            var data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var doc = data[index];
                var documentId = doc.id;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => nested_vehicle_page(
                          documentId: documentId,
                          fuelLevel: doc['fuelLevel'],
                          name: doc['name'],
                          location: doc["lastLocation"],
                          image: doc['image'],
                        ),
                      ),
                    );
                  },
                  child: ReusableVehiclesContainer(
                    doc['name'],
                    doc['lastLocation'],
                    doc['image'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget ReusableVehiclesContainer(String name, String location, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            image,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                gradient:
                LinearGradient(colors: [Colors.grey, Colors.amber.shade500]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    FromBottom: 0,
                    TextString: name,
                    FontSize: 16,
                  ),
                  ReusableText(
                    TextString: location,
                    FontSize: 16,
                    FromTop: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
