import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/news_app/cubit/cubit.dart';
import 'package:shop_app/layout/news_app/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';


class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener:(context,state){},
      builder: (context,state){

        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
           body: Column(
             children:
             [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: defaultTextFormField(
                   fieldController: searchController,
                   inputType: TextInputType.text,
                   onChange: (value){
                     NewsCubit.get(context).getSearchData(value);
                   },
                   validator:  (value){
                     if(value!.isEmpty){
                       return 'Search Can Not Be Empty ';
                     }
                   },
                   labelText: 'Search',
                   prefixIcon: Icons.search,
                 ),
               ),
               Expanded(child: articleBuilder(list: list)
               ),
             ],
           ),
         );
      },
    );
  }
}
