import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  String? get cid;

  DateTime? get timestamp;

  String? get message;

  @BuiltValueField(wireName: 'is_completion')
  bool? get isCompletion;

  @BuiltValueField(wireName: 'dataset_ids')
  BuiltList<String>? get datasetIds;

  BuiltList<String>? get chunks;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..cid = ''
    ..message = ''
    ..isCompletion = false
    ..datasetIds = ListBuilder()
    ..chunks = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chats')
          : FirebaseFirestore.instance.collectionGroup('chats');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('chats').doc();

  static Stream<ChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatsRecord._();
  factory ChatsRecord([void Function(ChatsRecordBuilder) updates]) =
      _$ChatsRecord;

  static ChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatsRecordData({
  String? cid,
  DateTime? timestamp,
  String? message,
  bool? isCompletion,
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..cid = cid
        ..timestamp = timestamp
        ..message = message
        ..isCompletion = isCompletion
        ..datasetIds = null
        ..chunks = null,
    ),
  );

  return firestoreData;
}
