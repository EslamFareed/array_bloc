part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//! ----------------------------------------------

class GetHeadLinesLoadingState extends HomeState {}

class GetHeadLinesSuccessState extends HomeState {}

class GetHeadLinesErrorState extends HomeState {}
