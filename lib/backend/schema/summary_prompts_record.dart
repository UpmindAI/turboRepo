import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'summary_prompts_record.g.dart';

abstract class SummaryPromptsRecord
    implements Built<SummaryPromptsRecord, SummaryPromptsRecordBuilder> {
  static Serializer<SummaryPromptsRecord> get serializer =>
      _$summaryPromptsRecordSerializer;

  @BuiltValueField(wireName: 'summary_prompt')
  String? get summaryPrompt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SummaryPromptsRecordBuilder builder) =>
      builder..summaryPrompt = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('summary_prompts')
          : FirebaseFirestore.instance.collectionGroup('summary_prompts');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('summary_prompts').doc();

  static Stream<SummaryPromptsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SummaryPromptsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SummaryPromptsRecord._();
  factory SummaryPromptsRecord(
          [void Function(SummaryPromptsRecordBuilder) updates]) =
      _$SummaryPromptsRecord;

  static SummaryPromptsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSummaryPromptsRecordData({
  String? summaryPrompt,
}) {
  final firestoreData = serializers.toFirestore(
    SummaryPromptsRecord.serializer,
    SummaryPromptsRecord(
      (s) => s..summaryPrompt = summaryPrompt,
    ),
  );

  return firestoreData;
}
