import 'dart:convert';

import 'package:come_back/features/models/postModel,dart.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
class ReadingAPIS{
  static Future<List<PostDataModel>> fetchingData() async {
            var Fetch = http.Client();
            List<PostDataModel> post =[];

            try{

                var response =await Fetch.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

                var result = jsonDecode(response.body);
                for(int i=0;i<result.length;i++){
                PostDataModel posts = PostDataModel.fromJson(result[i]);
                post.add(posts);
                }
               return post;
            }catch(e){
              return [];
            }
        }

      static Future<bool> AddPost()async{
        var Fetch = http.Client();

        try{

          var response =await Fetch.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),body: {
            "title":"Yared is A Flutter Teaher",
            "body":"Yared is A good flutter Teacher",
            "userId":"2",
            "id":"3"
          });
          return true;
        }catch(e){
          return false;
        }
      }
}