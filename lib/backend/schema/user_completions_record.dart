import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_completions_record.g.dart';

abstract class UserCompletionsRecord
    implements Built<UserCompletionsRecord, UserCompletionsRecordBuilder> {
  static Serializer<UserCompletionsRecord> get serializer =>
      _$userCompletionsRecordSerializer;

  String? get qid;

  String? get prompt;

  String? get completion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(UserCompletionsRecordBuilder builder) =>
      builder
        ..qid = ''
        ..prompt = ''
        ..completion = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_completions')
          : FirebaseFirestore.instance.collectionGroup('user_completions');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('user_completions').doc();

  static Stream<UserCompletionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserCompletionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserCompletionsRecord._();
  factory UserCompletionsRecord(
          [void Function(UserCompletionsRecordBuilder) updates]) =
      _$UserCompletionsRecord;

  static UserCompletionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserCompletionsRecordData({
  String? qid,
  String? prompt,
  String? completion,
}) {
  final firestoreData = serializers.toFirestore(
    UserCompletionsRecord.serializer,
    UserCompletionsRecord(
      (u) => u
        ..qid = qid
        ..prompt = prompt
        ..completion = completion,
    ),
  );

  return firestoreData;
}
