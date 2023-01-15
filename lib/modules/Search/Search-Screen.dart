import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/News-App/Cubit/Cubit.dart';
import 'package:untitled/layout/News-App/Cubit/States.dart';
import 'package:untitled/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state){
          var list =NewsCubit.get(context).Search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                      controller: SearchController,
                      type: TextInputType.text,
                      onChanged: (value){
                        NewsCubit.get(context).GetSearch(value);
                      },
                      validate: (String? value){
                        if(value ==null || value.trim().length <= 0){
                          return 'Search must not Empity';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search),
                ),
                Expanded(child: BuildNews(list, context)),
              ],
            ),
          );
    },
    );
  }
}
