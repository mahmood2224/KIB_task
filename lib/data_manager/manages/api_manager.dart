import 'package:http/http.dart' as http;
import 'package:kib_task/data/data_consts/constats.dart';
import 'package:kib_task/data/models/ItemResponse.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/general_response.dart';
import 'package:kib_task/data/models/item_model.dart';
import 'dart:convert';

class ApiManager {
  static void get(
      {required Function(List<ItemModel>? items) onSuccess,
      required Function(String? error) onError}) async {
    String lang = "en";
    Map<String, String>? headers = {"lang": lang, ...apiHeaders};
    http.Response response = await http.get(Uri.parse(GET), headers: headers);
    Map<String, dynamic> decoded;
    decoded = json.decode(response.body);
    ItemResponse decodedResponse = ItemResponse.fromJson(decoded);
    if (isValidResponse(response.statusCode, decodedResponse.status ?? 0)) {
      onSuccess(decodedResponse.data);
    } else {
      onError(decodedResponse.message);
    }
    debugApi(
        methodName: "get",
        statusCode: response.statusCode,
        response: response.body,
        data: null,
        endPoint: response.request?.url,
        headers: headers);
  }

  static void add(ItemSendModel body,
      {required Function() onSuccess,
      required Function(String? error) onError}) async {
    String lang = "en";
    Map<String, String>? headers = {"lang": lang, ...apiHeaders};
    var data = body.toJson();
    http.Response response =
        await http.post(Uri.parse(ADD), headers: headers, body: data);
    Map<String, dynamic> decoded;
    decoded = json.decode(response.body);
    GeneralResponse decodedResponse = GeneralResponse.fromJson(decoded);
    if (isValidResponse(response.statusCode, decodedResponse.status ?? 0)) {
      onSuccess();
    } else {
      onError(decodedResponse.message);
    }

    debugApi(
        methodName: "add",
        statusCode: response.statusCode,
        response: response.body,
        data: data,
        endPoint: response.request?.url,
        headers: headers);
  }

  static void edit(ItemSendModel body,
      {required Function() onSuccess,
      required Function(String? error) onError}) async {
    String lang = "en";
    Map<String, String>? headers = {"lang": lang, ...apiHeaders};
    var data = body.toJson();
    http.Response response = await http.post(Uri.parse("$EDIT/${body.id}"),
        headers: headers, body: data);
    Map<String, dynamic> decoded;
    decoded = json.decode(response.body);
    GeneralResponse decodedResponse = GeneralResponse.fromJson(decoded);
    if (isValidResponse(response.statusCode, decodedResponse.status ?? 0)) {
      onSuccess();
    } else {
      onError(decodedResponse.message);
    }

    debugApi(
        methodName: "add",
        statusCode: response.statusCode,
        response: response.body,
        data: data,
        endPoint: response.request?.url,
        headers: headers);
  }

  static void delete(int id,
      {required Function() onSuccess,
      required Function(String? error) onError}) async {
    String lang = "en";
    Map<String, String>? headers = {"lang": lang, ...apiHeaders};
    http.Response response =
        await http.post(Uri.parse("$DELETE/$id"), headers: headers);
    Map<String, dynamic> decoded;
    decoded = json.decode(response.body);
    GeneralResponse decodedResponse = GeneralResponse.fromJson(decoded);
    if (isValidResponse(response.statusCode, decodedResponse.status ?? 0)) {
      onSuccess();
    } else {
      onError(decodedResponse.message);
    }

    debugApi(
        methodName: "add",
        statusCode: response.statusCode,
        response: response.body,
        data: id,
        endPoint: response.request?.url,
        headers: headers);
  }
}
