import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../componants.dart';
class Scientific extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state)=>{},
        builder: (context,state){
          NewsCubit cubit=NewsCubit.get(context);
          return
            ConditionalBuilder(
                condition: cubit.science.length>0,
                builder: (context)=>ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index)=>buildArticleItem(cubit.science[index],context),
                    separatorBuilder:(context,index)=>MyDivider(),
                    itemCount: cubit.science.length),
                fallback:(context)=>Center(child: CircularProgressIndicator()) );
        });
  }}