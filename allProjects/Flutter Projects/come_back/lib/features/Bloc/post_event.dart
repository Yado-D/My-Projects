part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class InitialFechSuccessEvent extends PostEvent {}

class initialFechFailerEvent extends PostEvent {}

class AddingPost extends PostEvent{}
