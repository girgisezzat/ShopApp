import 'package:shop_app/models/shop_app/carts/addcarts_model.dart';
import 'package:shop_app/models/shop_app/favorites/change_favorites_model.dart';
import 'package:shop_app/models/shop_app/login/login_model.dart';

abstract class ShopState {}

class ShopInitialState extends ShopState{}
//Bottom NavigationBar
class ShopChangeBottomNavState extends ShopState{}


//Home
class ShopLoadingHomeDataState extends ShopState {}
class ShopSuccessHomeDataState extends ShopState {}
class ShopErrorHomeDataState extends ShopState
{
  late final String error;
  ShopErrorHomeDataState(this.error);
}


//Categories
class ShopSuccessCategoriesState extends ShopState {}
class ShopErrorCategoriesState extends ShopState
{
  late final String error;
  ShopErrorCategoriesState(this.error);
}


class ShopCategoryDetailsLoadingState extends ShopState {}
class ShopCategoryDetailsSuccessState extends ShopState {}
class ShopCategoryDetailsErrorState extends ShopState
{
  late final String error;

  ShopCategoryDetailsErrorState(this.error);
}



//Favorites
class ShopChangeFavoritesState extends ShopState {}
class ShopSuccessChangeFavoritesState extends ShopState
{
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState(this.model);
}
class ShopErrorChangeFavoritesState extends ShopState
{
  late final String error;

  ShopErrorChangeFavoritesState(this.error);
}



class ShopLoadingGetFavoritesState extends ShopState {}
class ShopSuccessGetFavoritesState extends ShopState {}
class ShopErrorGetFavoritesState extends ShopState
{
  late final String error;
  ShopErrorGetFavoritesState(this.error);
}



//ProductsDetails
class ShopLoadingProductsDetailsState extends ShopState {}
class ShopSuccessProductsDetailsState extends ShopState {}
class ShopErrorProductsDetailsState extends ShopState
{
  late final String error;

  ShopErrorProductsDetailsState(this.error);
}


//UserData
class ShopLoadingUserDataState extends ShopState {}
class ShopSuccessUserDataState extends ShopState
{
  final ShopLoginModel loginModel;
  ShopSuccessUserDataState(this.loginModel);
}
class ShopErrorUserDataState extends ShopState
{
  late final String error;

  ShopErrorUserDataState(this.error);
}


class ShopLoadingUpdateUserState extends ShopState {}
class ShopSuccessUpdateUserState extends ShopState
{
  final ShopLoginModel loginModel;
  ShopSuccessUpdateUserState(this.loginModel);
}
class ShopErrorUpdateUserState extends ShopState
{
  late final String error;

  ShopErrorUpdateUserState(this.error);
}



//CartsDetails
class ShopLoadingCartsState extends ShopState {}
class ShopSuccessGetCartsState extends ShopState {}
class ShopErrorGetCartsState extends ShopState
{
  late final String error;

  ShopErrorGetCartsState(this.error);
}


class ShopLoadingAddToCartState extends ShopState {}
class ShopSuccessAddToCartState extends ShopState {
  final AddCartModel addToCartModel;

  ShopSuccessAddToCartState(this.addToCartModel);
}
class ShopErrorAddToCartState extends ShopState
{
  late final String error;

  ShopErrorAddToCartState(this.error);
}


class ShopLoadingUpdateCartState extends ShopState {}
class ShopSuccessUpdateToCartState extends ShopState {}
class ShopErrorUpdateToCartState extends ShopState
{
  late final String error;

  ShopErrorUpdateToCartState(this.error);
}




