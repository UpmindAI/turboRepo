// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_request_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeatureRequestRecord> _$featureRequestRecordSerializer =
    new _$FeatureRequestRecordSerializer();

class _$FeatureRequestRecordSerializer
    implements StructuredSerializer<FeatureRequestRecord> {
  @override
  final Iterable<Type> types = const [
    FeatureRequestRecord,
    _$FeatureRequestRecord
  ];
  @override
  final String wireName = 'FeatureRequestRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FeatureRequestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.iWant;
    if (value != null) {
      result
        ..add('iWant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.because;
    if (value != null) {
      result
        ..add('Because')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.additional;
    if (value != null) {
      result
        ..add('Additional')
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
  FeatureRequestRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeatureRequestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'iWant':
          result.iWant = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Because':
          result.because = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Additional':
          result.additional = serializers.deserialize(value,
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

class _$FeatureRequestRecord extends FeatureRequestRecord {
  @override
  final String? iWant;
  @override
  final String? because;
  @override
  final String? additional;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FeatureRequestRecord(
          [void Function(FeatureRequestRecordBuilder)? updates]) =>
      (new FeatureRequestRecordBuilder()..update(updates))._build();

  _$FeatureRequestRecord._(
      {this.iWant, this.because, this.additional, this.ffRef})
      : super._();

  @override
  FeatureRequestRecord rebuild(
          void Function(FeatureRequestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeatureRequestRecordBuilder toBuilder() =>
      new FeatureRequestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeatureRequestRecord &&
        iWant == other.iWant &&
        because == other.because &&
        additional == other.additional &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, iWant.hashCode), because.hashCode), additional.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeatureRequestRecord')
          ..add('iWant', iWant)
          ..add('because', because)
          ..add('additional', additional)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FeatureRequestRecordBuilder
    implements Builder<FeatureRequestRecord, FeatureRequestRecordBuilder> {
  _$FeatureRequestRecord? _$v;

  String? _iWant;
  String? get iWant => _$this._iWant;
  set iWant(String? iWant) => _$this._iWant = iWant;

  String? _because;
  String? get because => _$this._because;
  set because(String? because) => _$this._because = because;

  String? _additional;
  String? get additional => _$this._additional;
  set additional(String? additional) => _$this._additional = additional;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FeatureRequestRecordBuilder() {
    FeatureRequestRecord._initializeBuilder(this);
  }

  FeatureRequestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _iWant = $v.iWant;
      _because = $v.because;
      _additional = $v.additional;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeatureRequestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeatureRequestRecord;
  }

  @override
  void update(void Function(FeatureRequestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeatureRequestRecord build() => _build();

  _$FeatureRequestRecord _build() {
    final _$result = _$v ??
        new _$FeatureRequestRecord._(
            iWant: iWant,
            because: because,
            additional: additional,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
