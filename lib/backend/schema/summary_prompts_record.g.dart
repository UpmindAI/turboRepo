// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_prompts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SummaryPromptsRecord> _$summaryPromptsRecordSerializer =
    new _$SummaryPromptsRecordSerializer();

class _$SummaryPromptsRecordSerializer
    implements StructuredSerializer<SummaryPromptsRecord> {
  @override
  final Iterable<Type> types = const [
    SummaryPromptsRecord,
    _$SummaryPromptsRecord
  ];
  @override
  final String wireName = 'SummaryPromptsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SummaryPromptsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.summaryPrompt;
    if (value != null) {
      result
        ..add('summary_prompt')
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
  SummaryPromptsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SummaryPromptsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'summary_prompt':
          result.summaryPrompt = serializers.deserialize(value,
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

class _$SummaryPromptsRecord extends SummaryPromptsRecord {
  @override
  final String? summaryPrompt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SummaryPromptsRecord(
          [void Function(SummaryPromptsRecordBuilder)? updates]) =>
      (new SummaryPromptsRecordBuilder()..update(updates))._build();

  _$SummaryPromptsRecord._({this.summaryPrompt, this.ffRef}) : super._();

  @override
  SummaryPromptsRecord rebuild(
          void Function(SummaryPromptsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SummaryPromptsRecordBuilder toBuilder() =>
      new SummaryPromptsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SummaryPromptsRecord &&
        summaryPrompt == other.summaryPrompt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, summaryPrompt.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SummaryPromptsRecord')
          ..add('summaryPrompt', summaryPrompt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SummaryPromptsRecordBuilder
    implements Builder<SummaryPromptsRecord, SummaryPromptsRecordBuilder> {
  _$SummaryPromptsRecord? _$v;

  String? _summaryPrompt;
  String? get summaryPrompt => _$this._summaryPrompt;
  set summaryPrompt(String? summaryPrompt) =>
      _$this._summaryPrompt = summaryPrompt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SummaryPromptsRecordBuilder() {
    SummaryPromptsRecord._initializeBuilder(this);
  }

  SummaryPromptsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summaryPrompt = $v.summaryPrompt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SummaryPromptsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SummaryPromptsRecord;
  }

  @override
  void update(void Function(SummaryPromptsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SummaryPromptsRecord build() => _build();

  _$SummaryPromptsRecord _build() {
    final _$result = _$v ??
        new _$SummaryPromptsRecord._(
            summaryPrompt: summaryPrompt, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
