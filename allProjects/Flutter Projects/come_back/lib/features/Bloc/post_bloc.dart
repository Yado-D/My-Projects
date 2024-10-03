import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:come_back/features/models/postModel,dart.dart';
import 'package:come_back/features/repository/Network.dart';
import 'package:meta/meta.dart';
import "package:http/http.dart" as http;
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<InitialFechSuccessEvent>(_initialFechSuccessEvent);
    on<AddingPost>(_addingPost);
  }

  FutureOr<void> _initialFechSuccessEvent(
      InitialFechSuccessEvent event, Emitter<PostState> emit) async{
       emit(LoadingState());
      List<PostDataModel> fetched = await ReadingAPIS.fetchingData();

      if(fetched.isNotEmpty){
        emit(initailPostSuccessState(post:fetched));
      }else{
        emit(initailPostFailureState());
      }

  }


  FutureOr<void> _addingPost(AddingPost event, Emitter<PostState> emit) async{
      bool bool_value = await ReadingAPIS.AddPost();
      if(bool_value){
        emit(AddingPostState(postMessage: "Successfully added the post"));
      }
      else{
        emit(AddingPostState(postMessage: "Something Wrong on adding post"));
      }
  }
}
