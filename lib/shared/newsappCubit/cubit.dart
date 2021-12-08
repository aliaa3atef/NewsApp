import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/newsappCubit/states.dart';
import 'package:news/modules/buisinessScreen/BusinessScreen.dart';
import 'package:news/modules/scienceScreen/scienceScreen.dart';
import 'package:news/modules/settingsScreen/settingScreen.dart';
import 'package:news/modules/sportScreen/sportScreen.dart';
import 'package:news/shared/network/local/cashedHelper.dart';
import 'package:news/shared/network/remote/DioHelper.dart';


class NewsAppCubit extends Cubit<NewsAppCubitState> {
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> title = ["Business", "Sport", "Science", "Setting"];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
   // SettingScreen()
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(NewsAppBottomNavChangeState());
  }

  List<dynamic> business = [];

  void getBusiness() {

    emit(NewsAppLoadingBusinessState());

    DioHelper.getDate(
      url: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"business",
        "apiKey":"237752786a904f599d283c786f8a6150"
      },
    ).then((value){
      business = value.data['articles'];
      emit(NewsAppBusinessSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(NewsAppBusinessErrorState());
    });
  }

  List<dynamic> sport = [];

  void getSport() {

    emit(NewsAppLoadingSportState());

    DioHelper.getDate(
      url: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"sports",
        "apiKey":"237752786a904f599d283c786f8a6150"
      },
    ).then((value){
      sport = value.data['articles'];
      emit(NewsAppSportSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(NewsAppSportErrorState());
    });
  }

  List<dynamic> science = [];

  void getScience() {

    emit(NewsAppLoadingScienceState());

    DioHelper.getDate(
      url: "v2/top-headlines",
      query: {
        "country":"eg",
        "category":"science",
        "apiKey":"237752786a904f599d283c786f8a6150"
      },
    ).then((value){
      science = value.data['articles'];
      emit(NewsAppScienceSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(NewsAppScienceErrorState());
    });
  }

  bool isDark = false;

  void changeTheme(){
    isDark = !isDark;
    CashedHelper().setBoolean(key: 'isDark', value: isDark).then((value){
      emit(NewsAppChangeThemeState());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {

    emit(NewsAppLoadingSearchState());


     DioHelper.getDate(
      url: "v2/everything",
      query: {
        "q":"$value",
        "apiKey":"237752786a904f599d283c786f8a6150"
      },
    ).then((value){
      search = value.data['articles'];
      emit(NewsAppSearchSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(NewsAppSearchErrorState());
    });
  }


}
