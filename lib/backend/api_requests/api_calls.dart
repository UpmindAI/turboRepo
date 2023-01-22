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
  static PineconeCall pineconeCall = PineconeCall();
  static GptCall gptCall = GptCall();
}

class PineconeCall {
  Future<ApiCallResponse> call({
    String? qid = '',
    List<String>? datasetIdsList,
    double? topK,
    String? idToken = '',
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "qid": "${qid}",
  "dataset_ids": "${datasetIds}",
  "top_k": ${topK},
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pinecone',
      apiUrl: '${PromptsGroup.baseUrl}/pinecone',
      callType: ApiCallType.POST,
      headers: {
        ...PromptsGroup.headers,
      },
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

class GptCall {
  Future<ApiCallResponse> call({
    String? qid = '',
    List<String>? datasetIdsList,
    String? idToken = '',
  }) {
    final datasetIds = _serializeList(datasetIdsList);

    final body = '''
{
  "qid": "${qid}",
  "dataset_ids": "${datasetIds}",
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GPT',
      apiUrl: '${PromptsGroup.baseUrl}/gpt3',
      callType: ApiCallType.POST,
      headers: {
        ...PromptsGroup.headers,
      },
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

/// End Prompts Group Code

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
