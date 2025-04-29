import 'dart:typed_data';

import 'package:shega_cloth_store_app/database/auth.dart';

import '/utils/pickImages.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProduct extends StatefulWidget {
  final snap;
  const EditProduct({
    super.key,
    required this.snap,
  });

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  Uint8List? file;
  bool isfinish = true;
  String selectedGender = 'male';
  String selectedColor = 'blue';
  String selectedBrand = 'nike';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Center(
          child: Text(
            'Editing Product',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Gender'),
              subtitle: Text(selectedGender),
              onTap: () {
                // Similar to addPro widget, implement a dialog or navigation to select gender
              },
            ),
            ListTile(
              title: Text('Color'),
              subtitle: Text(selectedColor),
              onTap: () {
                // Similar to addPro widget, implement a dialog or navigation to select color
              },
            ),
            ListTile(
              title: Text('Brand'),
              subtitle: Text(selectedBrand),
              onTap: () {
                // Similar to addPro widget, implement a dialog or navigation to select brand
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFields(
            controller: titleController,
            hint: 'Title',
            maxLines: 3,
          ),
          textFields(
            controller: priceController,
            hint: 'Price',
            maxLines: 1,
          ),
          textFields(
            controller: descriptionController,
            hint: 'Description',
            maxLines: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: file != null
                  ? Image.memory(
                      file!,
                      fit: BoxFit.fill,
                    )
                  : IconButton(
                      onPressed: () async {
                        try {
                          Uint8List im = await pickedImages(
                            ImageSource.gallery,
                          );
                          setState(() {
                            file = im;
                          });
                        } catch (e) {
                          // Handle image selection error
                          print('Error selecting image: $e');
                        }
                      },
                      icon: Icon(
                        Icons.upload,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: MaterialButton(
                color: Color.fromARGB(255, 112, 101, 185),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  // Implement the update logic here
                  setState(() {
                    isfinish = false;
                  });
                  authMethod().updatingPosts(
                      widget.snap['userID'],
                      titleController.text,
                      priceController.text,
                      descriptionController.text,
                      file!);
                  setState(() {
                    isfinish = true;
                  });
                },
                height: 60,
                minWidth: 300,
                child: isfinish
                    ? Center(
                        child: Text(
                          'Update Product',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
