class Data {
  String passengerName;
  String seatNu;
  String departureCity;
  String departureBusStop;
  String departureTime;
  String arrivalCity;
  String arrivalBusStop;
  String arrivalTime;
  String tourNumber;
  String date;
  String ticketNumber;
  String bookingNumber;
  String qrCode;

  Data(
      {this.passengerName,
      this.seatNu,
      this.departureCity,
      this.departureBusStop,
      this.departureTime,
      this.arrivalCity,
      this.arrivalBusStop,
      this.arrivalTime,
      this.tourNumber,
      this.date,
      this.ticketNumber,
      this.bookingNumber,
      this.qrCode});

  Data.fromJson(Map<String, dynamic> json) {
    passengerName = json['passengerName'];
    seatNu = json['seatNu'];
    departureCity = json['departureCity'];
    departureBusStop = json['departureBusStop'];
    departureTime = json['departureTime'];
    arrivalCity = json['arrivalCity'];
    arrivalBusStop = json['arrivalBusStop'];
    arrivalTime = json['arrivalTime'];
    tourNumber = json['tourNumber'];
    date = json['date'];
    ticketNumber = json['ticketNumber'];
    bookingNumber = json['bookingNumber'];
    qrCode = json['qrCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passengerName'] = this.passengerName;
    data['seatNu'] = this.seatNu;
    data['departureCity'] = this.departureCity;
    data['departureBusStop'] = this.departureBusStop;
    data['departureTime'] = this.departureTime;
    data['arrivalCity'] = this.arrivalCity;
    data['arrivalBusStop'] = this.arrivalBusStop;
    data['arrivalTime'] = this.arrivalTime;
    data['tourNumber'] = this.tourNumber;
    data['date'] = this.date;
    data['ticketNumber'] = this.ticketNumber;
    data['bookingNumber'] = this.bookingNumber;
    data['qrCode'] = this.qrCode;
    return data;
  }
}
