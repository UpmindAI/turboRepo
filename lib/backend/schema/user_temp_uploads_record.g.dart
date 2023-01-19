// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_temp_uploads_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserTempUploadsRecord> _$userTempUploadsRecordSerializer =
    new _$UserTempUploadsRecordSerializer();

class _$UserTempUploadsRecordSerializer
    implements StructuredSerializer<UserTempUploadsRecord> {
  @override
  final Iterable<Type> types = const [
    UserTempUploadsRecord,
    _$UserTempUploadsRecord
  ];
  @override
  final String wireName = 'UserTempUploadsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserTempUploadsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.docTitle;
    if (value != null) {
      result
        ..add('doc_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.docId;
    if (value != null) {
      result
        ..add('doc_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.collectionName;
    if (value != null) {
      result
        ..add('collection_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.collectionId;
    if (value != null) {
      result
        ..add('collection_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chunkSize;
    if (value != null) {
      result
        ..add('chunk_size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserTempUploadsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserTempUploadsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doc_title':
          result.docTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doc_id':
          result.docId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'collection_name':
          result.collectionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'collection_id':
          result.collectionId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chunk_size':
          result.chunkSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserTempUploadsRecord extends UserTempUploadsRecord {
  @override
  final String? docTitle;
  @override
  final String? docId;
  @override
  final String? collectionName;
  @override
  final String? collectionId;
  @override
  final String? chunkSize;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserTempUploadsRecord(
          [void Function(UserTempUploadsRecordBuilder)? updates]) =>
      (new UserTempUploadsRecordBuilder()..update(updates))._build();

  _$UserTempUploadsRecord._(
      {this.docTitle,
      this.docId,
      this.collectionName,
      this.collectionId,
      this.chunkSize,
      this.ffRef})
      : super._();

  @override
  UserTempUploadsRecord rebuild(
          void Function(UserTempUploadsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserTempUploadsRecordBuilder toBuilder() =>
      new UserTempUploadsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTempUploadsRecord &&
        docTitle == other.docTitle &&
        docId == other.docId &&
        collectionName == other.collectionName &&
        collectionId == other.collectionId &&
        chunkSize == other.chunkSize &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, docTitle.hashCode), docId.hashCode),
                    collectionName.hashCode),
                collectionId.hashCode),
            chunkSize.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserTempUploadsRecord')
          ..add('docTitle', docTitle)
          ..add('docId', docId)
          ..add('collectionName', collectionName)
          ..add('collectionId', collectionId)
          ..add('chunkSize', chunkSize)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserTempUploadsRecordBuilder
    implements Builder<UserTempUploadsRecord, UserTempUploadsRecordBuilder> {
  _$UserTempUploadsRecord? _$v;

  String? _docTitle;
  String? get docTitle => _$this._docTitle;
  set docTitle(String? docTitle) => _$this._docTitle = docTitle;

  String? _docId;
  String? get docId => _$this._docId;
  set docId(String? docId) => _$this._docId = docId;

  String? _collectionName;
  String? get collectionName => _$this._collectionName;
  set collectionName(String? collectionName) =>
      _$this._collectionName = collectionName;

  String? _collectionId;
  String? get collectionId => _$this._collectionId;
  set collectionId(String? collectionId) => _$this._collectionId = collectionId;

  String? _chunkSize;
  String? get chunkSize => _$this._chunkSize;
  set chunkSize(String? chunkSize) => _$this._chunkSize = chunkSize;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserTempUploadsRecordBuilder() {
    UserTempUploadsRecord._initializeBuilder(this);
  }

  UserTempUploadsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _docTitle = $v.docTitle;
      _docId = $v.docId;
      _collectionName = $v.collectionName;
      _collectionId = $v.collectionId;
      _chunkSize = $v.chunkSize;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserTempUploadsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserTempUploadsRecord;
  }

  @override
  void update(void Function(UserTempUploadsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserTempUploadsRecord build() => _build();

  _$UserTempUploadsRecord _build() {
    final _$result = _$v ??
        new _$UserTempUploadsRecord._(
            docTitle: docTitle,
            docId: docId,
            collectionName: collectionName,
            collectionId: collectionId,
            chunkSize: chunkSize,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
