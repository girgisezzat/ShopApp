import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/modules/shop_app/search/SearchScreen.dart';
import 'package:shop_app/shared/components/components.dart';

class ShopLayout extends StatelessWidget {

  bool showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){
        if(state is ShopSuccessHomeDataState)
          int cartLen = ShopCubit.get(context).cartsModel.data!.cartItems.length;
      },
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions:
            [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: (){
                  navigateTo(context,SearchScreen(ShopCubit.get(context)));
                },
              ),
            ],
          ),
          bottomSheet: showBottomSheet ?
          ShopCubit.get(context).cartsModel.data!.cartItems.length!= 0 ? Container(
            width: double.infinity,
            height: 60,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: 10 ,
                horizontal: 15
            ),
            child: ElevatedButton(
              onPressed: (){},
              //shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Check Out',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ) :Container(
            width: 0,
            height: 0,):Container(width: 0,height: 0,),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              if (index == 3)
                showBottomSheet = true;
              else if(ShopCubit.get(context).cartsModel.data!.cartItems.length == 0)
                showBottomSheet = false;
              else
                showBottomSheet = false;
              return cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
