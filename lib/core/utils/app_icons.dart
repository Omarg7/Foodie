import 'package:flutter/material.dart';

import '../../config/theme/app_color/app_color.dart';
import 'app_sizes.dart';

class CustomIconStyle {
  static const IconThemeData  appBarIconThemeData = IconThemeData(
    color: AppColors.appBarIconColor,size: AppSizes.iconSize22,
  );
  static const TextStyle  darkAppBarTitle = TextStyle(
      fontSize: AppSizes.fontSize22,color: AppColors.black,fontWeight: FontWeight.w600
  );
  static const IconThemeData  dialogIcon = IconThemeData(
    color: AppColors.grey,size: AppSizes.iconSize20,
  );

}
class AppIcons{
 static const IconData translate = Icons.translate;
 static const IconData edit = Icons.edit;
 static const IconData delete = Icons.delete_forever;
 static const IconData home = Icons.home;
 static const IconData cart = Icons.shopping_cart_outlined;
 static const IconData addToCart = Icons.add_shopping_cart;
 static const IconData settings = Icons.settings;
 static const IconData ordersHistory = Icons.list;
 static const IconData location =  Icons.location_on;
 static const IconData city =  Icons.location_city;
 static const IconData signpost =  Icons.signpost;
 static const IconData person =  Icons.person;
 static const IconData email =  Icons.email;
 static const IconData store =  Icons.store;
 static const IconData storefront =  Icons.storefront;
 static const IconData arrowDropDown =  Icons.arrow_drop_down_circle_outlined;

 static const IconData phone =  Icons.phone;
 static const IconData add =  Icons.add;

 // static const IconData phone =  Icons.store;
 // static const IconData storeType =  Icons.storefront;
 // static const IconData phone =  Icons.store;
 // static const IconData storeType =  Icons.storefront;
 // static const IconData phone =  Icons.store;
 // static const IconData storeType =  Icons.storefront;
 // static const IconData phone =  Icons.store;
 // static const IconData storeType =  Icons.storefront;



}