import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'modules/news_layout.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            theme:  ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:Colors.red,
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                // backgroundColor: Colors.deepOrange,
              ),

            ),
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),
          );
        },

      ),
    );

  }
}
