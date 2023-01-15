import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/ToDO-App/cubit/cubit.dart';
import 'package:untitled/layout/ToDO-App/cubit/states.dart';

import '../../shared/components/components.dart';


class ArchiveTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        return AppCubit.get(context).archiveTasks.length > 0 ? ListView.separated(
          itemBuilder: (context,index)=>BuildTaskItem(AppCubit.get(context).archiveTasks[index], context),
          separatorBuilder: (context,index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
          itemCount: AppCubit.get(context).archiveTasks.length,
        ) : Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black45,
              size: 100,
            ),
            Text(
              'Please Add Tasks',
              style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            )

          ],
        ),);
      },
    );
  }
}
