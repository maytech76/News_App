
import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;


class NewsService with ChangeNotifier{
 
 List<Article> headlines = [];

 NewsService(){

  getTopHeadlines();
   
 }
 
  Uri? get uri => null;

  getTopHeadlines()   async{

    final uri = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=431d4fc21f6041f8a55ababc7795044f');

    final resp = await http.get(uri);

    final newsResponse = newsResponseFromJson(resp.body);

  /*  newsResponse.articles[1].author; */

  headlines.addAll(newsResponse.articles);

  notifyListeners();
    
  }
  
   

  


}