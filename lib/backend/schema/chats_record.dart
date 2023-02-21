import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  String? get cid;

  BuiltList<String>? get prompts;

  BuiltList<String>? get completions;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..cid = ''
    ..prompts = ListBuilder()
    ..completions = ListBuilder();

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
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..cid = cid
        ..prompts = null
        ..completions = null
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}
