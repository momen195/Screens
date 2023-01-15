import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News-App/Cubit/States.dart';
import 'package:untitled/modules/Entertainment/Entertainment-Screen.dart';
import 'package:untitled/modules/Settings/Settings-Screen.dart';
import 'package:untitled/modules/Technology/Technology-Screen.dart';
import 'package:untitled/modules/sports/Sports-Screen.dart';
import 'package:untitled/shared/network/remote/dio-helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.golf_course_outlined),
        label: 'Entertainment'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',),
    const BottomNavigationBarItem(
      icon: Icon(Icons.military_tech),
      label: 'Technology',),
  ];
  List<Widget> screens = [
    EntertainmentScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];

  // ignore: non_constant_identifier_names
  void ChangeBottomNavBar(int index){
    currentIndex = index;
    if(index == 1) {
      GetSports();
    }
    if(index == 2) {
      GetTechnology();
    }
    emit(NewsBottomNavBarState());
  }

  // ignore: non_constant_identifier_names
  List <dynamic> Entertainment =[];
  // ignore: non_constant_identifier_names
  List <dynamic> Sports =[];
  // ignore: non_constant_identifier_names
  List <dynamic> Technology =[];
  // ignore: non_constant_identifier_names
  List <dynamic> Search =[];
  void GetEntertainment(){
    emit(NewsGetEnterLoadionState());
    DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
        'country':'eg',
        'category':'entertainment',
        'apiKey':'c05114d1b3d3455cb49e80b9168e706e',
        },
    ).then((value){
      Entertainment = value.data['articles'];
      emit(NewsGetEnterSucState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetEnterEroState(error));
    });
  }
  void GetSports(){
    emit(NewsGetSportsLoadionState());
    if (Sports.length == 0){
      DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'c05114d1b3d3455cb49e80b9168e706e',
        },
      ).then((value){
        Sports = value.data['articles'];
        emit(NewsGetSportsSucState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsEroState(error));
      });
    }else{
      emit(NewsGetSportsSucState());
    }
  }
  void GetTechnology(){
    emit(NewsGetTecLoadionState());
    if (Technology.length == 0 ){
      DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'technology',
          'apiKey':'c05114d1b3d3455cb49e80b9168e706e',
        },
      ).then((value){
        Technology = value.data['articles'];
        emit(NewsGetTecSucState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetTecEroState(error));
      });
    }else{
      emit(NewsGetTecSucState());
    }
  }
  void GetSearch(String value){
    emit(NewsGetSearchLoadionState());
    DioHelper.getData(
      methodUrl: 'v2/everything',
      query: {
        'category':'$value',
        'apiKey':'c05114d1b3d3455cb49e80b9168e706e',
      },
    ).then((value){
      Search = value.data['articles'];
      emit(NewsGetSearchSucState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchEroState(error));
    });
}
}