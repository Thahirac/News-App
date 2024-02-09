import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/web_view_news.dart';
import '../constants/color_constants.dart';
import '../constants/ui_constants.dart';
import '../contollers/news_controller.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/news_card.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('News App', context),
      body: RefreshIndicator(
        color: AppColors.burgundy,
        onRefresh: ()async{
            newsController.isLoading = true.obs;
            newsController.getAllNews(reload: true);
            newsController.update();
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vertical20,
              /// Fetching News part UI
              GetBuilder<NewsController>(
                  init: NewsController(),
                  builder: (controller) {
                    return controller.allNews.isEmpty
                        ? const Center(child: CircularProgressIndicator(color: AppColors.burgundy,strokeWidth: 2.5,))
                        : ListView.builder(
                        controller: controller.scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.allNews.length,
                        itemBuilder: (context, index) {
                          index == controller.allNews.length - 1 && controller.isLoading.isTrue
                              ? const Center(
                            child: CircularProgressIndicator(color: AppColors.burgundy,strokeWidth: 3.5,),
                          )
                              : const SizedBox();
                          return InkWell(
                            onTap: () {
                              Get.to(() => WebViewNews(newsUrl: controller.allNews[index].url));
                            },
                            child: NewsCard(
                                desc: controller.allNews[index].description ?? '',
                                title: controller.allNews[index].title,
                                postUrl: controller.allNews[index].url,
                                publishAt: controller.allNews[index].publishedAt,),
                          );
                        });
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
