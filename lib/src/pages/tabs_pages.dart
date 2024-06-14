import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/src/pages/tab1_pages.dart';
import 'package:provider/provider.dart';


class TabsPages extends StatelessWidget {
   
  
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}



class _Navegacion extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {


   final navegacionModel = Provider.of<_NavegacionModel>(context);
   

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [

        BottomNavigationBarItem(icon: Icon (Icons.home),label:'Inicio'),
        BottomNavigationBarItem(icon: Icon (Icons.public),label:'Web')
        
        ]
      );
  }
}




class _Paginas extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final navegacionModel= Provider.of<_NavegacionModel>(context);


    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
    
       Tab1Page(),
    
        Container(
          color: Colors.grey,
          )
       
    
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;

  PageController _pageController = PageController(initialPage: 1);

  int get paginaActual => _paginaActual;

  set paginaActual(int valor){
    _paginaActual = valor;
    notifyListeners();
    
    _pageController.animateToPage(valor,  duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  PageController get pageController => _pageController;



}