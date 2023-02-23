// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_meta_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatMetaRecord> _$chatMetaRecordSerializer =
    new _$ChatMetaRecordSerializer();

class _$ChatMetaRecordSerializer
    implements StructuredSerializer<ChatMetaRecord> {
  @override
  final Iterable<Type> types = const [ChatMetaRecord, _$ChatMetaRecord];
  @override
  final String wireName = 'ChatMetaRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatMetaRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdOn;
    if (value != null) {
      result
        ..add('created_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.cid;
    if (value != null) {
      result
        ..add('cid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qids;
    if (value != null) {
      result
        ..add('qids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.firstMessage;
    if (value != null) {
      result
        ..add('first_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('last_message')
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
  ChatMetaRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatMetaRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_on':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'cid':
          result.cid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qids':
          result.qids.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'first_message':
          result.firstMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_message':
          result.lastMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prompts':
          result.prompts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ChatMetaRecord extends ChatMetaRecord {
  @override
  final DateTime? createdOn;
  @override
  final String? cid;
  @override
  final BuiltList<String>? qids;
  @override
  final String? firstMessage;
  @override
  final String? lastMessage;
  @override
  final BuiltList<String>? prompts;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatMetaRecord([void Function(ChatMetaRecordBuilder)? updates]) =>
      (new ChatMetaRecordBuilder()..update(updates))._build();

  _$ChatMetaRecord._(
      {this.createdOn,
      this.cid,
      this.qids,
      this.firstMessage,
      this.lastMessage,
      this.prompts,
      this.ffRef})
      : super._();

  @override
  ChatMetaRecord rebuild(void Function(ChatMetaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatMetaRecordBuilder toBuilder() =>
      new ChatMetaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatMetaRecord &&
        createdOn == other.createdOn &&
        cid == other.cid &&
        qids == other.qids &&
        firstMessage == other.firstMessage &&
        lastMessage == other.lastMessage &&
        prompts == other.prompts &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, createdOn.hashCode), cid.hashCode),
                        qids.hashCode),
                    firstMessage.hashCode),
                lastMessage.hashCode),
            prompts.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatMetaRecord')
          ..add('createdOn', createdOn)
          ..add('cid', cid)
          ..add('qids', qids)
          ..add('firstMessage', firstMessage)
          ..add('lastMessage', lastMessage)
          ..add('prompts', prompts)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatMetaRecordBuilder
    implements Builder<ChatMetaRecord, ChatMetaRecordBuilder> {
  _$ChatMetaRecord? _$v;

  DateTime? _createdOn;
  DateTime? get createdOn => _$this._createdOn;
  set createdOn(DateTime? createdOn) => _$this._createdOn = createdOn;

  String? _cid;
  String? get cid => _$this._cid;
  set cid(String? cid) => _$this._cid = cid;

  ListBuilder<String>? _qids;
  ListBuilder<String> get qids => _$this._qids ??= new ListBuilder<String>();
  set qids(ListBuilder<String>? qids) => _$this._qids = qids;

  String? _firstMessage;
  String? get firstMessage => _$this._firstMessage;
  set firstMessage(String? firstMessage) => _$this._firstMessage = firstMessage;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  ListBuilder<String>? _prompts;
  ListBuilder<String> get prompts =>
      _$this._prompts ??= new ListBuilder<String>();
  set prompts(ListBuilder<String>? prompts) => _$this._prompts = prompts;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatMetaRecordBuilder() {
    ChatMetaRecord._initializeBuilder(this);
  }

  ChatMetaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdOn = $v.createdOn;
      _cid = $v.cid;
      _qids = $v.qids?.toBuilder();
      _firstMessage = $v.firstMessage;
      _lastMessage = $v.lastMessage;
      _prompts = $v.prompts?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatMetaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatMetaRecord;
  }

  @override
  void update(void Function(ChatMetaRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatMetaRecord build() => _build();

  _$ChatMetaRecord _build() {
    _$ChatMetaRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatMetaRecord._(
              createdOn: createdOn,
              cid: cid,
              qids: _qids?.build(),
              firstMessage: firstMessage,
              lastMessage: lastMessage,
              prompts: _prompts?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'qids';
        _qids?.build();

        _$failedField = 'prompts';
        _prompts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatMetaRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
