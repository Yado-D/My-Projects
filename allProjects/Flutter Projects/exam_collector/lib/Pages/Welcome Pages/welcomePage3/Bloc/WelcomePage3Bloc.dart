import 'package:bloc/bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/Bloc/WelcomePage3BlocEvent.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage3/Bloc/WelcomePage3BlocState.dart';

class Welcomepage3bloc
    extends Bloc<Welcomepage3blocevent, Welcomepage3blocstate> {
  Welcomepage3bloc() : super(Welcomepage3blocstate()) {
    on<PositionButtonClikedEvent>(positionButtonClikedEvent);
  }
  void positionButtonClikedEvent(
      PositionButtonClikedEvent event, Emitter emit) {
    emit(
      Welcomepage3blocstate().copyWith(
        PositionButtonClicked: event.PositionButtonCliked,
      ),
    );
  }
}
