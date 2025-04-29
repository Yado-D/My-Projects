import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/settings.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController adminpasswordController = TextEditingController();
    TextEditingController adminNameController = TextEditingController();
    Map<String, dynamic> userData =
        Provider.of<UserProvider>(context).adminModel;
    String name = userData['adminName'] ?? 'Default Name';
    String email = userData['adminEmail'] ?? 'Default Email';
    String avatarUrl = userData['profileImageUrl'] ??
        'https://images.mubicdn.net/images/cast_member/286407/cache-139299-1463178721/image-w856.jpg?size=256x';

    final picker = ImagePicker();
    XFile? pickedFile;

    void uploadImageToFirestore() async {
      if (pickedFile != null) {
        final imageFile = File(pickedFile!.path);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('images/${DateTime.now().toString()}');
        final uploadTask = storageRef.putFile(imageFile);

        // Monitor the upload task
        await uploadTask.whenComplete(() {
          // Get the download URL
          storageRef.getDownloadURL().then((imageUrl) {
            // Store the download URL in Firestore
            Provider.of<UserProvider>(context, listen: false)
                .updateAdminDefaultProfileImage(imageUrl);
          });
        });
      }
    }

    Future<void> pickImage() async {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          pickedFile = pickedImage;
          uploadImageToFirestore();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeUI.darker,
      ),
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: ThemeUI.darker),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                pickImage();
                              },
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(avatarUrl),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  pickImage(); // Call pickImage function when the edit icon is tapped
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 161, 139, 169),
                                  radius: 20,
                                  child: Icon(
                                    Icons.photo_camera,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeUI.texto),
                      ),
                    ]),
                    SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        email,
                        style: TextStyle(fontSize: 16, color: ThemeUI.textogr),
                      ),
                    ]),
                    /*  Row(
              children: [
                 Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                   child: Container(
             padding: EdgeInsets.all(25), 
            width: 300,
            height: 80,
             decoration: BoxDecoration(
               border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0), // Add border color as needed
            width: 1, 
               ),
               borderRadius: BorderRadius.circular(10), // Add border radius as needed
             ),
             child: Row(
               children: [
                 GestureDetector(
              onTap: () async {
                pickImage();
              },
              child: Text(
                'Edit Profile Pic',
                style: TextStyle(
                  color: Colors.blue, // You can change the color as per your preference
                  fontWeight: FontWeight.bold,
                ),
              ),
                 ),
                Spacer(),// Adjust spacing as needed
                 CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(avatarUrl),
                 ),
               ],
             ),
                   ),
                 ),
               
              ],
            ),
            */
                    textFields(
                      controller: adminNameController,
                      hint: 'User Name Change',
                      prefix:
                          Icon(Icons.person_2_outlined, color: Colors.white),
                      maxLines: 1,
                    ),
                    MaterialButton(
                      height: 60,
                      minWidth: 200,
                      color: ThemeUI.light,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () async {
                        FirebaseFirestore.instance
                            .collection('admins')
                            .doc(userData['uid'])
                            .update({
                          'profileImageUrl': avatarUrl,
                        });
                        Provider.of<UserProvider>(context, listen: false)
                            .updateAdminName(adminNameController.text.trim());
                        FirebaseFirestore.instance
                            .collection('admins')
                            .doc(userData["uid"])
                            .update(userData);

                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Save Changes',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.login_outlined,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
