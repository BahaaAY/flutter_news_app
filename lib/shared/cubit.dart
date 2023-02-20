import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/modules/business/business_screen.dart';
import 'package:flutter_news_app/modules/science/science_screen.dart';
import 'package:flutter_news_app/modules/settings/settings_screen.dart';
import 'package:flutter_news_app/modules/sports/sports_screen.dart';
import 'package:flutter_news_app/shared/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;
  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      label: "Sports",
      icon: Icon(Icons.sports_basketball),
    ),
    const BottomNavigationBarItem(
      label: "Business",
      icon: Icon(Icons.business),
    ),
    const BottomNavigationBarItem(
      label: "Science",
      icon: Icon(Icons.science),
    ),
    const BottomNavigationBarItem(
      label: "Settings",
      icon: Icon(Icons.settings),
    ),
  ];

  List<Widget> screens = [SportsScreen(),BusinessScreen(),ScienceScreen(),SettingsScreen()];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsChangeNavBarState());
  }
}
