import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tabs_pages.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/mytheme.dart';
import 'package:provider/provider.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=>new NewsService() ),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: TabsPages()
         
      ),
    );
  }
}