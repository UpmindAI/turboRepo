import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Prompts Group Code

class PromptsGroup {
  static String baseUrl = 'https://turboqueries-p67td2b2aq-uc.a.run.app';
  static Map<String, String> headers = {};
}

/// End Prompts Group Code

class GPTqueryCall {
  static Future<ApiCallResponse> call({
    String? qid = '',
    String? idToken = '',
  }) {
    final body = '''
{
  "qid": "${qid}",
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GPTquery',
      apiUrl: 'https://turbogpt3query-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PineconeQueryCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    String? qid = '',
    List<String>? datasetIdsList,
    double? topK,
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "qid": "${qid}",
  "dataset_ids": ${datasetIds},
  "top_k": ${topK},
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PineconeQuery',
      apiUrl: 'https://turbopineconequery-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ScrapeServerCall {
  static Future<ApiCallResponse> call({
    String? sourceUrl = '',
    String? idToken = '',
    String? datasetId = '',
    String? datasetName = '',
    String? urlId = '',
  }) {
    final body = '''
{
  "dataset_id": "${datasetId}",
  "id_token": "${idToken}",
  "url_id": "${urlId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'scrapeServer',
      apiUrl: 'https://dvscrapeserver-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DatasetGPTserverCall {
  static Future<ApiCallResponse> call({
    String? qid = '',
    List<String>? datasetIdsList,
    double? topK,
    String? idToken = '',
    bool? guardrail = false,
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "qid": "${qid}",
  "dataset_ids": ${datasetIds},
  "top_k": ${topK},
  "id_token": "${idToken}",
  "guardail": ${guardrail}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'datasetGPTserver',
      apiUrl: 'https://turbomixedquery-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DownloadServerCall {
  static Future<ApiCallResponse> call({
    String? qid = '',
    String? idToken = '',
  }) {
    final body = '''
{
  "qid": "${qid}",
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'downloadServer',
      apiUrl: 'https://dvdownloads-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MultiUploadserverCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
  }) {
    final body = '''
{
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'multiUploadserver',
      apiUrl: 'https://dvmultipleuploads-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RecursiveSummarizerCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    List<String>? datasetIdsList,
    String? qid = '',
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "id_token": "${idToken}",
  "dataset_ids": ${datasetIds},
  "qid": "${qid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'recursiveSummarizer',
      apiUrl: 'https://recursivesummarizer-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ChatServerCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    String? qid = '',
    String? cid = '',
    List<String>? datasetIdsList,
    double? topK,
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "id_token": "${idToken}",
  "qid": "${qid}",
  "cid": "${cid}",
  "dataset_ids": ${datasetIds},
  "top_k": ${topK}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chatServer',
      apiUrl: 'https://mixed-chat-omp-p67td2b2aq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestAPICall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
  }) {
    final body = '''
{
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'testAPI',
      apiUrl: 'https://testapis-p67td2b2aq-uw.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
