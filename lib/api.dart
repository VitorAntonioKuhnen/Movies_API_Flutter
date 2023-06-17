import 'dart:convert';

import 'package:http/http.dart' as http;
getMovies() async {
  var url = Uri.parse('https://www.omdbapi.com/?s=Guardians%20of%20the%20Galaxy%20Vol.%202&apikey=45d9ed8a');

  var response = await http.get(url);

  var data = await jsonDecode(response.body);

  return data;
}


getMovie(imdbID) async {
  var url = Uri.parse('https://www.omdbapi.com/?i='+imdbID+'&apikey=45d9ed8a');

  var response = await http.get(url);

  var data = await jsonDecode(response.body);

  return data;
}