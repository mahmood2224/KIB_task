import 'package:kib_task/data/models/item_model.dart';

import 'package:kib_task/data/models/item_model.dart';

import 'package:kib_task/data/models/item_model.dart';

/// status : 1
/// message : "Operation Success"
/// data : [{"id":2,"name":"test","desc":"test test test","date":"07/31/2022 02:22 am"}]

class ItemResponse {
  ItemResponse({
    this.status,
    this.message,
    this.data,
  });

  ItemResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ItemModel.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<ItemModel>? data;
  ItemResponse copyWith({
    required int status,
    required String message,
    required List<ItemModel> data,
  }) =>
      ItemResponse(
        status: status ,
        message: message ,
        data: data ,
      );
}
