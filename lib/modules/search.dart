import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
class Search extends StatelessWidget {


var searchController=TextEditingController();
 GlobalKey keysearch=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state)=>{},
    builder: (context,state){
    NewsCubit cubit=NewsCubit.get(context);
    return
      Scaffold(
      appBar: AppBar(),
      body:
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Form(
           key: keysearch,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             defaultFormField(
               controller: searchController,
               type: TextInputType.text,
               // onChange: (value){cubit.getsearch(value);},

               onSubmit: (value){cubit.getsearch(value);
               },
               validate: (value){
                 if(value!.isEmpty){return "الحقل لا يجب ان يكون فارغ";}
                 return null;
               },

               label: "بحث",
               prefix: Icons.search,
             ),
           Expanded(
             child: ConditionalBuilder(
               condition: cubit.search.length>0,
               builder: (context)=>ListView.separated(
                   physics: BouncingScrollPhysics(),
                   itemBuilder:(context,index)=>buildArticleItem(cubit.search[index],context),
                   separatorBuilder:(context,index)=>MyDivider(),
                   itemCount: cubit.search.length),
               fallback:(context)=>cubit.isSearch?Container():Center(child: CircularProgressIndicator()) ),
           )
           ],),
         ),
       )
      );})
      ;
  }
}
