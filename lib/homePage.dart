import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:novo_projeto_02_06/api.dart';
import 'package:novo_projeto_02_06/movieDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getMovies(),
            builder: (context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemCount: snapshot.data['Search'].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(snapshot.data['Search'][index]['imdbID']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MovieDeatil(
                                    imdbID: snapshot.data['Search'][index]
                                        ['imdbID'],
                                    nmFilm: snapshot.data['Search'][index]
                                        ['Title'],
                                    img: snapshot.data['Search'][index]
                                        ['Poster'],
                                  )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      // color:  Colors.blueGrey.shade300,
                      child: Card(
                        color: Colors.blueGrey.shade300,
                        elevation: 10,
                        child: Stack(children: [
                          Hero(
                            tag: snapshot.data['Search'][index]['imdbID'],
                            child: Image.network(
                              snapshot.data['Search'][index]['Poster'] == "N/A"
                                  ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8z7PqCKz5e_3I9_Kakkdw0hUnJ0L5wU3pWw&usqp=CAU'
                                  : snapshot.data['Search'][index]['Poster'],
                              width: 150,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                  snapshot.data['Search'][index]['Title'])),
                          Positioned(
                              top: 50,
                              left: MediaQuery.of(context).size.width * 0.35,
                              child: Text('Movie'))
                        ]),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}





//  Container(
//         padding: EdgeInsets.all(2),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 200,
//               // color:  Colors.blueGrey.shade300,
//               child: Card(
//                 color: Colors.blueGrey.shade300,
//                 elevation: 10,
//                 child: Stack(children: [
//                   Image.network('https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg'),
//                   Positioned(
//                     top: 10,
//                     left: MediaQuery.of(context).size.width * 0.5,
//                     child: Text('Guardians of the Galaxy Vol. 2')
//                     ),
//                   Positioned(
//                     top: 50,
//                     left: MediaQuery.of(context).size.width * 0.3,
//                     child: Text('Movie')
//                     )
//                 ]),
//               ),
//             )
//           ],
//         ),
//       ),