import 'package:image_picker/image_picker.dart';
import 'dart:io';


pickedImages(ImageSource source) async {
//initialize image picker
  final ImagePicker _pick = ImagePicker();

  XFile? photoshot = await _pick.pickImage(
    source: source,
  );
  if (photoshot != null) {
    return photoshot.readAsBytes();
  }
}

Future<File?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  }
  return null;
}