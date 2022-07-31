import 'package:kib_task/data/models/item_model.dart';

import 'package:kib_task/data/models/item_model.dart';

import 'package:kib_task/data/models/item_model.dart';

/// status : 1
/// message : "Operation Success"
/// data : [{"id":2,"name":"test","desc":"test test test","date":"07/31/2022 02:22 am"}]

class GeneralResponse {
  GeneralResponse({
    this.status,
    this.message,
  });

  GeneralResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  int? status;
  String? message;
  GeneralResponse copyWith({
    required int status,
    required String message,
  }) =>
      GeneralResponse(
        status: status ,
        message: message ,
      );
}
