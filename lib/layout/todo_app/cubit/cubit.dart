import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/todo_app/cubit/states.dart';
import 'package:shop_app/modules/todo_app/archived_tasks/ArchivedTaskScreen.dart';
import 'package:shop_app/modules/todo_app/done_tasks/DoneTaskScreen.dart';
import 'package:shop_app/modules/todo_app/new_tasks/NewTaskScreen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

  //to be more easily when use this cubit in many places
  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems=[

    BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'NewTasks',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.check_circle_outline),
      label: 'Done',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.archive_outlined),
      label: 'Archived',
    ),
  ];

  List<Widget> screens =[
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
  ];

  List<String> titles =[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  late Database database;
  List<Map> newTasks =[];
  List<Map> doneTasks =[];
  List<Map> archivedTasks =[];

  void createDatabase()  {
     openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)
        {
          print('Database Created');

          database.execute('create table tasks (id integer primary key,title text'
              ',date text,time text,status text)').then((value){

            print('Table Created');

          }).catchError((error)
          {
            print('Error When Creating Table ${error.toString()}');
          });
        },
        onOpen: (database)
        {
          getDataFromDatabase(database);
          print('Database Opened');
        }
    ).then((value){
      database = value;
      emit(AppCreateDatabaseState());
     });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  })async{
    await database.transaction((txn){
      return txn.rawInsert(
          'insert into tasks(title,date,time,status) values("$title","$date","$time","new")'
      ).then((value) {
        print(' $value Inserted Successfully');

        print(value);

        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error){
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  getDataFromDatabase(database) {

    newTasks =[];
    doneTasks =[];
    archivedTasks =[];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('select * from tasks').then((value)
    {
      value.forEach((element) {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
        else  archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });

  }

  void updateDatabase({
    required String status,
    required int id,
})
  {
    database.rawUpdate(
        'update tasks set status =? where id =?',
         ['$status',id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteDatabase({
    required int id,
  })
  {
    database.rawDelete(
      'delete from tasks where id =?',
      [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }


  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon =icon;
    emit(AppChangeBottomNabSheetState());
  }


  bool isDark = false;
  void changeAppMode({bool? dark}){
    if(dark != null)
      isDark = dark;
    else
      isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value){
      emit(AppChangeModeState());
    });
  }

}