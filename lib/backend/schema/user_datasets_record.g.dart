// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_datasets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDatasetsRecord> _$userDatasetsRecordSerializer =
    new _$UserDatasetsRecordSerializer();

class _$UserDatasetsRecordSerializer
    implements StructuredSerializer<UserDatasetsRecord> {
  @override
  final Iterable<Type> types = const [UserDatasetsRecord, _$UserDatasetsRecord];
  @override
  final String wireName = 'UserDatasetsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserDatasetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.datasetId;
    if (value != null) {
      result
        ..add('dataset_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datasetName;
    if (value != null) {
      result
        ..add('dataset_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pictureUrl;
    if (value != null) {
      result
        ..add('picture_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdOn;
    if (value != null) {
      result
        ..add('created_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  UserDatasetsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDatasetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dataset_id':
          result.datasetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dataset_name':
          result.datasetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_url':
          result.pictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_on':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$UserDatasetsRecord extends UserDatasetsRecord {
  @override
  final String? datasetId;
  @override
  final String? datasetName;
  @override
  final String? description;
  @override
  final String? pictureUrl;
  @override
  final DateTime? createdOn;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserDatasetsRecord(
          [void Function(UserDatasetsRecordBuilder)? updates]) =>
      (new UserDatasetsRecordBuilder()..update(updates))._build();

  _$UserDatasetsRecord._(
      {this.datasetId,
      this.datasetName,
      this.description,
      this.pictureUrl,
      this.createdOn,
      this.ffRef})
      : super._();

  @override
  UserDatasetsRecord rebuild(
          void Function(UserDatasetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDatasetsRecordBuilder toBuilder() =>
      new UserDatasetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDatasetsRecord &&
        datasetId == other.datasetId &&
        datasetName == other.datasetName &&
        description == other.description &&
        pictureUrl == other.pictureUrl &&
        createdOn == other.createdOn &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, datasetId.hashCode), datasetName.hashCode),
                    description.hashCode),
                pictureUrl.hashCode),
            createdOn.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDatasetsRecord')
          ..add('datasetId', datasetId)
          ..add('datasetName', datasetName)
          ..add('description', description)
          ..add('pictureUrl', pictureUrl)
          ..add('createdOn', createdOn)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserDatasetsRecordBuilder
    implements Builder<UserDatasetsRecord, UserDatasetsRecordBuilder> {
  _$UserDatasetsRecord? _$v;

  String? _datasetId;
  String? get datasetId => _$this._datasetId;
  set datasetId(String? datasetId) => _$this._datasetId = datasetId;

  String? _datasetName;
  String? get datasetName => _$this._datasetName;
  set datasetName(String? datasetName) => _$this._datasetName = datasetName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _pictureUrl;
  String? get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String? pictureUrl) => _$this._pictureUrl = pictureUrl;

  DateTime? _createdOn;
  DateTime? get createdOn => _$this._createdOn;
  set createdOn(DateTime? createdOn) => _$this._createdOn = createdOn;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserDatasetsRecordBuilder() {
    UserDatasetsRecord._initializeBuilder(this);
  }

  UserDatasetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _datasetId = $v.datasetId;
      _datasetName = $v.datasetName;
      _description = $v.description;
      _pictureUrl = $v.pictureUrl;
      _createdOn = $v.createdOn;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDatasetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDatasetsRecord;
  }

  @override
  void update(void Function(UserDatasetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDatasetsRecord build() => _build();

  _$UserDatasetsRecord _build() {
    final _$result = _$v ??
        new _$UserDatasetsRecord._(
            datasetId: datasetId,
            datasetName: datasetName,
            description: description,
            pictureUrl: pictureUrl,
            createdOn: createdOn,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
