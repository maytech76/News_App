import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index){

        return _Noticia( noticias[index], index);
      },
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia( 
    this.noticia, 
    this.index
    );



  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
        _TarjetaTopBar(noticia, index),

        _TarjetaTitulo(noticia),

        _TarjetaImagen(noticia),
       ],
    );
  }
}


class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Imagen'),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700 )),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {
 
 final Article noticia;
 final int index;

  const _TarjetaTopBar(this.noticia, this.index);


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Text('${ index + 1}.-'),
          Text('${ noticia.source.name}.')
        ],
      ),


    );
  }
}