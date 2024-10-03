part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadingSuccessState extends HomeState{
  final List<AnimalsDataModel> AnimalModel;

  HomeLoadingSuccessState({
    required this.AnimalModel
  });

}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}
