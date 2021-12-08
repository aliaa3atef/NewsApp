import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/newsappCubit/cubit.dart';
import 'package:news/shared/newsappCubit/states.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit , NewsAppCubitState>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = NewsAppCubit.get(context);
        return cubit.science.length > 0 ? ListView.separated(
          itemBuilder: (context , index) => buildNews(cubit.science[index] , context),
          separatorBuilder: (context , index) => Divider(),
          itemCount: cubit.science.length ,
          physics: BouncingScrollPhysics() ,
        ):Center(child: CircularProgressIndicator());
      },

    );
  }
}
