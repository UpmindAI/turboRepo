// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatsRecord> _$chatsRecordSerializer = new _$ChatsRecordSerializer();

class _$ChatsRecordSerializer implements StructuredSerializer<ChatsRecord> {
  @override
  final Iterable<Type> types = const [ChatsRecord, _$ChatsRecord];
  @override
  final String wireName = 'ChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.cid;
    if (value != null) {
      result
        ..add('cid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prompts;
    if (value != null) {
      result
        ..add('prompts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.completions;
    if (value != null) {
      result
        ..add('completions')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
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
  ChatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cid':
          result.cid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompts':
          result.prompts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'completions':
          result.completions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final String? cid;
  @override
  final BuiltList<String>? prompts;
  @override
  final BuiltList<String>? completions;
  @override
  final DateTime? timestamp;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.cid, this.prompts, this.completions, this.timestamp, this.ffRef})
      : super._();

  @override
  ChatsRecord rebuild(void Function(ChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatsRecordBuilder toBuilder() => new ChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatsRecord &&
        cid == other.cid &&
        prompts == other.prompts &&
        completions == other.completions &&
        timestamp == other.timestamp &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, cid.hashCode), prompts.hashCode),
                completions.hashCode),
            timestamp.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('cid', cid)
          ..add('prompts', prompts)
          ..add('completions', completions)
          ..add('timestamp', timestamp)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  String? _cid;
  String? get cid => _$this._cid;
  set cid(String? cid) => _$this._cid = cid;

  ListBuilder<String>? _prompts;
  ListBuilder<String> get prompts =>
      _$this._prompts ??= new ListBuilder<String>();
  set prompts(ListBuilder<String>? prompts) => _$this._prompts = prompts;

  ListBuilder<String>? _completions;
  ListBuilder<String> get completions =>
      _$this._completions ??= new ListBuilder<String>();
  set completions(ListBuilder<String>? completions) =>
      _$this._completions = completions;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatsRecordBuilder() {
    ChatsRecord._initializeBuilder(this);
  }

  ChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cid = $v.cid;
      _prompts = $v.prompts?.toBuilder();
      _completions = $v.completions?.toBuilder();
      _timestamp = $v.timestamp;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatsRecord;
  }

  @override
  void update(void Function(ChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatsRecord build() => _build();

  _$ChatsRecord _build() {
    _$ChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatsRecord._(
              cid: cid,
              prompts: _prompts?.build(),
              completions: _completions?.build(),
              timestamp: timestamp,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prompts';
        _prompts?.build();
        _$failedField = 'completions';
        _completions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
