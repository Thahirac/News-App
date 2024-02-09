import 'package:flutter/material.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatefulWidget {
  final String newsUrl;
  WebViewNews({Key? key, required this.newsUrl}) : super(key: key);

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  final GlobalKey _webViewKey = GlobalKey();
  late final WebViewController _controller;
  double progress = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setNavigationDelegate(NavigationDelegate(onNavigationRequest: (action) {
        return NavigationDecision.navigate;
      }, onProgress: (progr) {
        setState(() {
          progress = progr.toDouble();
        });
      }, onPageFinished: (action) {
        setState(() {
          progress;
        });
      }))
      ..loadRequest(Uri.parse(widget.newsUrl));

    _controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          WebViewWidget(
            key: _webViewKey,
            controller: _controller,
          ),
          if (progress != 100)
            Container(
              color: Colors.white,
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.burgundy,
                strokeWidth: 2.5,
              )),
            )
        ]),
      ),
    );
  }
}
