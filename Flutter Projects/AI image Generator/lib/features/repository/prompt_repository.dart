

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class PromptRepo{
  static Future<Uint8List?> generateImage(String prompt)async{

   String url = "https://api.vyro.ai/v1/imagine/api/generations";
   Map<String,dynamic> header = {
     'Authorization': 'Bearer vk-3c0UTXjNPD6mFBHRZotmI2LBIxyPeY52kVxGDHiDJNLhsiL'
   };
   Map<String,dynamic> payload = {
     'prompt':  prompt,
     'style_id': '122',
     'aspect_ratio': '1:1',
     'high_res_results': '1'
   };

   FormData formData = FormData.fromMap(payload);

   Dio dio = Dio();
     dio.options = BaseOptions(
        headers: header,
       responseType: ResponseType.bytes,
     );

    final responses = await dio.post(url,data:formData);

    if(responses.statusCode==200){
      Uint8List uint8List = Uint8List.fromList(responses.data);
      return uint8List;
    }else{
      return null;
    }
  }
}







// response = requests.post(url, headers=headers, files=payload)
//
// if response.status_code == 200:  # if request is successful
// with open('image.jpg', 'wb') as f:
// f.write(response.content)
// else:
// print("Error:", response.status_code)