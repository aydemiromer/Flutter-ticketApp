import 'package:dio/dio.dart';
import 'package:ticketapp/product/model/tickets_model.dart';

class TicketsService {
  var dio = Dio();

  Future<List<Data>> fetchAll() async {
    String url =
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception("failed get !");
    }
  }
}
