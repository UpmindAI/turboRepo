import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_docs_record.g.dart';

abstract class UserDocsRecord
    implements Built<UserDocsRecord, UserDocsRecordBuilder> {
  static Serializer<UserDocsRecord> get serializer =>
      _$userDocsRecordSerializer;

  @BuiltValueField(wireName: 'document_id')
  String? get documentId;

  @BuiltValueField(wireName: 'dataset_id')
  String? get datasetId;

  @BuiltValueField(wireName: 'document_name')
  String? get documentName;

  @BuiltValueField(wireName: 'created_on')
  DateTime? get createdOn;

  @BuiltValueField(wireName: 'dataset_ref')
  DocumentReference? get datasetRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserDocsRecordBuilder builder) => builder
    ..documentId = ''
    ..datasetId = ''
    ..documentName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_docs')
          : FirebaseFirestore.instance.collectionGroup('user_docs');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_docs').doc();

  static Stream<UserDocsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserDocsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserDocsRecord._();
  factory UserDocsRecord([void Function(UserDocsRecordBuilder) updates]) =
      _$UserDocsRecord;

  static UserDocsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserDocsRecordData({
  String? documentId,
  String? datasetId,
  String? documentName,
  DateTime? createdOn,
  DocumentReference? datasetRef,
}) {
  final firestoreData = serializers.toFirestore(
    UserDocsRecord.serializer,
    UserDocsRecord(
      (u) => u
        ..documentId = documentId
        ..datasetId = datasetId
        ..documentName = documentName
        ..createdOn = createdOn
        ..datasetRef = datasetRef,
    ),
  );

  return firestoreData;
}
