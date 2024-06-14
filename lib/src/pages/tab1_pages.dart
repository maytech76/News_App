


import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {

  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {


    final newsService = Provider.of<NewsService>(context);

    return  Scaffold(
      body: ListaNoticias( newsService.headlines)
      );
  }
}