import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'feature_request_record.g.dart';

abstract class FeatureRequestRecord
    implements Built<FeatureRequestRecord, FeatureRequestRecordBuilder> {
  static Serializer<FeatureRequestRecord> get serializer =>
      _$featureRequestRecordSerializer;

  String? get iWant;

  @BuiltValueField(wireName: 'Because')
  String? get because;

  @BuiltValueField(wireName: 'Additional')
  String? get additional;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FeatureRequestRecordBuilder builder) => builder
    ..iWant = ''
    ..because = ''
    ..additional = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('featureRequest');

  static Stream<FeatureRequestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FeatureRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FeatureRequestRecord._();
  factory FeatureRequestRecord(
          [void Function(FeatureRequestRecordBuilder) updates]) =
      _$FeatureRequestRecord;

  static FeatureRequestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFeatureRequestRecordData({
  String? iWant,
  String? because,
  String? additional,
}) {
  final firestoreData = serializers.toFirestore(
    FeatureRequestRecord.serializer,
    FeatureRequestRecord(
      (f) => f
        ..iWant = iWant
        ..because = because
        ..additional = additional,
    ),
  );

  return firestoreData;
}
