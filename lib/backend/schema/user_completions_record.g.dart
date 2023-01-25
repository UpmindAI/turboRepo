// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_completions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCompletionsRecord> _$userCompletionsRecordSerializer =
    new _$UserCompletionsRecordSerializer();

class _$UserCompletionsRecordSerializer
    implements StructuredSerializer<UserCompletionsRecord> {
  @override
  final Iterable<Type> types = const [
    UserCompletionsRecord,
    _$UserCompletionsRecord
  ];
  @override
  final String wireName = 'UserCompletionsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserCompletionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.qid;
    if (value != null) {
      result
        ..add('qid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prompt;
    if (value != null) {
      result
        ..add('prompt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.completion;
    if (value != null) {
      result
        ..add('completion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
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
  UserCompletionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCompletionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'qid':
          result.qid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompt':
          result.prompt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'completion':
          result.completion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
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

class _$UserCompletionsRecord extends UserCompletionsRecord {
  @override
  final String? qid;
  @override
  final String? prompt;
  @override
  final String? completion;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserCompletionsRecord(
          [void Function(UserCompletionsRecordBuilder)? updates]) =>
      (new UserCompletionsRecordBuilder()..update(updates))._build();

  _$UserCompletionsRecord._(
      {this.qid, this.prompt, this.completion, this.url, this.ffRef})
      : super._();

  @override
  UserCompletionsRecord rebuild(
          void Function(UserCompletionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCompletionsRecordBuilder toBuilder() =>
      new UserCompletionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCompletionsRecord &&
        qid == other.qid &&
        prompt == other.prompt &&
        completion == other.completion &&
        url == other.url &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, qid.hashCode), prompt.hashCode),
                completion.hashCode),
            url.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCompletionsRecord')
          ..add('qid', qid)
          ..add('prompt', prompt)
          ..add('completion', completion)
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserCompletionsRecordBuilder
    implements Builder<UserCompletionsRecord, UserCompletionsRecordBuilder> {
  _$UserCompletionsRecord? _$v;

  String? _qid;
  String? get qid => _$this._qid;
  set qid(String? qid) => _$this._qid = qid;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _completion;
  String? get completion => _$this._completion;
  set completion(String? completion) => _$this._completion = completion;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserCompletionsRecordBuilder() {
    UserCompletionsRecord._initializeBuilder(this);
  }

  UserCompletionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _qid = $v.qid;
      _prompt = $v.prompt;
      _completion = $v.completion;
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCompletionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCompletionsRecord;
  }

  @override
  void update(void Function(UserCompletionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCompletionsRecord build() => _build();

  _$UserCompletionsRecord _build() {
    final _$result = _$v ??
        new _$UserCompletionsRecord._(
            qid: qid,
            prompt: prompt,
            completion: completion,
            url: url,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
