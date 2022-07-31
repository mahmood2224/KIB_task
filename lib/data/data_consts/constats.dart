import 'package:flutter/cupertino.dart';

const Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};

const String BASE_URL = "http://task.devest.co";

const String ADD = "$BASE_URL/api/features/add";
const String EDIT = "$BASE_URL/api/features/edit";
const String DELETE = "$BASE_URL/api/features/delete";
const String GET = "$BASE_URL/api/features/get";

bool isValidResponse(int statusCode, int responseStatus) {
  return statusCode >= 200 && statusCode <= 302 && responseStatus == 1;
}

void debugApi(
    {String fileName = "ApiProvider.dart",
    required String methodName,
    required int statusCode,
    required response,
    required data,
    required endPoint,
    headers}) {
  debugPrint(
    "FileName: $fileName\n"
    "Method: $methodName\n"
    "${endPoint != null ? 'URL: $endPoint\n' : ''}"
    "${data != null ? 'data: $data\n' : ''}"
    "${headers != null ? "Headerss :$headers\n" : ""}"
    "statusCode: $statusCode\n"
    "${response != null ? 'Response: $response\n' : ''}"
    "--------------------",
    wrapWidth: 512,
  );
}
