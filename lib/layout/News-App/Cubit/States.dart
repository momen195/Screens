abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates{}

class NewsGetEnterLoadionState extends NewsStates{}
class NewsGetEnterSucState extends NewsStates{}
class NewsGetEnterEroState extends NewsStates{
  final String error;
  NewsGetEnterEroState(this.error);
}

class NewsGetSportsLoadionState extends NewsStates{}
class NewsGetSportsSucState extends NewsStates{}
class NewsGetSportsEroState extends NewsStates{
  final String error;
  NewsGetSportsEroState(this.error);
}

class NewsGetTecLoadionState extends NewsStates{}
class NewsGetTecSucState extends NewsStates{}
class NewsGetTecEroState extends NewsStates{
  final String error;
  NewsGetTecEroState(this.error);
}

class NewsGetSearchLoadionState extends NewsStates{}
class NewsGetSearchSucState extends NewsStates{}
class NewsGetSearchEroState extends NewsStates{
  final String error;
  NewsGetSearchEroState(this.error);
}


