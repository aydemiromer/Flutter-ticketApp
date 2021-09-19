import 'package:flutter/material.dart';
import 'package:ticketapp/core/constants/color/color_theme.dart';
import 'package:ticketapp/core/constants/text/text_constants.dart';
import 'package:provider/provider.dart';
import 'package:ticketapp/core/style/text_styles.dart';
import 'package:ticketapp/view/authenticate/provider/view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailPage extends StatefulWidget {
  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TicketDetailListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<TicketDetailListViewModel>(context);

    return Scaffold(
      appBar: _appbar,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 400,
            child: buildListViewTicket(listViewModel),
          ),
        ],
      ),
    );
  }
}

Widget get _appbar => AppBar(
      backgroundColor: AppColor.primaryorange,
      leading: Icon(Icons.directions_bus),
      title: Center(child: Text(AppTextConstants.titlesecondpage)),
      actions: [
        Icon(
          Icons.directions_bike,
          color: Colors.transparent,
        )
      ],
    );

ListView buildListViewTicket(TicketDetailListViewModel listViewModel) {
  return ListView.builder(
      itemCount: listViewModel.dataitems.length,
      itemBuilder: (context, index) {
        var data = listViewModel.dataitems[index];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter * 20,
                    end: Alignment.bottomRight % 4,
                    colors: [Color(0xFFFE5301), Colors.white])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  rowTop(data),
                  SizedBox(
                    height: 20,
                  ),
                  row2(data),
                  SizedBox(
                    height: 20,
                  ),
                  row3(data),
                  SizedBox(
                    height: 20,
                  ),
                  row4(data),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ticket Number",
                            style: TextStyle(color: AppColor.greytextColor),
                          ),
                          Text(data.ticketno),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Booking Number",
                            style: TextStyle(color: AppColor.greytextColor),
                          ),
                          Text(data.booking)
                        ],
                      ),
                      Column(
                        children: [
                          QrImage(
                            data: data.qr,
                            version: QrVersions.auto,
                            size: 100,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Row row4(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tour Number",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(data.tour),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Date",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(data.date)
        ],
      )
    ],
  );
}

Row row3(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Passenger",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.name,
            style: AppTextStyles.ticketStyle,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Seat",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Wrap(children: [Text(data.seat)]),
        ],
      )
    ],
  );
}

Row row2(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${data.titleleft}       ----->---",
              style: TextStyle(color: AppColor.primaryorange, fontSize: 24)),
          Text(data.bus),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            data.titleright,
            style: TextStyle(color: AppColor.primaryorange, fontSize: 24),
          ),
          Text(data.bus2),
        ],
      )
    ],
  );
}

Row rowTop(TicketDetailViewModel data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departure Time",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.time,
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Arrival time",
            style: TextStyle(color: AppColor.greytextColor),
          ),
          Text(
            data.time2,
          ),
        ],
      )
    ],
  );
}
