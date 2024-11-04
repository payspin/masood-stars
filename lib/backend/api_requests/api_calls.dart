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
  static ConvertHtmlToPdfCall convertHtmlToPdfCall = ConvertHtmlToPdfCall();
  static SendCancelationEmailCall sendCancelationEmailCall =
      SendCancelationEmailCall();
}

class SendAnEmailCall {
  Future<ApiCallResponse> call({
    String? senderName = 'Masaood Stars Awards',
    String? subject = 'Here is your ticket to the ceremony',
    String? message =
        'Thank you for signing up to attend our upcoming Masaood Stars Ceremony & Union Day Celebration. The event is taking place on Sunday 10 November 2024 at ADNEC, Hall 11. Use Parking B. Doors open at 2:15pm and the show starts at 3:00pm sharp until 8:00pm. Food will be served at 5:00pm. This event is for Al Masaood Employees ONLY. Family & friends  will not be permitted. Please show your QR code at the door.',
    String? email = '',
    String? userName = '',
  }) async {
    final baseUrl = SendEmailAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "senderName": "$senderName",
  "subject": "$subject",
  "message": "$message",
  "email": "$email",
  "userName": "$userName"
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

class ConvertHtmlToPdfCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? userName = '',
    String? message = '',
  }) async {
    final baseUrl = SendEmailAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "userName": "$userName",
  "message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'convertHtmlToPdf',
      apiUrl: '$baseUrl/convertHtmlToPdf',
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

class SendCancelationEmailCall {
  Future<ApiCallResponse> call({
    String? senderName = 'Masaood Stars Awards',
    String? subject = 'Masaood Stars Awards Ticket Cancellation Confirmed',
    String? message =
        'Your ticket has been cancelled, you can no longer attend the event. In case you change your mind, please re-book a seat.',
    String? email = '',
  }) async {
    final baseUrl = SendEmailAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "senderName": "$senderName",
  "subject": "$subject",
  "message": "$message",
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendCancelationEmail',
      apiUrl: '$baseUrl/sendCancelationEmail',
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
