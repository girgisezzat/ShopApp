// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/shared/components/components.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';


import 'cubit/cubit.dart';
import 'cubit/states.dart';


class TodoLayout extends StatelessWidget
{

  var scaffoldKey =GlobalKey<ScaffoldState>();
  var formKey =GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state)
        {
          AppCubit cubit = AppCubit.get(context);
         return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition:true,
              builder: (context)=>cubit.screens[cubit.currentIndex],
              fallback:(context)=> Center(child: CircularProgressIndicator()),
            ),
           floatingActionButton: FloatingActionButton(
             onPressed: ()
             {
               if(cubit.isBottomSheetShown) {
                 if(formKey.currentState!.validate()){
                   cubit.insertToDatabase(
                     title: titleController.text,
                     time: timeController.text,
                     date: dateController.text,
                   );
                    // insertToDatabase(
                    //   title: titleController.text,
                    //   time: timeController.text,
                    //   date: dateController.text,
                    // ).then((value){
                    //   getDataFromDatabase(database).then((value){
                    //     Navigator.pop(context);
                    //     setState(() {
                    //       isBottomSheetShown = false;
                    //       fabIcon = Icons.edit;
                    //       tasks = value;
                    //     });
                    //   });
                    // });
                 }
               }else{
                 scaffoldKey.currentState!.showBottomSheet(
                       (context) =>Container(
                         color: Colors.grey[300],
                         padding: EdgeInsets.all(20.0),
                         child: Form(
                           key: formKey,
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children:
                             [
                               defaultTextFormField(
                                 fieldController: titleController,
                                 inputType:  TextInputType.text,
                                 validator:  (value){
                                   if(value!.isEmpty){
                                     return 'Title Can Not Be Empty ';
                                   }
                                 },
                                 labelText: 'Task Title',
                                 prefixIcon:  Icons.title,
                               ),
                               SizedBox(
                                    height: 15.0,
                                  ),
                               defaultTextFormField(
                                 fieldController: timeController,
                                 inputType:  TextInputType.datetime,
                                 validator: (value){
                                   if(value!.isEmpty){
                                     return 'Time Can Not Be Empty ';
                                   }
                                  },
                                 onTap: (){
                                   showTimePicker(
                                     context: context,
                                     initialTime: TimeOfDay.now(),
                                   ).then((value){
                                     timeController.text = value!.format(context).toString();
                                     print(value.format(context));});
                                   },
                                 labelText:  'Task Time',
                                 prefixIcon:  Icons.watch_later_outlined,
                               ),
                               SizedBox(
                              height: 15.0,
                            ),
                               defaultTextFormField(
                                 fieldController:  dateController,
                                 inputType:  TextInputType.datetime,
                                 validator:  (value){
                                   if(value!.isEmpty){
                                     return 'Date Can Not Be Empty ';
                                   }
                                 },
                                 onTap: (){
                                   showDatePicker(
                                     context: context,
                                     initialDate: DateTime.now(),
                                     firstDate: DateTime.now(),
                                     lastDate: DateTime.parse('2022-08-01'),
                                   ).then((value) {
                                     dateController.text = DateFormat.yMMMd().format(value!);print(DateFormat.yMMMd().format(value));
                                   });
                                   },
                                 labelText:  'Task Date',
                                 prefixIcon:  Icons.calendar_today,
                               ),
                             ],
                           ),
                         ),
                       ),
                 ).closed.then((value){
                   cubit.changeBottomSheetState(
                     isShow: false,
                     icon: Icons.edit,
                   );
                 });
                 cubit.changeBottomSheetState(
                   isShow: true,
                   icon: Icons.add,
                 );
               }
               },
             child: Icon(
               cubit.fabIcon,
             ),
           ),
           bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:cubit.bottomItems,
            ),
         );
         },
      ),
    );
  }


}

