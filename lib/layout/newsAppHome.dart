import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/searchScreen.dart';
import 'package:news/shared/newsappCubit/cubit.dart';
import 'package:news/shared/newsappCubit/states.dart';


class NewsAppHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit , NewsAppCubitState>(
        listener:(context , state){} ,
        builder: (context , state){
          var cubit = NewsAppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(icon: Icon(Icons.search), onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                  }),

                  IconButton(icon: Icon(Icons.brightness_4), onPressed: (){
                    cubit.changeTheme();
                  })
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar : BottomNavigationBar(
                  items: cubit.items,
                  currentIndex: cubit.currentIndex,
                  onTap:(index){cubit.changeBottomNavIndex(index);}
              ),
          );
        },
      );

  }
}
