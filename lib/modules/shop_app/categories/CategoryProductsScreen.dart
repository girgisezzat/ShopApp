import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/models/shop_app/categories/categoriesdetails_model.dart';
import 'package:shop_app/modules/shop_app/products/ProductsScreen.dart';
import 'package:shop_app/shared/components/components.dart';


class CategoryProductsScreen extends StatelessWidget {

  final String? categoryName;
  CategoryProductsScreen(this.categoryName);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            titleSpacing: 0,
            title: Row(
              children: [
                Text('ShopMarket'),
              ],
            ),
          ),
          body: state is ShopCategoryDetailsLoadingState ? Center(
            child: CircularProgressIndicator(),
          ) : ShopCubit.get(context).categoriesDetailModel!.data.productData.length == 0 ? Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(
                  fontSize: 50
              ),
            ),
          ) :
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '$categoryName',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 20.0),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                        ShopCubit.get(context).categoriesDetailModel!.data.productData.length,
                            (index) => ShopCubit.get(context).categoriesDetailModel!.data.productData.length == 0 ?
                        Center(
                          child: Text(
                            'Coming Soon',
                            style: TextStyle(fontSize: 50),
                          ),
                        ) :
                        productItemBuilder(ShopCubit.get(context).categoriesDetailModel!.data.productData[index],context)
                    ),
                    crossAxisSpacing: 2,
                    childAspectRatio: 1/2.0,
                    mainAxisSpacing: 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget productItemBuilder (ProductData model,context) {
    return InkWell(
      onTap: (){
        ShopCubit.get(context).getProductData(model.id);
        navigateTo(context, ProductsScreen());
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsetsDirectional.only(start: 8,bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Stack(
                alignment:AlignmentDirectional.bottomStart,
                children:[
                  Image(
                    image: NetworkImage(
                        '${model.image}'
                    ),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(model.discount != 0 )
                    Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            'Discount',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        )
                    )
                ]),
            SizedBox(),
            Text(
              '${model.name}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'EGP',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${model.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if(model.discount != 0 )
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'EGP',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text('${model.oldPrice}',
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey
                              ),
                            ),
                            SizedBox(),
                            Text(
                              '${model.discount}'+'% OFF',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 11),
                            )
                          ],
                        ),
                    ]
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

}
