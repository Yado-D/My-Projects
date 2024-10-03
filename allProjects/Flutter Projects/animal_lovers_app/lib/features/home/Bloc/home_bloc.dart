import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerse_app/features/data/cart_item.dart';
import 'package:e_commerse_app/features/data/grocery_data.dart';
import 'package:e_commerse_app/features/home/Models/home_model_data.dart';
import 'package:e_commerse_app/features/home/ui/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<HomeWishlistButtonNavigateClikedEvent>(_homeWishlistButtonNavigateClikedEvent);
    on<HomeCartButtonNavigateClikedEvent>(_homeCartButtonNavigateClikedEvent);
    on<HomeCartButtonClikedEvent>(_homeCartButtonClikedEvent);
    on<HomeWishlistButtonClikedEvent>(_homeWishlistButtonClikedEvent);

  }

  FutureOr<void> _homeInitialEvent(
      event, Emitter<HomeState> emit) {
      emit(HomeLoadingState());
      Future.delayed(Duration(milliseconds: 300));
      emit(HomeLoadingSuccessState(AnimalModel:AnimalsData.AnimalList.map((e) => AnimalsDataModel(
        id: e["id"],
        name: e["name"],
        quantitiy: e["quantity"],
        Price: e["price"],
        image: e["image"],
         ),
        ).toList()
       )
      );
  }
}

  FutureOr<void> _homeWishlistButtonNavigateClikedEvent(
      HomeWishlistButtonNavigateClikedEvent event,
      Emitter<HomeState> emit) {
   print("wishlist clicked");
   emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> _homeCartButtonNavigateClikedEvent(
      HomeCartButtonNavigateClikedEvent event,
      Emitter<HomeState> emit) {
    print("cart clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> _homeCartButtonClikedEvent(
      HomeCartButtonClikedEvent event,
      Emitter<HomeState> emit) {
    print("***element added to cart");
    cartItems.add(event.animalModel);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> _homeWishlistButtonClikedEvent(
      HomeWishlistButtonClikedEvent event,
      Emitter<HomeState> emit) {
     print("***element added to widhlist");
     cartItems.add(event.animalModel);
     emit(HomeProductItemWishlistedActionState());

  }



