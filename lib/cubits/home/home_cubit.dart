import 'package:array_bloc/models/article_model.dart';
import 'package:array_bloc/utils/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  ArticleModel? headline;

  void getHeadLines() async {
    emit(GetHeadLinesLoadingState());

    try {
      var response = await DioHelper.dio.get(getHeadLinesUrl);
      if (response.statusCode == 200) {
        headline = ArticleModel.fromJson(response.data);

        emit(GetHeadLinesSuccessState());
      } else {
        emit(GetHeadLinesErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(GetHeadLinesErrorState());
    }
  }
}
