import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/newsAppHome.dart';
import 'package:news/shared/blocObserver/bloc_observe.dart';
import 'package:news/shared/components/constants.dart';
import 'package:news/shared/network/local/cashedHelper.dart';
import 'package:news/shared/network/remote/DioHelper.dart';
import 'package:news/shared/newsappCubit/cubit.dart';
import 'package:news/shared/newsappCubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashedHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()
        ..getBusiness()
        ..getSport()
        ..getScience(),
      child: BlocConsumer<NewsAppCubit, NewsAppCubitState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                    bodyText2: TextStyle
                      (
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  dividerTheme: DividerThemeData(
                    color: colorApp,
                    thickness: 1,
                  ),
                  primarySwatch: colorApp,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle:
                        TextStyle(color: Colors.black, fontSize: 25),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: colorApp,
                      unselectedItemColor: Colors.black,
                      type: BottomNavigationBarType.fixed,
                      elevation: 50,
                      backgroundColor: Colors.white)),
              darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                bodyText2: TextStyle
                  (
                  color: Colors.white,
                  fontSize: 16,
                ),
                ),
                dividerTheme: DividerThemeData(
                  color: colorApp,
                  thickness: 1,
                ),
                primarySwatch: colorApp,
                scaffoldBackgroundColor: HexColor('33312b'),
                appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('33312b'),
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('33312b'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: colorApp,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  elevation: 50,
                  backgroundColor: HexColor('33312b'),
                ),
              ),
              themeMode: CashedHelper().getBoolean(key: 'isDark') ||
                      CashedHelper().getBoolean(key: 'isDark') == null
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: NewsAppHome(),
              debugShowCheckedModeBanner: false,
            );
          },
          listener: (context, state) {}),
    );
  }
}
