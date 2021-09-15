class Data {
  String route;
  String departureTime;
  String arrivalTime;
  String tourType;
  List<String> daysOfWeek;

  Data(
      {this.route,
      this.departureTime,
      this.arrivalTime,
      this.tourType,
      this.daysOfWeek});

  Data.fromJson(Map<String, dynamic> json) {
    route = json['route'];
    departureTime = json['departureTime'];
    arrivalTime = json['arrivalTime'];
    tourType = json['tourType'];
    daysOfWeek = json['daysOfWeek'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['route'] = this.route;
    data['departureTime'] = this.departureTime;
    data['arrivalTime'] = this.arrivalTime;
    data['tourType'] = this.tourType;
    data['daysOfWeek'] = this.daysOfWeek;
    return data;
  }
}