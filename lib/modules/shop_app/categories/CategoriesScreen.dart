import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/models/shop_app/categories/categories_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'CategoryProductsScreen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ListView.separated(
          itemBuilder: (context, index) =>
              buildCatItem(ShopCubit.get(context).categoriesModel!.data.data[index],context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: ShopCubit.get(context).categoriesModel!.data.data.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model,context) =>
      InkWell(
        onTap: (){
          ShopCubit.get(context).getCategoriesDetailData(model.id);
          navigateTo(context, CategoryProductsScreen(model.name));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children:
            [
              Image(
                image: NetworkImage('${model.image}'),
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '${model.name}',
                style: TextStyle(
                  fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      );
}


