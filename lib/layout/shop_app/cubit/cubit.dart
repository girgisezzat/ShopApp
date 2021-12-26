import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/cubit/states.dart';
import 'package:shop_app/models/shop_app/carts/addcarts_model.dart';
import 'package:shop_app/models/shop_app/carts/carts_model.dart';
import 'package:shop_app/models/shop_app/categories/categories_model.dart';
import 'package:shop_app/models/shop_app/categories/categoriesdetails_model.dart';
import 'package:shop_app/models/shop_app/favorites/change_favorites_model.dart';
import 'package:shop_app/models/shop_app/favorites/favorites_model.dart';
import 'package:shop_app/models/shop_app/home/home_model.dart';
import 'package:shop_app/models/shop_app/home/productdetails_models.dart';
import 'package:shop_app/models/shop_app/login/login_model.dart';
import 'package:shop_app/models/shop_app/carts/updatecart_model.dart';
import 'package:shop_app/modules/shop_app/carts/CartsScreen.dart';
import 'package:shop_app/modules/shop_app/categories/CategoriesScreen.dart';
import 'package:shop_app/modules/shop_app/favorites/FavoritesScreen.dart';
import 'package:shop_app/modules/shop_app/home/HomeScreen.dart';
import 'package:shop_app/modules/shop_app/settings/SettingsScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopState>
{
  ShopCubit() : super(ShopInitialState());

  //to be more easily when use this cubit in many places
  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems=[

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_sharp),
      label: 'Carts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> screens =[
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartsScreen(),
    SettingsScreen(),
  ];

  List<String> titles =[
    'Home',
    'Categories',
    'Favorites',
    'Carts',
    'Settings',
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }


  Map<int, bool> favorites = {};
  Map<int, bool> cartProducts = {};

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);//put data in model

      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });

      homeModel!.data!.products.forEach((element)
      {
        cartProducts.addAll({
          element.id : element.inCart
        });
      });
      //print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      //print(error.toString());
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }


  ProductDetailsModel? productDetailsModel;
  void getProductData( productId ) {
    productDetailsModel = null;
    emit(ShopLoadingProductsDetailsState());
    DioHelper.getData(
        url: 'products/$productId',
        token: token
    ).then((value){
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(ShopSuccessProductsDetailsState());
    }).catchError((error){
      emit(ShopErrorProductsDetailsState(error.toString()));
      print(error.toString());
    });
  }


  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState(error.toString()));
    });
  }


  CategoryDetailModel? categoriesDetailModel;
  void getCategoriesDetailData( int? categoryID ) {
    emit(ShopCategoryDetailsLoadingState());
    DioHelper.getData(
        url: CATEGORIES_DETAIL,
        query: {
          'category_id':'$categoryID',
        }
    ).then((value){
      categoriesDetailModel = CategoryDetailModel.fromJson(value.data);
      print('categories Detail '+categoriesDetailModel!.status.toString());
      emit(ShopCategoryDetailsSuccessState());
    }).catchError((error){
      emit(ShopCategoryDetailsErrorState(error.toString()));
      print(error.toString());
    });
  }


  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data:
      {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (! changeFavoritesModel!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState(error.toString()));
    });
  }


  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState(error.toString()));
    });
  }


  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState(error.toString()));
    });
  }


  void updateUserData({
    required String name,
    required String email,
    required String phone,
}) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data:{
        'name':name,
        'email':email,
        'phone':phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState(error.toString()));
    });
  }


  late CartModel cartsModel;
  void getCartData() {
    emit(ShopLoadingCartsState());

    DioHelper.getData(
       url: CARTS,
       token: token,
    ).then((value) {
      cartsModel = CartModel.fromJson(value.data);

      print(cartsModel.status.toString());
      emit(ShopSuccessGetCartsState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorGetCartsState(error.toString()));
    });
  }


  late AddCartModel addCartModel;
  void addToCart(int? productId) {
    emit(ShopLoadingAddToCartState());
    DioHelper.postData(
      url: CARTS ,
      token: token,
      data:
      {
        'product_id': productId,
      },
    ).then((value) {
      addCartModel = AddCartModel.fromJson(value.data);
      if(addCartModel.status) {
        getCartData();
        getHomeData();
      }
      else
        showToast(
          text: addCartModel.message,
          state: ToastStates.WARNING,
        );
      emit(ShopSuccessAddToCartState(addCartModel));
    }).catchError((error) {
      emit(ShopErrorAddToCartState(error.toString()));
      print(error.toString());
    });
  }


  late UpdateCartModel  updateCartModel;
  void updateCartData(int? cartId,int? quantity) {
    emit(ShopLoadingUpdateCartState());
    DioHelper.putData(
      url: 'carts/$cartId',
      token: token,
      data:
      {
        'quantity':'$quantity',
      },
    ).then((value){
      updateCartModel = UpdateCartModel.fromJson(value.data);
      if(updateCartModel.status)
        getCartData();
      else
        showToast(
          text: updateCartModel.message,
          state: ToastStates.WARNING,
        );
      print('Update Cart '+ updateCartModel.status.toString());
      emit(ShopSuccessUpdateToCartState());
    }).catchError((error){
      emit(ShopErrorUpdateToCartState(error.toString()));
      print(error.toString());
    });
  }

}