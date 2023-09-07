import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/class_model.dart';
import '../modules/bottom_nav_screens/buisness_screen.dart';
import '../modules/bottom_nav_screens/science_screen.dart';
import '../modules/bottom_nav_screens/sports_screen.dart';
import '../service/dio_data.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }

    if(index == 2) {
      getScience();
    }


    emit(NewsBottomNavState());
  }


  List<ArticlesModel>business=[];
  void getBusiness() async{
    emit(NewsGetBusinessLoadingState());
    await DioData().getBusiness().then((value){
      business = value;
      print(value[0].url);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }

  List<ArticlesModel>sports=[];
  void getSports() async{
    emit(NewsGetSportsLoadingState());
    await DioData().getSports().then((value){
      sports = value;
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(NewsGetSportsErrorState(error.toString()));
    });

  }

  List<ArticlesModel>science=[];
  void getScience() async{
    emit(NewsGetScienceLoadingState());
    await DioData().getScience().then((value){
      science = value;
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(NewsGetScienceErrorState(error.toString()));
    });

  }

  List<ArticlesModel>search=[];
  void getSearch({required String keyWord}) async{
    emit(NewsGetSearchLoadingState());
    await DioData().getSearch(keyWord).then((value){
      search = value;
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });

  }

  late  WebViewController controller;
  void getWebView(String url){
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(url),
      );
    emit(NewsWebViewState());

  }

}
