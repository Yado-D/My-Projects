part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClikedEvent extends HomeEvent{
  final AnimalsDataModel animalModel;

  HomeWishlistButtonClikedEvent({required this.animalModel});

}

class HomeCartButtonClikedEvent extends HomeEvent{
  final AnimalsDataModel animalModel;

  HomeCartButtonClikedEvent({required this.animalModel});

}

class HomeWishlistButtonNavigateClikedEvent extends HomeEvent{}

class HomeCartButtonNavigateClikedEvent extends HomeEvent{}

