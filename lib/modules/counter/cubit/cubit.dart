import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitialStates()) ;
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 1;

  void Minus(){
    counter--;
    emit(CounterMinusStates(counter));
}
  void Plus(){
    counter++;
    emit(CounterPlusStates(counter));
  }
}