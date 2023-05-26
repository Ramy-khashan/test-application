part of 'home_cubit.dart';
 
abstract class HomeState {}

class HomeInitial extends HomeState {}
class StartProcessState extends HomeState {}
class EndProcessState extends HomeState {}
class SavedColorState extends HomeState {}
class ChangeColorAuto extends HomeState {}
