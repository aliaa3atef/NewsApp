import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/newsappCubit/cubit.dart';
import 'package:news/shared/newsappCubit/states.dart';

class SearchScreen extends StatelessWidget {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<NewsAppCubit, NewsAppCubitState>(
          builder: (context, state) {
            var cubit = NewsAppCubit.get(context);
            return Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyText1,
                      decoration: InputDecoration(
                        hintText: "search",
                        hintStyle: Theme.of(context).textTheme.bodyText2,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String val){
                        NewsAppCubit.get(context).getSearch(val);
                      },
                    ),
                  ),

                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildNews(cubit.search[index], context),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.search.length,
                      physics: BouncingScrollPhysics(),
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
