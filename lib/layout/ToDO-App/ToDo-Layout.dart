import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/layout/ToDO-App/cubit/cubit.dart';
import 'package:untitled/layout/ToDO-App/cubit/states.dart';
import 'package:untitled/modules/Archive-Tasks/Archive-Tasks-Screen.dart';
import 'package:untitled/modules/Done-Tasks/Done-Tasks-Screen.dart';
import 'package:untitled/modules/New-Tasks/New-Tasks-Screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';


class HomeLayout extends StatelessWidget
{
  TextEditingController TasksController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController TimeController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..CreateDatabase(),
      child : BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                '${AppCubit.get(context).titleScreen[AppCubit.get(context).CurrentIndex]}',
              ),
              centerTitle: true,
            ),
            body: state != AppGetLoadingDatabaseState ? AppCubit.get(context).typeScreen[AppCubit.get(context).CurrentIndex] : Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
              if (FormKey.currentState != null && FormKey.currentState!.validate()){
                  if(AppCubit.get(context).isBottomSheetShown) {
                    AppCubit.get(context).InsertToDatabase(
                        taskTitle: TasksController.text,
                        time: TimeController.text,
                        date: DateController.text);
                  }
                  Navigator.pop(context);
                   }else{
                  scaffoldKey?.currentState!.showBottomSheet((context) => Container(
                    width: double.infinity,
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: FormKey,
                      child: Column(
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          defaultFormField(
                            controller: TasksController,
                            validate:(String? value){
                              if(value ==null || value.trim().length <= 0){
                                return 'tasks must not Empity';
                              }
                              return null;
                            },
                            label: 'Tasks',
                            prefix: Icons.title,
                            type: TextInputType.text,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          defaultFormField(
                            controller: TimeController,
                            validate:(String? value){
                              if(value ==null || value.trim().length <= 0){
                                return 'time must not Empity';
                              }
                              return null;
                            },
                            onTap: (){
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now()
                              ).then((value){
                                TimeController.text = value!.format(context);
                              }).catchError((error){
                                print('${error.toString()}');
                              });

                            },
                            label: 'Task Time',
                            prefix: Icons.watch_later_outlined,
                            type: TextInputType.datetime,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          defaultFormField(
                            controller: DateController,
                            validate:(String? value){
                              if(value ==null || value.trim().length <= 0){
                                return 'Date must not Empity';
                              }
                              return null;
                            },
                            onTap: (){
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2023-12-30')
                              ).then((value){
                                DateController.text = DateFormat().add_yMMMd().format(value!);
                              }).catchError((error){
                                print('${error.toString()}');
                              });
                            },
                            label: 'Task Time',
                            prefix: Icons.watch_later_outlined,
                            type: TextInputType.datetime,
                          ),
                        ],
                      ),
                    ),
                  ),
                    elevation: 20.0,
                  ).closed.then((value){
                    AppCubit.get(context).BottomShete(false,Icons.edit);
                  }
                  );
                  AppCubit.get(context).BottomShete(true, Icons.add);
                }
              },
              child: Icon(AppCubit.get(context).fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).CurrentIndex,
              onTap: (Index){
                AppCubit.get(context).changeIndex(Index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

