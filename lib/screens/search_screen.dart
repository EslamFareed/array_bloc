import 'package:array_bloc/cubits/search/search_cubit.dart';
import 'package:array_bloc/screens/components/item_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SearchBar(
              controller: controller,
              onSubmitted: (value) {
                SearchCubit.get(context).search(value);
              },
              trailing: [
                IconButton(
                  onPressed: () {
                    SearchCubit.get(context).search(controller.text);
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            // BlocBuilder<SearchCubit, SearchState>(
            //   builder: (context, state) {
            //   },
            // ),
            // BlocListener<SearchCubit, SearchState>(
            //   listener: (context, state) {
            // if (state is SearchSuccessState) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Search Successfully")));
            // }
            //   },
            //   child: SizedBox(),
            // ),

            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is SearchSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Search Successfully")));
                }
              },
              builder: (context, state) {
                print(state);
                if (state is SearchLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchErrorState) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else if (state is SearchSuccessState) {
                  var list = SearchCubit.get(context).articleModel!.articles;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemArticleView(article: list[index]);
                    },
                    itemCount: list!.length,
                  );
                }

                return const Center(
                  child: Text("Please Search"),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
