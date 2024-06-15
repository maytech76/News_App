import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/mytheme.dart';

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

        _TarjetaBody(noticia),

        _TarjetaBotones(),

        const SizedBox( height: 10),

        const Divider(),

       
       ],
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

          padding: const EdgeInsets.only(top: 10, bottom: 2),
          child: Row(
            children: <Widget>[
              Text('${ index + 1}.-'),
              Text('${ noticia.source.name}.'),
            ],
          ),


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
      child: Text(noticia.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700 )),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
 
  final Article noticia;

    const _TarjetaBody( this.noticia);

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Text( (noticia.description ?? '')),
      );
    }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen( this.noticia);

  @override
  Widget build(BuildContext context) {


        return Container(
          margin: const EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
          child: ClipRRect(


            borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15), 
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                ),

            child: Container(
                child: (noticia.urlToImage != null)
                    ? FadeInImage(
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Text(
                            '   Image not load   ',
                            style:
                                TextStyle(fontSize: 25, color: Colors.red),
                          );
                        },
                        placeholder: const AssetImage('assets/img/loading.gif'),
                        image: NetworkImage(noticia.urlToImage!),
                        fit: BoxFit.cover,
                      )
                    : const Image(
                        image: AssetImage('assets/img/no-image.png'),
                        fit: BoxFit.cover,
                      )
                      ),
          ),
        );


  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

            

            RawMaterialButton(
              onPressed: (){},
              fillColor: Color.fromARGB(255, 52, 125, 242),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.star_border_outlined),
            ),

            SizedBox(width: 12),

             RawMaterialButton(
              onPressed: (){},
              fillColor: Color.fromARGB(255, 239, 57, 57),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.public),
            )




        ],
      ),
    );
  }
}

