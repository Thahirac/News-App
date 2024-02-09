# News Application 

This is a Flutter News Application using Google News API.

## Flutter Application using Google News API Documentation

1.Project Structure:

lib/
  |- models/
  |    |- news_model.dart
  |- views/
  |    |- splash_screen.dart
  |    |- home_screen.dart
  |    |- web_view_screen.dart
  |- controllers/
  |    |- news_controller.dart
  |- repository/
  |    |- news_repository.dart
  |- main.dart


-> models: 

   Contains the NewsModel,ArticleModel and SourceModel model class representing news article.

-> screens: 

   * HomePage class, which displays the list of news articles.
   * SplashScreen class, which displays the spalash application opening time.
   * WebViewNews class, which displays the source of the News(websites).

-> controllers: 

   Contains the NewsController class responsible for controlling data after fetching news articles from the Google News API.

-> repository: 

   Contains the NewsRepository class responsible for fetching news articles from the Google News API.

-> main.dart: 

   Entry point of the application.


2.Design Decisions:


-> Separation of Concerns: 

   The project follows a MVC pattern with clear separation of concerns. The models directory contains the data model, views directory contains UI components, and controllers directory handles data controlling and fetching.

-> State Management: 
   
   Since the application involves fetching data from an API, state management is crucial. The GetX package is used for state management to provide a scalable and efficient solution.

-> User Interface: 
   
   The UI is kept simple and intuitive. Each news article is displayed in a ListTile with a title, description, source, and published date. This design provides a clean and user-friendly interface for viewing news articles and after clicking on the ListTile time the particular new source also displayed.

-> API Integration:
  
   The NewsRepository class encapsulates the logic for fetching news articles from the Google News API. This ensures that the API integration code is isolated and can be easily maintained.



3. Additional Notes:


-> Error Handling:

   Proper error handling is essential when dealing with network requests. The application should handle cases where the API request fails or returns unexpected data. Error messages can be displayed to the user to provide feedback.







