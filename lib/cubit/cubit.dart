import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/scientific.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/cash_helper.dart';
import 'package:news_app/shared/dio_helper.dart';
class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitialState());
 static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  bool isDark=false;
  List<Widget>screens=[
    Business(),
    Sport(),
    Scientific()
  ];

  void ChangeBottomNav(index){
    currentIndex=index;
    emit(newsChangeBottomNav());
  }
void changeThemeMode({ bool? fromShared}){
    if (fromShared!=null)
    {
      isDark=fromShared;
      emit(newsChangeThemeMode());
    }
    else{
      isDark=!isDark;
      CashHelper.putBoolean(key: "isDark", value: isDark).
      then((value) {emit(newsChangeThemeMode());} );
      emit(newsChangeThemeMode());
    }

}
  List<dynamic> business=[];
  void getBusiness(){
    emit(getBusinessLoading());
    DioHelper.getData(url: "v2/top-headlines", querry: {
      "country": "eg",
      "category":"business",
      "apiKey":"19e94ef4f1ea4862969df255cb678a8e"

    }).then((value) {
      business=value.data["articles"];
      print(business[0]["title"]);
      emit(getBusinessSuccess());} ).
    catchError((e){print(e.toString());});
    emit((getBusinessError(e.toString())));
  }
  List<dynamic> sport=[];
  void getSport(){
    emit(getSportLoading());
    DioHelper.getData(url: "v2/top-headlines", querry: {
      "country": "eg",
      "category":"sports",
      "apiKey":"19e94ef4f1ea4862969df255cb678a8e"

    }).then((value) {
      sport=value.data["articles"];
      print(sport[0]["title"]);
      emit(getSportSuccess());} ).
    catchError((e){print(e.toString());});
    emit((getSportError(e.toString())));
  }
  List<dynamic> science=[];
  void getScience(){
    emit(getScienceLoading());
    DioHelper.getData(url: "v2/top-headlines", querry: {
      "country": "eg",
      "category":"science",
      "apiKey":"19e94ef4f1ea4862969df255cb678a8e"

    }).then((value) {
      science=value.data["articles"];
      print(science[0]["title"]);
      emit(getscienceSuccess());} ).
    catchError((e){print(e.toString());});
    emit((getScienceError(e.toString())));
  }
  List<dynamic> search=[];
  void getsearch( String value){
    isSearch=false;
    emit(getSearchLoading());
    search=[];

    DioHelper.getData(url: "v2/everything", querry: {

      "q":"$value",
      "apiKey":"19e94ef4f1ea4862969df255cb678a8e"

    }).then((value) {
      search=value.data["articles"];
      print(search[0]["title"]);
      emit(getSearcheSuccess());} ).
    catchError((e){print(e.toString());});
    emit((getSearchError(e.toString())));
  }
  bool isSearch=true;

}

