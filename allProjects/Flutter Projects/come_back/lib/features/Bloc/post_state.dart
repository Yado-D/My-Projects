part of 'post_bloc.dart';

@immutable
sealed class PostState {}
abstract class PostActionState extends PostState{}

final class PostInitial extends PostState {}

final class initailPostSuccessState extends PostState{
  final List<PostDataModel> post;
  initailPostSuccessState({
    required this.post,
});
}
final class LoadingState extends PostState {}

final class initailPostFailureState extends PostState{}

final class AddingPostState extends PostActionState{
  final String postMessage;

  AddingPostState({required this.postMessage});

}
