import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/newsApi_constants.dart';
import '../models/news_model.dart';
import '../repository/news_repository.dart';

class NewsController extends GetxController {
  // for list view
  List<ArticleModel> allNews = <ArticleModel>[];
  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxInt pageNum = 1.obs;
  RxInt pageSize = 10.obs;
  String baseUrl = "https://newsapi.org/v2/everything?"; // ENDPOINT

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getAllNews();
    super.onInit();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoading.value = true;
      getAllNews();
    }
  }

  // function to load and display all news and searched news on to UI
  getAllNews({reload = false}) async {
    if (isLoading.value == true && pageNum <= 9) {
      pageNum++;
    } else {
      allNews = [];
      pageNum.value = 1;
    }
    // url
    baseUrl = "https://newsapi.org/v2/everything?pageSize=$pageSize&page=$pageNum&q=business&languages=en&apiKey=${NewsApiConstants.newsApiKey}";
    print('Url : $baseUrl');
    // calling the API function and passing the URL here
    getAllNewsFromApi(baseUrl);
  }

  getAllNewsFromApi(url) async {
    // calling the API from the repository
    NewsModel newsData = await NewsRepository.fetchNews(url);
    if (newsData.status == "ok") {
      if (isLoading.value == true) {
        allNews = newsData.articles;
        update();
      } else {
        allNews = newsData.articles;
        // list scrolls back to the start of the screen
        if (scrollController.hasClients) scrollController.jumpTo(0.0);
        update();
      }
    }
  }
}
