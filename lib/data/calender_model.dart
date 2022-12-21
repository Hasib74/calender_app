/// calender : [{"month":"jan","year":"2022","data":[{"day":"fri","date":"1","event":"Birthday","isWeekend":"true","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"sat","date":"2","isWeekend":"true"},{"day":"sun","date":"3"},{"day":"mon","date":"4"},{"day":"tue","date":"5"},{"day":"wed","date":"6"},{"day":"thu","date":"7"},{"day":"fri","date":"8","isWeekend":"true"},{"day":"sat","date":"9","isWeekend":"true"},{"day":"sun","date":"10"},{"day":"mon","date":"11"},{"day":"tue","date":"12"},{"day":"wed","date":"13"},{"day":"thu","date":"14"},{"day":"fri","date":"15","isWeekend":"true"},{"day":"sat","date":"16","isWeekend":"true"},{"day":"sun","date":"17"},{"day":"mon","date":"18"},{"day":"tue","date":"19"},{"day":"wed","date":"20"},{"day":"thu","date":"21"},{"day":"fri","date":"22","isWeekend":"true"},{"day":"sat","date":"23","isWeekend":"true"},{"day":"sun","date":"24"},{"day":"mon","date":"25"},{"day":"tue","date":"26"},{"day":"wed","date":"27","event":"Mother Day","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"thu","date":"28"},{"day":"fri","date":"29","isWeekend":"true"},{"day":"sat","date":"30","isWeekend":"true"},{"day":"sun","event":"New Year","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"}]},{"month":"fab","year":"2022","data":[{"day":"fri","date":"1","event":"Birthday","isWeekend":"true","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"sat","date":"2","isWeekend":"true"},{"day":"sun","date":"3"},{"day":"mon","date":"4"},{"day":"tue","date":"5"},{"day":"wed","date":"6"},{"day":"thu","date":"7"},{"day":"fri","date":"8","isWeekend":"true"},{"day":"sat","date":"9","isWeekend":"true"},{"day":"sun","date":"10"},{"day":"mon","date":"11"},{"day":"tue","date":"12"},{"day":"wed","date":"13"},{"day":"thu","date":"14"},{"day":"fri","date":"15","isWeekend":"true"},{"day":"sat","date":"16","isWeekend":"true"},{"day":"sun","date":"17"},{"day":"mon","date":"18"},{"day":"tue","date":"19"},{"day":"wed","date":"20"},{"day":"thu","date":"21"},{"day":"fri","date":"22","isWeekend":"true"},{"day":"sat","date":"23","isWeekend":"true"},{"day":"sun","date":"24"},{"day":"mon","date":"25"},{"day":"tue","date":"26"},{"day":"wed","date":"27","event":"Mother Day","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"thu","date":"28"},{"day":"fri","date":"29","isWeekend":"true"},{"day":"sat","date":"30","isWeekend":"true"},{"day":"sun","event":"New Year","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"}]}]

class CalenderModel {
  CalenderModel({
    List<Calender>? calender,
  }) {
    _calender = calender;
  }

  CalenderModel.fromJson(dynamic json) {
    if (json['calender'] != null) {
      _calender = [];
      json['calender'].forEach((v) {
        _calender?.add(Calender.fromJson(v));
      });
    }
  }

  List<Calender>? _calender;

  CalenderModel copyWith({
    List<Calender>? calender,
  }) =>
      CalenderModel(
        calender: calender ?? _calender,
      );

  List<Calender>? get calender => _calender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_calender != null) {
      map['calender'] = _calender?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// month : "jan"
/// year : "2022"
/// data : [{"day":"fri","date":"1","event":"Birthday","isWeekend":"true","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"sat","date":"2","isWeekend":"true"},{"day":"sun","date":"3"},{"day":"mon","date":"4"},{"day":"tue","date":"5"},{"day":"wed","date":"6"},{"day":"thu","date":"7"},{"day":"fri","date":"8","isWeekend":"true"},{"day":"sat","date":"9","isWeekend":"true"},{"day":"sun","date":"10"},{"day":"mon","date":"11"},{"day":"tue","date":"12"},{"day":"wed","date":"13"},{"day":"thu","date":"14"},{"day":"fri","date":"15","isWeekend":"true"},{"day":"sat","date":"16","isWeekend":"true"},{"day":"sun","date":"17"},{"day":"mon","date":"18"},{"day":"tue","date":"19"},{"day":"wed","date":"20"},{"day":"thu","date":"21"},{"day":"fri","date":"22","isWeekend":"true"},{"day":"sat","date":"23","isWeekend":"true"},{"day":"sun","date":"24"},{"day":"mon","date":"25"},{"day":"tue","date":"26"},{"day":"wed","date":"27","event":"Mother Day","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"},{"day":"thu","date":"28"},{"day":"fri","date":"29","isWeekend":"true"},{"day":"sat","date":"30","isWeekend":"true"},{"day":"sun","event":"New Year","eventDescription":"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).","eventImage":"https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"}]

class Calender {
  Calender({
    String? month,
    String? year,
    List<Data>? data,
  }) {
    _month = month;
    _year = year;
    _data = data;
  }

  Calender.fromJson(dynamic json) {
    _month = json['month'];
    _year = json['year'];
    _seasonalImage = json['seasonal_image'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  String? _month;
  String? _year;
  String? _seasonalImage;
  List<Data>? _data;

  Calender copyWith({
    String? month,
    String? year,
    List<Data>? data,
  }) =>
      Calender(
        month: month ?? _month,
        year: year ?? _year,
        data: data ?? _data,
      );

  String? get month => _month;

  String? get year => _year;

  String? get seasonalImage => _seasonalImage;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = _month;
    map['year'] = _year;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// day : "fri"
/// date : "1"
/// event : "Birthday"
/// isWeekend : "true"
/// eventDescription : "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
/// eventImage : "https://nameoncakes.com/names/images/happy-birthday-rifat_c125f13c7c.jpg"

class Data {
  Data({
    String? day,
    String? date,
    String? event,
    String? isWeekend,
    String? eventDescription,
    String? eventImage,
    String? music,
  }) {
    _day = day;
    _date = date;
    _event = event;
    _isWeekend = isWeekend;
    _eventDescription = eventDescription;
    _eventImage = eventImage;
    _music = music;
  }

  Data.fromJson(dynamic json) {
    _day = json['day'];
    _date = json['date'];
    _event = json['event'];
    _isWeekend = json['isWeekend'];
    _eventDescription = json['eventDescription'];
    _eventImage = json['eventImage'];
    _music = json['music'];
  }

  String? _day;
  String? _date;
  String? _event;
  String? _isWeekend;
  String? _eventDescription;
  String? _eventImage;

  String? _music;

  Data copyWith({
    String? day,
    String? date,
    String? event,
    String? isWeekend,
    String? eventDescription,
    String? eventImage,
  }) =>
      Data(
        day: day ?? _day,
        date: date ?? _date,
        event: event ?? _event,
        isWeekend: isWeekend ?? _isWeekend,
        eventDescription: eventDescription ?? _eventDescription,
        eventImage: eventImage ?? _eventImage,
      );

  String? get day => _day;

  String? get date => _date;

  String? get event => _event;

  String? get isWeekend => _isWeekend;

  String? get eventDescription => _eventDescription;

  String? get eventImage => _eventImage;

  String? get music => _music;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['date'] = _date;
    map['event'] = _event;
    map['isWeekend'] = _isWeekend;
    map['eventDescription'] = _eventDescription;
    map['eventImage'] = _eventImage;
    return map;
  }
}
