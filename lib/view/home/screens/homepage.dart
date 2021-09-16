import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/color/color_theme.dart';
import '../../../core/constants/text/text_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/style/text_styles.dart';
import '../../../product/model/tickets_model.dart';
import '../../../product/widget/bottom_navigation.dart';
import '../../../product/widget/box_image.dart';

class TicketHomePage extends StatefulWidget {
  @override
  _TicketHomePageState createState() => _TicketHomePageState();
}

class _TicketHomePageState extends State<TicketHomePage> {
  List<Data> _ticket = List<Data>();

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final ticket = await fetchAll();
    setState(() {
      _ticket = ticket;
    });
  }

  Future<void> _refresh() {
    return Future.delayed(
      Duration(seconds: 2),
    );
  }

  Future<List<Data>> fetchAll() async {
    String url =
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/departureTimes";

    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception("failed get !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationTool(),
      appBar: appbar,
      body: Padding(
        padding: context.paddingAllPage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingImage,
              child: StackImage(),
            ),
            Text(AppTextConstants.homepagetime, style: AppTextStyles.titeStyle),
            SizedBox(
              height: 12,
            ),
            Container(
              height: context.highValue * 5,
              width: context.width,
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  itemCount: _ticket.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            _ticket[index].tourType == 'Night'
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: AppColor.primaryorange,
                          ),
                          title: Text(
                              " ${_ticket[index].route} /  ${_ticket[index].arrivalTime}-${_ticket[index].departureTime} "),
                          subtitle: Text(
                              "${_ticket[index].daysOfWeek[0]} - ${_ticket[index].daysOfWeek[1]} - ${_ticket[index].daysOfWeek[2]} - ${_ticket[index].daysOfWeek[3]}"),
                        ),
                        Divider(
                          height: 10,
                          indent: 16,
                          endIndent: 16,
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget get appbar => AppBar(
      backgroundColor: AppColor.primaryorange,
      leading: Icon(Icons.directions_bus),
      title: Center(child: Text(AppTextConstants.title)),
      actions: [
        Icon(
          Icons.directions_bike,
          color: Colors.transparent,
        )
      ],
    );
