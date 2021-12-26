import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/models/shop_app/search/search_model.dart';
import 'package:shop_app/modules/shop_app/products/ProductsScreen.dart';
import 'package:shop_app/modules/shop_app/search/cubit/cubit.dart';
import 'package:shop_app/shared/components/components.dart';

import 'cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  ShopCubit shopCubit;
  SearchScreen(this.shopCubit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchState>(
        listener:(context,state){} ,
        builder: (context,state)
        {
          SearchCubit cubit = SearchCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              centerTitle: true,
              title: Text(
                'Search',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    defaultTextFormField(
                      fieldController: searchController,
                      inputType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter your text to search';
                        }
                      },
                      onSubmit: (String text){
                        SearchCubit.get(context).getSearchData(text);
                      },
                      labelText: 'Text Search',
                      raduis: 20.0,
                      prefixIcon: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              searchItemBuilder(cubit.searchModel?.data.data[index],shopCubit,context),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: cubit.searchModel?.data.data.length?? 10,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget searchItemBuilder(SearchProduct? model,ShopCubit shopCubit,context){
    return  InkWell(
      onTap: (){
        shopCubit.getProductData(model!.id);
        navigateTo(context, ProductsScreen());
      },
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        child: Row(
          children:
          [
            Image(
              image: NetworkImage('${model!.image}'),
              width: 100,
              height: 100,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Text(
                    '${model.name}',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(
                    'EGP '+'${model.price}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
