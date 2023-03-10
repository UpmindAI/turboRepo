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
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isCompletion;
    if (value != null) {
      result
        ..add('is_completion')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.datasetIds;
    if (value != null) {
      result
        ..add('dataset_ids')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.chunks;
    if (value != null) {
      result
        ..add('chunks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
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
    value = object.datasetNames;
    if (value != null) {
      result
        ..add('dataset_names')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.docTitles;
    if (value != null) {
      result
        ..add('doc_titles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.isLoading;
    if (value != null) {
      result
        ..add('is_loading')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_completion':
          result.isCompletion = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dataset_ids':
          result.datasetIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'chunks':
          result.chunks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
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
        case 'dataset_names':
          result.datasetNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'doc_titles':
          result.docTitles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'is_loading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final String? cid;
  @override
  final DateTime? timestamp;
  @override
  final String? message;
  @override
  final bool? isCompletion;
  @override
  final BuiltList<String>? datasetIds;
  @override
  final BuiltList<String>? chunks;
  @override
  final String? qid;
  @override
  final String? prompt;
  @override
  final String? completion;
  @override
  final BuiltList<String>? datasetNames;
  @override
  final BuiltList<String>? docTitles;
  @override
  final bool? isLoading;
  @override
  final String? uid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.cid,
      this.timestamp,
      this.message,
      this.isCompletion,
      this.datasetIds,
      this.chunks,
      this.qid,
      this.prompt,
      this.completion,
      this.datasetNames,
      this.docTitles,
      this.isLoading,
      this.uid,
      this.ffRef})
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
        timestamp == other.timestamp &&
        message == other.message &&
        isCompletion == other.isCompletion &&
        datasetIds == other.datasetIds &&
        chunks == other.chunks &&
        qid == other.qid &&
        prompt == other.prompt &&
        completion == other.completion &&
        datasetNames == other.datasetNames &&
        docTitles == other.docTitles &&
        isLoading == other.isLoading &&
        uid == other.uid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, cid.hashCode),
                                                        timestamp.hashCode),
                                                    message.hashCode),
                                                isCompletion.hashCode),
                                            datasetIds.hashCode),
                                        chunks.hashCode),
                                    qid.hashCode),
                                prompt.hashCode),
                            completion.hashCode),
                        datasetNames.hashCode),
                    docTitles.hashCode),
                isLoading.hashCode),
            uid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('cid', cid)
          ..add('timestamp', timestamp)
          ..add('message', message)
          ..add('isCompletion', isCompletion)
          ..add('datasetIds', datasetIds)
          ..add('chunks', chunks)
          ..add('qid', qid)
          ..add('prompt', prompt)
          ..add('completion', completion)
          ..add('datasetNames', datasetNames)
          ..add('docTitles', docTitles)
          ..add('isLoading', isLoading)
          ..add('uid', uid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  String? _cid;
  String? get cid => _$this._cid;
  set cid(String? cid) => _$this._cid = cid;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isCompletion;
  bool? get isCompletion => _$this._isCompletion;
  set isCompletion(bool? isCompletion) => _$this._isCompletion = isCompletion;

  ListBuilder<String>? _datasetIds;
  ListBuilder<String> get datasetIds =>
      _$this._datasetIds ??= new ListBuilder<String>();
  set datasetIds(ListBuilder<String>? datasetIds) =>
      _$this._datasetIds = datasetIds;

  ListBuilder<String>? _chunks;
  ListBuilder<String> get chunks =>
      _$this._chunks ??= new ListBuilder<String>();
  set chunks(ListBuilder<String>? chunks) => _$this._chunks = chunks;

  String? _qid;
  String? get qid => _$this._qid;
  set qid(String? qid) => _$this._qid = qid;

  String? _prompt;
  String? get prompt => _$this._prompt;
  set prompt(String? prompt) => _$this._prompt = prompt;

  String? _completion;
  String? get completion => _$this._completion;
  set completion(String? completion) => _$this._completion = completion;

  ListBuilder<String>? _datasetNames;
  ListBuilder<String> get datasetNames =>
      _$this._datasetNames ??= new ListBuilder<String>();
  set datasetNames(ListBuilder<String>? datasetNames) =>
      _$this._datasetNames = datasetNames;

  ListBuilder<String>? _docTitles;
  ListBuilder<String> get docTitles =>
      _$this._docTitles ??= new ListBuilder<String>();
  set docTitles(ListBuilder<String>? docTitles) =>
      _$this._docTitles = docTitles;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

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
      _timestamp = $v.timestamp;
      _message = $v.message;
      _isCompletion = $v.isCompletion;
      _datasetIds = $v.datasetIds?.toBuilder();
      _chunks = $v.chunks?.toBuilder();
      _qid = $v.qid;
      _prompt = $v.prompt;
      _completion = $v.completion;
      _datasetNames = $v.datasetNames?.toBuilder();
      _docTitles = $v.docTitles?.toBuilder();
      _isLoading = $v.isLoading;
      _uid = $v.uid;
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
              timestamp: timestamp,
              message: message,
              isCompletion: isCompletion,
              datasetIds: _datasetIds?.build(),
              chunks: _chunks?.build(),
              qid: qid,
              prompt: prompt,
              completion: completion,
              datasetNames: _datasetNames?.build(),
              docTitles: _docTitles?.build(),
              isLoading: isLoading,
              uid: uid,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'datasetIds';
        _datasetIds?.build();
        _$failedField = 'chunks';
        _chunks?.build();

        _$failedField = 'datasetNames';
        _datasetNames?.build();
        _$failedField = 'docTitles';
        _docTitles?.build();
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
