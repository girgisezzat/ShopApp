import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/layout/shop_app/shop_layout.dart';
import 'package:shop_app/models/shop_app/home/productdetails_models.dart';
import 'package:shop_app/shared/components/components.dart';

class ProductDetailsScreen extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  int index;
  ProductDetailsScreen(this.index);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
    listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (!state.model.status) {
            showToast(
              text: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        }
      },
    builder: (context, state)
    {

      ShopCubit cubit = ShopCubit.get(context);
      ProductDetailsData ? model = ShopCubit.get(context).productDetailsModel?.data;

      return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.indigo,
                  statusBarIconBrightness: Brightness.light
              ),
              elevation: 0,
              backgroundColor: Colors.indigo,
              backwardsCompatibility: false,
              leading:
              IconButton(
                  onPressed: () {
                    print('back');
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              title: Text(
                'MATGAR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              titleSpacing: 3,
            ),
        body:
        cubit.homeModel != null ? Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children:
          [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      '${cubit.homeModel!.data!.products[index].image}'),
                                  width: double.infinity,
                                  height: 200,
                                  //fit: BoxFit.cover,
                                ),
                                cubit.homeModel!.data!.products[index].discount > 0 ? Container(
                                  color: Colors.redAccent.withOpacity(0.8),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0,
                                      right: 0,
                                    ),
                                    child: Text(
                                      'DISCOUNT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                ) : Container(),
                              ]
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            '${cubit.homeModel!.data!.products[index].name}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${cubit.homeModel!.data!.products[index].price.toString()} LE',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  cubit.homeModel!.data!.products[index]
                                      .discount >
                                      0
                                      ? Text(
                                    '${cubit.homeModel!.data!.products[index].oldPrice.toString()} LE',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration
                                            .lineThrough),
                                  )
                                      : Container(),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              '${cubit.homeModel!.data!.products[index].description}')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                      vertical: 10 ,
                      horizontal: 15
                  ),
                  child: ElevatedButton(
                      onPressed: (){
                        if(ShopCubit.get(context).cartProducts[model!.id]!)
                        {
                          print('Already in Your Cart \nCheck your cart To Edit or Delete ');
                        }
                        else
                          {
                            //ShopCubit.get(context).cartProducts[model.id]!;
                            ShopCubit.get(context).addToCart(model.id);
                            scaffoldKey.currentState!.showBottomSheet(
                                  (context) => Container(
                                    color: Colors.grey[300],
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${model.name}',
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Added to Cart',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13
                                                    ),
                                              )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);},
                                                child: Text('CONTINUE SHOPPING')
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                navigateTo(context, ShopLayout());
                                                ShopCubit.get(context).currentIndex = 3;
                                              },
                                              child: Text('CHECKOUT'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              elevation: 50,
                            );
                          }
                        },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.shopping_cart_outlined
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                  ),
            ),
          ],
        ) : Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            )
        ),
      );
      },
    );
  }
}

