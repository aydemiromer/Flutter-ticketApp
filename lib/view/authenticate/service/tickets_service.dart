import 'package:dio/dio.dart';
import 'package:ticketapp/product/model/ticket_detail.dart';

class TicketDetailService {
  var dio = Dio();

  Future<List<Data>> fetchTopHeadlines() async {
    // Since the api is not in the list structure,
    //I could not return it,
    //so I returned it to the list structure myself and tried such a way.
    String url = "https://apitest-70a9a-default-rtdb.firebaseio.com/.json";
    //

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((data) => Data.fromJson(data)).toList();

      //return Item.fromJson(jsonDecode(response.data));
    } else {
      throw Exception("failed get!");
    }
  }
}
