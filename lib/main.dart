import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/cash_helper.dart';
import 'package:news_app/shared/dio_helper.dart';

import 'cubit/cubit.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark=CashHelper.getBoolean(key: "isDark");
  runApp( MyApp( isDark));
}

class MyApp extends StatelessWidget {
   final bool? isDark;
  MyApp( this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(create: (context)=>NewsCubit()..changeThemeMode(fromShared: isDark)..getBusiness()..getSport()..getScience(),
      child:BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state)=>{},
        builder: (context,state){
          NewsCubit cubit=NewsCubit.get(context);
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', 'EG'), // English, no country code
              // Spanish, no country code
            ],

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Colors.white ,
              statusBarIconBrightness: Brightness.dark),
              elevation: 0,titleTextStyle: TextStyle(
              color:Colors.black,fontWeight: FontWeight.bold ,fontSize: 25),iconTheme: IconThemeData(color: Colors.black26)),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,unselectedItemColor: Colors.grey,elevation: 20,backgroundColor: Colors.white),
            primarySwatch: Colors.deepOrange
              ,floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              textTheme: TextTheme(bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black26)),
              brightness: Brightness.light
          ),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.black26,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Colors.black26 ,
                    statusBarIconBrightness: Brightness.light),
                  elevation: 0,titleTextStyle: TextStyle(
                    color:Colors.white,fontWeight: FontWeight.bold ,fontSize: 25),iconTheme: IconThemeData(color: Colors.white)),
                scaffoldBackgroundColor: Colors.black26,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,unselectedItemColor: Colors.grey,elevation: 20,backgroundColor: Colors.black26),
                primarySwatch: Colors.deepOrange
                ,floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              textTheme: TextTheme(bodyText1: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)),
                brightness: Brightness.dark

            ) ,
            themeMode: cubit.isDark?ThemeMode.dark:ThemeMode.light,
          home:Directionality(
            textDirection: TextDirection.rtl,
          child: HomePage(),),
        );},) ,);

  }
}


