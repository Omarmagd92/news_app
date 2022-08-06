import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/dio_helper.dart';
class Business extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state)=>{},
    builder: (context,state){
    NewsCubit cubit=NewsCubit.get(context);
    return
    ConditionalBuilder(
        condition: cubit.business.length>0,
        builder: (context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
    itemBuilder:(context,index)=>buildArticleItem(cubit.business[index],context),
    separatorBuilder:(context,index)=>MyDivider(),
    itemCount: cubit.business.length),
        fallback:(context)=>Center(child: CircularProgressIndicator()) );
  });
}}
