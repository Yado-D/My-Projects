import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerse_app/features/data/cart_item.dart';
import 'package:e_commerse_app/features/home/Models/home_model_data.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(_cartInitialEvent);
  }

  FutureOr<void> _cartInitialEvent(
      CartInitialEvent event,
      Emitter<CartState> emit) {
      emit(CartSuccessState(cartItems: cartItems));
  }
}
