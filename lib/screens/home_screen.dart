import 'package:array_bloc/cubits/home/home_cubit.dart';
import 'package:array_bloc/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/item_article.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context).getHeadLines();

    return Scaffold(
      appBar: AppBar(
        title: const Text("EGY News"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetHeadLinesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetHeadLinesErrorState) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.not_interested),
                  Text("Error in Loading Data"),
                ],
              ),
            );
          }

          var list = HomeCubit.get(context).headline!.articles;

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return ItemArticleView(
                article: list[index],
              );
            },
            itemCount: list!.length,
          );
        },
      ),
    );
  }
}
