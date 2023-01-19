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
    String? datasetName = '',
    String? datasetId = '',
    List<String>? activeDocsList,
    int? topK,
  }) {
    final activeDocs = _serializeList(activeDocsList);

    final body = '''
{
  "qid": "${qid}",
  "dataset_name": "${datasetName}",
  "dataset_id": "${datasetId}",
  "top_k": ${topK}
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
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GPT',
      apiUrl: '${PromptsGroup.baseUrl}/gpt3',
      callType: ApiCallType.POST,
      headers: {
        ...PromptsGroup.headers,
      },
      params: {},
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
