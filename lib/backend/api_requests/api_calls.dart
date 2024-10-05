import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Send Email API Group Code

class SendEmailAPIGroup {
  static String getBaseUrl() =>
      'https://us-central1-oozf-aaff4.cloudfunctions.net';
  static Map<String, String> headers = {};
  static SendAnEmailCall sendAnEmailCall = SendAnEmailCall();
}

class SendAnEmailCall {
  Future<ApiCallResponse> call({
    String? senderName = '',
    String? subject = '',
    String? message = '',
    String? email = '',
    String? imageUrl = '',
  }) async {
    final baseUrl = SendEmailAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "senderName": "$senderName",
  "subject": "$subject",
  "message": "$message",
  "email": "$email",
  "imageUrl": "$imageUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send an email',
      apiUrl: '$baseUrl/sendEmails',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Send Email API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
