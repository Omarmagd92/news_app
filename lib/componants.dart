import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webView.dart';

import 'cubit/cubit.dart';
 Widget defaultFormField({
    required TextEditingController controller,
      required TextInputType type,
      Function(String)? onSubmit,
      Function(String)? onChange,
      void Function()? onTap,
      bool isPassword = false,
      required String? Function(String? val)? validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      Function()? suffixPressed}) =>
    TextFormField(
      textDirection:TextDirection.rtl ,

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
            icon: Icon(suffix),
            onPressed: suffixPressed,
          )
              : null,
          border: OutlineInputBorder()),
    );
 Widget buildArticleItem(article,context)=> InkWell(onTap: (){
   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
       WebViewScreen(url:article["url"] )));
 },
     child:Padding(
   padding: const EdgeInsets.all(20.0),
   child: Row(children: [
     Container(width: 120,height: 120,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
           image:DecorationImage(image:NetworkImage("${article["urlToImage"]}"
           ),fit: BoxFit.cover) ),),
     SizedBox(
       width: 20,),
     Expanded(
       child: Container(
         height: 120,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(
                 child:  Text(
                   "${article["title"]}",style: TextStyle(
                     fontWeight: FontWeight.w600,fontSize: 18),
                   maxLines: 4,overflow: TextOverflow.ellipsis,))
             ,
             Text(
               "${article["publishedAt"]}",style: TextStyle(color: Colors.grey),),],
           mainAxisSize: MainAxisSize.min,),
       ),
     )
   ],),
 ));

 class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
// Widget buildTaskItem(Map model,context) =>Dismissible(
//   key: Key(model["id"].toString()),
//   child:  Padding(
//       padding: EdgeInsets.all(16),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 40,
//             child: Text(
//               "${model["time"]}",
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(child:
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "${model["title"]}",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                   "${model["date"]}", style: TextStyle(color: Colors.grey))
//             ],
//           )),
//           SizedBox(
//             width: 20,
//           ),
//           IconButton(onPressed: (){AppCubit.get(context).UpdateData(status: "done", id: model["id"]);},
//               icon: Icon(Icons.check_box,color: Colors.green,)),
//           IconButton(onPressed: (){AppCubit.get(context).UpdateData(status: "archived", id: model["id"]);},
//               icon: Icon(Icons.archive,color: Colors.black45,)),
//         ]
//         ,)
//
//   ),onDismissed: (direction) {
//   AppCubit.get(context).deleteData(id: model["id"]);
// },);
// Widget TaskBuilder({required List<Map>tasks})=>ConditionalBuilder(
//     condition:tasks.length>0 ,
//     builder: (context)=>ListView.separated(
//         itemBuilder:(context,index)=> buildTaskItem(AppCubit.get(context).tasks[index],context),
//         separatorBuilder: (context,index)=>Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Container(
//             width: double.infinity,height: 1,color: Colors.grey[300],),
//         ),
//         itemCount: AppCubit.get(context).tasks.length),
//     fallback: (context)=>Center(
//       child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
//         Icon(Icons.menu,color: Colors.grey,size: 100,),
//         Text("لا يوجد مهام لتنفيذها",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)],),
//     )
// );