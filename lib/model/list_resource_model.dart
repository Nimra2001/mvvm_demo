

class ListResourceModel {
  ListResourceModel({
      num? page, 
      num? perPage, 
      num? total, 
      num? totalPages, 
      List<Data>? data, 
      Support? support,}){
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
    _support = support;
}

  ListResourceModel.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }
  num? _page;
  num? _perPage;
  num? _total;
  num? _totalPages;
  List<Data>? _data;
  Support? _support;
ListResourceModel copyWith({  num? page,
  num? perPage,
  num? total,
  num? totalPages,
  List<Data>? data,
  Support? support,
}) => ListResourceModel(  page: page ?? _page,
  perPage: perPage ?? _perPage,
  total: total ?? _total,
  totalPages: totalPages ?? _totalPages,
  data: data ?? _data,
  support: support ?? _support,
);
  num? get page => _page;
  num? get perPage => _perPage;
  num? get total => _total;
  num? get totalPages => _totalPages;
  List<Data>? get data => _data;
  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }

}


class Support {
  Support({
      String? url, 
      String? text,}){
    _url = url;
    _text = text;
}

  Support.fromJson(dynamic json) {
    _url = json['url'];
    _text = json['text'];
  }
  String? _url;
  String? _text;
Support copyWith({  String? url,
  String? text,
}) => Support(  url: url ?? _url,
  text: text ?? _text,
);
  String? get url => _url;
  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }

}


class Data {
  Data({
      num? id, 
      String? name, 
      num? year, 
      String? color, 
      String? pantoneValue,}){
    _id = id;
    _name = name;
    _year = year;
    _color = color;
    _pantoneValue = pantoneValue;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _color = json['color'];
    _pantoneValue = json['pantone_value'];
  }
  num? _id;
  String? _name;
  num? _year;
  String? _color;
  String? _pantoneValue;
Data copyWith({  num? id,
  String? name,
  num? year,
  String? color,
  String? pantoneValue,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  year: year ?? _year,
  color: color ?? _color,
  pantoneValue: pantoneValue ?? _pantoneValue,
);
  num? get id => _id;
  String? get name => _name;
  num? get year => _year;
  String? get color => _color;
  String? get pantoneValue => _pantoneValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['color'] = _color;
    map['pantone_value'] = _pantoneValue;
    return map;
  }

}