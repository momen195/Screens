import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News-App/Cubit/Cubit.dart';
import 'package:untitled/layout/News-App/Cubit/States.dart';
import 'package:untitled/shared/components/components.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).Entertainment ;
        return BuildNews(list,context);
      },
    );
  }
}
