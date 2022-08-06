import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'modules/search.dart';
class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state)=>{},
    builder: (context,state){
      NewsCubit cubit=NewsCubit.get(context);
      return  Scaffold(
    appBar:AppBar(title: Text("الاخبار",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    actions: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Search() ));}, icon: Icon(Icons.search)),
    IconButton(
        onPressed: (){cubit.changeThemeMode();}, icon: Icon(Icons.brightness_4_outlined)) ],) ,
    bottomNavigationBar: BottomNavigationBar(items: [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: "اعمال"),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: "رياضة"),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: "علوم"),],
    onTap: (index){cubit.ChangeBottomNav(index);},
      currentIndex: cubit.currentIndex,type: BottomNavigationBarType.fixed,),
      body: cubit.screens[cubit.currentIndex],); });


  }
}
