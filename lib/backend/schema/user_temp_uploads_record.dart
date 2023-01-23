import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_temp_uploads_record.g.dart';

abstract class UserTempUploadsRecord
    implements Built<UserTempUploadsRecord, UserTempUploadsRecordBuilder> {
  static Serializer<UserTempUploadsRecord> get serializer =>
      _$userTempUploadsRecordSerializer;

  @BuiltValueField(wireName: 'doc_title')
  String? get docTitle;

  @BuiltValueField(wireName: 'doc_id')
  String? get docId;

  @BuiltValueField(wireName: 'dataset_name')
  String? get datasetName;

  @BuiltValueField(wireName: 'dataset_id')
  String? get datasetId;

  @BuiltValueField(wireName: 'chunk_size')
  int? get chunkSize;

  DateTime? get timestamp;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserTempUploadsRecordBuilder builder) =>
      builder
        ..docTitle = ''
        ..docId = ''
        ..datasetName = ''
        ..datasetId = ''
        ..chunkSize = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_temp_uploads')
          : FirebaseFirestore.instance.collectionGroup('user_temp_uploads');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_temp_uploads').doc();

  static Stream<UserTempUploadsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserTempUploadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserTempUploadsRecord._();
  factory UserTempUploadsRecord(
          [void Function(UserTempUploadsRecordBuilder) updates]) =
      _$UserTempUploadsRecord;

  static UserTempUploadsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserTempUploadsRecordData({
  String? docTitle,
  String? docId,
  String? datasetName,
  String? datasetId,
  int? chunkSize,
  DateTime? timestamp,
}) {
  final firestoreData = serializers.toFirestore(
    UserTempUploadsRecord.serializer,
    UserTempUploadsRecord(
      (u) => u
        ..docTitle = docTitle
        ..docId = docId
        ..datasetName = datasetName
        ..datasetId = datasetId
        ..chunkSize = chunkSize
        ..timestamp = timestamp,
    ),
  );

  return firestoreData;
}