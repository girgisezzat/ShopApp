import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/cubit/cubit.dart';
import 'layout/todo_app/cubit/states.dart';
import 'layout/todo_app/todo_layout.dart';
import 'package:bloc/bloc.dart';

import 'modules/shop_app/on_boarding/OnBoardingScreen.dart';

void main() async {
  //بيتاكد ان كل حاججة هنا ف الميثود خلصت وبعدين يفتح الابليكاشن
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token');
  print(token);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: 
      [
        //ShopApp
        BlocProvider(create: (context) => NewsCubit()..getBusinessData(),),
        BlocProvider(create: (BuildContext context) => AppCubit(),),
        BlocProvider(create: (BuildContext context) => ShopCubit()
          ..getHomeData()
          ..getCategories()
          ..getFavorites()
          ..getUserData()
          ..getCartData(),
        )
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}


