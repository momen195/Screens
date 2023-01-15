import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/cubit.dart';
import 'package:untitled/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
int counter = 1;
@override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context) => CounterCubit(),
    child: BlocConsumer<CounterCubit, CounterStates>(
      listener: (context,state){
        if(state is CounterMinusStates) print('Minus state is ${state.counter}');
        if(state is CounterPlusStates) print('Plus state is ${state.counter}');
      },
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Counter',
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: ()
                  {
                    CounterCubit.get(context).Minus();
                  },
                  child: Text(
                    'MINUS',
                  ),
                ),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 80,
                  ),
                ),
                TextButton(
                  onPressed: ()
                  {
                    CounterCubit.get(context).Plus();
                  },
                  child: Text(
                    'PLUS',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
}
