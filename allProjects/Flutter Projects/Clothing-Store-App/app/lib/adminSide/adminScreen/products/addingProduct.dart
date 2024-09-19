import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/adminHome.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';
import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/utils/pickImages.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';
import 'package:shega_cloth_store_app/utils/textfield.dart';
import 'package:image_picker/image_picker.dart';

class addPro extends StatefulWidget {
  const addPro({Key? key});

  @override
  State<addPro> createState() => _addProState();
}

class _addProState extends State<addPro> {
  TextEditingController discriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  Uint8List? image;

  String selectedGender = 'male';
  String selectedColor = 'blue';
  String selectedBrand = 'nike';
  String selectedCategory = 'gender';

  void selectedImages() async {
    Uint8List im = await pickedImages(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  void posted() async {
    if (titleController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        discriptionController.text.isNotEmpty &&
        image != null &&
        selectedGender.isNotEmpty &&
        selectedColor.isNotEmpty &&
        selectedBrand.isNotEmpty) {
      String result = await authMethod().addProduct(
        price: priceController.text,
        description: discriptionController.text,
        title: titleController.text,
        photourl: image!,
        like: [],
        gender: selectedGender,
        color: selectedColor,
        brand: selectedBrand,
        category: getCategory(selectedGender, selectedColor, selectedBrand),
      );

      if (result == 'success') {
        showSnack(
          'Successfully added',
          context,
        );
      } else {
        showSnack(
          result,
          context,
        );
      }
    } else {
      showSnack(
        'Please fill in all the required fields',
        context,
      );
    }
  }

  String getCategory(String gender, String color, String brand) {
    return '$gender $color $brand';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeUI.darker,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ThemeUI.texto,
          ),
        ),
        title: Center(
          child: Text(
            'Adding New Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ThemeUI.texto,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: ThemeUI.darker),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          width: 350,
                          height: 700,
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textFields(
                                controller: titleController,
                                hint: 'Title',
                                maxLines: 1,
                              ),
                              textFields(
                                  controller: priceController,
                                  hint: 'Price',
                                  maxLines: 1),
                              textFields(
                                  controller: discriptionController,
                                  hint: 'Description',
                                  maxLines: 1),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: image != null
                                          ? Image(
                                              image: MemoryImage(image!),
                                              fit: BoxFit.fill,
                                            )
                                          : Center(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.upload,
                                                  size: 30,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      bottom: -3,
                                      right: -3,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.add_a_photo_outlined,
                                        ),
                                        onPressed: () => selectedImages(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              // Category Selection
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  categorySelector(
                                    title: 'Gender',
                                    selectedCategory: selectedGender,
                                    options: ['male', 'female'],
                                    onSelect: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  categorySelector(
                                    title: 'Color',
                                    selectedCategory: selectedColor,
                                    options: [
                                      'blue',
                                      'red',
                                      'green',
                                      'white',
                                      'black',
                                      'grey'
                                    ],
                                    onSelect: (value) {
                                      setState(() {
                                        selectedColor = value;
                                      });
                                    },
                                  ),
                                  categorySelector(
                                    title: 'Brand',
                                    selectedCategory: selectedBrand,
                                    options: ['nike', 'adidas', 'puma', 'CR7'],
                                    onSelect: (value) {
                                      setState(() {
                                        selectedBrand = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),

                              // Upload New Product Button

                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: MaterialButton(
                                  color: ThemeUI.primary,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onPressed: () => posted(),
                                  height: 60,
                                  minWidth: 300,
                                  child: Center(
                                    child: Text(
                                      'Upload New Product',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              221, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget categorySelector({
    required String title,
    required String selectedCategory,
    required List<String> options,
    required Function(String) onSelect,
  }) {
    return Column(
      children: [
        Text(title),
        SizedBox(height: 5),
        DropdownButton<String>(
          value: selectedCategory,
          onChanged: (String? value) {
            if (value != null) {
              onSelect(value);
            }
          },
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
      ],
    );
  }
}
