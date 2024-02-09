import 'package:http/http.dart' as http;
import 'package:news_app/constants/color_constants.dart';
import 'dart:convert';
import '../models/news_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewsRepository {
  static Future<NewsModel> fetchNews(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {

      Fluttertoast.showToast(
          msg: response.body,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: AppColors.burgundy,
          textColor: AppColors.white,
          fontSize: 16.0
      );

      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
