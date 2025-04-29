import 'package:bloc/bloc.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage4/Bloc/WelcomePage4BlocEvent.dart';
import 'package:exam_collector/Pages/Welcome%20Pages/welcomePage4/Bloc/WelcomePage4BlocState.dart';

class Welcomepage4blocs
    extends Bloc<Welcomepage4blocEvent, Welcomepage4blocState> {
  Welcomepage4blocs() : super(Welcomepage4blocState()) {
    on<Welcomepage4blocEvent>(welcomepage4blocEvent);
  }
  void welcomepage4blocEvent(
    Welcomepage4blocEvent event,
    Emitter emit,
  ) {
    emit(Welcomepage4blocState(SelectedItem: event.SelectedItem));
  }
}
