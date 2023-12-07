import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
}

const getHeadLinesUrl =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=e3b8fdc5a0154931b38b9162b1ee0aac";

const searchUrl = "https://newsapi.org/v2/everything?sortBy=publishedAt&apiKey=e3b8fdc5a0154931b38b9162b1ee0aac";
