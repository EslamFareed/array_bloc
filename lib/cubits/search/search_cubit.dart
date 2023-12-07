import 'package:array_bloc/models/article_model.dart';
import 'package:array_bloc/utils/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  ArticleModel? articleModel;

  void search(String text) async {
    emit(SearchLoadingState());

    try {
      var response =
          await DioHelper.dio.get(searchUrl, queryParameters: {"q": text});
      if (response.statusCode == 200) {
        articleModel = ArticleModel.fromJson(response.data);
        emit(SearchSuccessState());
      } else {
        emit(SearchErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(SearchErrorState());
    }
  }
}
