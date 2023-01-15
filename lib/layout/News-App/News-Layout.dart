import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News-App/Cubit/Cubit.dart';
import 'package:untitled/layout/News-App/Cubit/States.dart';
import 'package:untitled/layout/ToDO-App/cubit/cubit.dart';
import 'package:untitled/modules/Search/Search-Screen.dart';
import 'package:untitled/shared/components/components.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                  'News App'
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen(),);
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: (){
                  AppCubit.get(context).modeChange();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            onTap: (index){
              cubit.ChangeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
