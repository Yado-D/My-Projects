part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptGeneratingImageLoadingState extends PromptState{}

final class PromptGeneratingImageErrorState extends PromptState{}

final class PromptGeneratingImageSuccessState extends PromptState{
  final Uint8List file;
  PromptGeneratingImageSuccessState( this.file);

}



