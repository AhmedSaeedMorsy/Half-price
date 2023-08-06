
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/resources/strings_manager.dart';
import '../../brands/view/brands_screen.dart';
import '../../favorites/view/favorites_screen.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import 'states.dart';

class LayoutBloc extends Cubit<LayoutStates> {
  LayoutBloc() : super(LayoutInitState());
  static LayoutBloc get(context) => BlocProvider.of(context);
  int index = 0;
  List<String> appBarTitle = [
    AppStrings.appName,
    AppStrings.brands.tr(),
    AppStrings.favoriteProducts.tr(),
    AppStrings.profile.tr()
  ];
  List<Widget> screens = [
    HomeScreen(),
    const BrandsScreen(),
    const FavoritesScreen(),
    const ProfileScreen()
  ];
  void changeBottomNavBar(int currentIndex) {
    index = currentIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
