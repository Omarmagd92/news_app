abstract class NewsStates{}
class AppInitialState extends NewsStates{}
class newsChangeBottomNav extends NewsStates{}
class newsChangeThemeMode extends NewsStates{}
class getBusinessLoading extends NewsStates{}
class getBusinessSuccess extends NewsStates{}
class getBusinessError extends NewsStates{
  final error;
  getBusinessError(this.error);
}
class getSportLoading extends NewsStates{}
class getSportSuccess extends NewsStates{}
class getSportError extends NewsStates{
  final error;
  getSportError(this.error);
}
class getScienceLoading extends NewsStates{}
class getscienceSuccess extends NewsStates{}
class getScienceError extends NewsStates{
  final error;
  getScienceError(this.error);
}
class getSearchLoading extends NewsStates{}
class getSearcheSuccess extends NewsStates{}
class getSearchError extends NewsStates{
  final error;
  getSearchError(this.error);
}