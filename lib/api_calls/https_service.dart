import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:radar_soft_assignment/models/events.dart';
//import 'post_model.dart';

class HttpService {

  Future<List<Events>?> getEventsList() async {
    var httpsUri = Uri(
      scheme: 'https',
      host: 'organizergathrr.radarsofttech.in',
      path: '/api/getallevent',
      queryParameters: {'userId': '1'}
    );
    print('URL: $httpsUri');
    Response res = await https.post(httpsUri);
    List<Events> result = [];
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      for(int i = 0;i<body['allevents'].length;i++){
        result.add(Events.fromJson(body['allevents'][i]));
      }

      return result;

    } else {
      throw "Unable to retrieve posts.";
    }
  }



}