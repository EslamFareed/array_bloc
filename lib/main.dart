import 'package:array_bloc/cubits/home/home_cubit.dart';
import 'package:array_bloc/cubits/search/search_cubit.dart';
import 'package:array_bloc/screens/home_screen.dart';
import 'package:array_bloc/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}


//! News App

//! Headlines News

//! Search for News

//! Press any news Open Link for news details