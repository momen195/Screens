import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/layout/ToDO-App/cubit/states.dart';
import 'package:untitled/shared/network/local/cache-helper.dart';

import '../../../modules/Archive-Tasks/Archive-Tasks-Screen.dart';
import '../../../modules/Done-Tasks/Done-Tasks-Screen.dart';
import '../../../modules/New-Tasks/New-Tasks-Screen.dart';


class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 1 ;
  List<String> titleScreen = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];
  List<Widget> typeScreen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen(),
  ];
  void changeIndex(int Index){
    CurrentIndex = Index ;
    emit(AppChangeButtonNavBarState());
  }

  bool isBottomSheetShown = false ;
  IconData fabIcon = Icons.edit ;
  void BottomShete (
      bool isShow,
      IconData icon,
      ){
    isBottomSheetShown=isShow;
    fabIcon=icon;
    emit(AppChangeButtonSheetState());
  }


  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  void CreateDatabase(){
    openDatabase(
      'ToDo.db',
      version: 1,
      onCreate: (Database database,int version)async{
        print('database created');
        await database.execute('''CREATE TABLE TASKS (id INTEGER PRIMARY KEY, Title STRING, Date STRING, Time STRING, Status STRING)''');
      },
      onOpen: (database){
        GetDataFromDatabase(database);
      },
    ).then((value){
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  InsertToDatabase({
    required String taskTitle ,
    required String time ,
    required String date ,
  }) async
  {
    await database.transaction(
            (txn) async{
          txn.rawInsert('INSERT INTO TASKS (Title,Date,Time,Status) VALUES ("$taskTitle","$date","$time","new")').then((value){
            print('$value insert successfully');
            emit(AppInitialStates());
            GetDataFromDatabase(database);
          }
          ).catchError((error){
            print('ERROR when INSERT record${error.toString()}');
          });
        });
  }

  void GetDataFromDatabase(database)
  {
    newTasks= [];
    doneTasks= [];
    archiveTasks= [];
    emit(AppGetLoadingDatabaseState());
    database.rawQuery('SELECT * FROM TASKS').then((value){
      value.forEach((element) {
        if (element['Status'] == 'new') {
          newTasks.add(element);
        } else if (element['Status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

    void UpdateData({
      required String status,
      required int id,
    }) async{
        database.rawUpdate(
        'UPDATE TASKS SET Status = ? WHERE id = ?',
        [status, id],).then((value){
          GetDataFromDatabase(database);
          emit(AppUpdateDataState());
        });
  }

  void DeleteData({
    required int? id,
  }) async {
    database.rawDelete(
      'DELETE FROM TASKS WHERE id = ?',
      [id],).then((value){
      emit(AppDeleteDataState());
      GetDataFromDatabase(database);
    });
  }

  bool isDark = false ;
  void modeChange({fromShared}){
    if (fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }else{isDark = !isDark ;
    cacheHelper.PutData(Key: 'isDark', value: isDark)?.then((value){
      emit(AppChangeModeState());
    });}
  }
}