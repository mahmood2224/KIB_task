import 'dart:convert';


class ItemSendModel{
  String? name ;
  String? desc ;
  int? id ;


  ItemSendModel({this.name, this.desc, this.id});

  Validation validate(){
    Validation validation = Validation(isValid: true);
    if((name??"").isEmpty) {
      validation.isValid = false;
      validation.message = "Please add name";
      return validation;
    }
    if((desc??"").isEmpty) {
      validation.isValid = false;
      validation.message = "Please add desc";
      return validation;
    }

    return validation;
  }

  toMap(){
    Map<String?,String?> data =  Map();
    data['name'] = name;
    data['desc'] = desc;
    return data ;
  }

  toJson(){
    return jsonEncode(toMap());
  }
}


class Validation{
  String? message ;
  bool? isValid ;

  Validation({this.message, this.isValid});
}

/// id : 2
/// name : "test"
/// desc : "test test test"
/// date : "07/31/2022 02:22 am"

class ItemModel {
  ItemModel({
    this.id,
    this.name,
    this.desc,
    this.date,});

  ItemModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    date = json['date'];
  }
  int? id;
  String? name;
  String? desc;
  String? date;
  ItemModel copyWith({  required int id,
    required String name,
    required String desc,
    required String date,
  }) => ItemModel(  id: id ,
    name: name ,
    desc: desc ,
    date: date ,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['desc'] = desc;
    map['date'] = date;
    return map;
  }

}