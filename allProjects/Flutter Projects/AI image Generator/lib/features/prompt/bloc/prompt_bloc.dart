import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/features/repository/prompt_repository.dart';
part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(_promptInitialEvent);
    on<PromptEnterEvent>(_promptEnterEvent);
  }

  FutureOr<void> _promptEnterEvent(
      PromptEnterEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadingState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGeneratingImageSuccessState(bytes));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  FutureOr<void> _promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    Uint8List bytes = await File('C:/Users/Yared/StudioProjects/untitled/assets/Ai_Image.png').readAsBytes();
      emit(PromptGeneratingImageSuccessState(bytes));
  }
}
