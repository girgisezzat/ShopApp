import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/todo_app/cubit/cubit.dart';
import 'package:shop_app/layout/todo_app/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).doneTasks;

        return taskBuilder(
          tasks: tasks,
        );
      },
    );
  }
}
