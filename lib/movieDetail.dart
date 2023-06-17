import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:novo_projeto_02_06/api.dart';

class MovieDeatil extends StatefulWidget {
  String imdbID;
  String nmFilm;
  String img;
  MovieDeatil({super.key, required this.imdbID, required this.nmFilm, required this.img});

  @override
  State<MovieDeatil> createState() => _MovieDeatilState();
}

class _MovieDeatilState extends State<MovieDeatil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nmFilm),
        ),
        backgroundColor: Colors.grey,
        body: FutureBuilder(
            future: getMovie(widget.imdbID),
            builder: (context, AsyncSnapshot snapshot) {
              //Condicional para verificar o status da chamada da API para não gerar erro
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(snapshot.data['Plot'])],
                        ),
                        height: MediaQuery.of(context).size.height * 0.80,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: MediaQuery.of(context).size.width * 0.3,
                      child: Hero(
                        tag: widget.imdbID,
                        child: Image.network(
                        widget.img,
                        /*widget.img == "N/A" ? 
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8z7PqCKz5e_3I9_Kakkdw0hUnJ0L5wU3pWw&usqp=CAU' : widget.img,
                         */ width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
