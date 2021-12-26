import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/counter_app/counter/cubit/states.dart';


class CounterCubit extends Cubit<CounterStates>
{
  int counter = 1;

  CounterCubit() : super(CounterInitialState());

  //to be more easily when use this cubit in many places
  static CounterCubit get(context)=>BlocProvider.of(context);

  void minus()
  {
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus()
  {
    counter++;
    emit(CounterPlusState(counter));
  }

}