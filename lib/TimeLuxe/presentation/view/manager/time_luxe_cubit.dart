import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/domain/time_luxe_repo.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/core/global/app_constants.dart';

import 'package:time_luxe/core/global/helper.dart';
import 'package:time_luxe/core/models/favorite_model.dart';
import 'package:time_luxe/core/models/user_model.dart';
import 'package:time_luxe/features/welcome/presentation/views/welcome_view.dart';

import '../../../../core/models/bag_model.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../features/bag/presentation/widgets/bag_view_body.dart';
import '../../../../features/home/presentation/widgets/home_body.dart';
import '../../../../features/profile/presentation/widgets/profile_view_body.dart';
import '../../../../features/search/presentation/widgets/search_view_body.dart';

class TimeLuxeCubit extends Cubit<TimeLuxeStates> {
  TimeLuxeCubit(this.timeLuxeRepo) : super(TimeLuxeInitialState());

  static TimeLuxeCubit getObject(context) => BlocProvider.of(context);

  TimeLuxeRepo timeLuxeRepo;

  int ordersCounter = 1;

  int currentIndex = 0;

  bool passVisibility = true;
  bool confirmPassVisibility = true;

  void increment() {
    ordersCounter++;
    emit(IncrementSuccessState());
  }

  void decrement() {
    if (ordersCounter > 1) {
      ordersCounter--;
      emit(DecrementSuccessState());
    }
  }

  List<Widget> body = const <Widget>[
    HomeBody(),
    SearchViewBody(),
    BagViewBody(),
    ProfileViewBody(),
  ];

  List<BottomNavigationBarItem> bottomNavItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Search',
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: 'Bag',
      icon: Icon(Icons.shopping_bag),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(Icons.person),
    ),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  void getUserData(String? uId) {
    emit(GetUserLoadingState());

    // Getting the user's id
    uId = CacheHelper.getStringData(key: 'uId');

    timeLuxeRepo.getUserData(uId).then((value) {
      Helper.model = UserModel.fromJson(value.data()!);

      emit(GetUserSuccessState());
      debugPrint("USER HAS BEEN GOT");
    }).catchError((error) {
      GetUserErrorState(error.toString());
    });
  }

  List<FavoriteModel> favorites = <FavoriteModel>[];

  void addToFav(FavoriteModel favItem) {
    favorites.add(favItem);
    emit(AddToFavoriteSuccessState());
  }

  void removeFromFav(FavoriteModel favItem) {
    favorites.remove(favItem);
    emit(RemoveFromFavoriteSuccessState());
  }

  void addToBag(BagModel bagProduct) {
    AppConstants.bagItems.add(bagProduct);
    emit(AddToBagSuccessState());
  }

  void removeBagProduct(BagModel bagProduct, int index) {
    AppConstants.bagItems.removeAt(index);
    emit(RemoveFromBagSuccessState());
  }

  double countAllBagPrices() {
    double sum = 0;

    for (int i = 0; i < AppConstants.bagItems.length; i++) {
      sum += AppConstants.bagItems[i].price!;
    }

    return sum;
  }

  void signOut() {
    timeLuxeRepo.signOut().then((value) {
      CacheHelper.removeData(key: 'uId');
      CustomNavigator.navigateAndFinish(screen: () => const WelcomeView());
      emit(SignOutSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SignOutErrorState(error.toString()));
    });
  }
}
