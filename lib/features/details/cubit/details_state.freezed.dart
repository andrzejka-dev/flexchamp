// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailsState {
  List<DetailModel> get figures => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailsStateCopyWith<DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res, DetailsState>;
  @useResult
  $Res call({List<DetailModel> figures, Status status, String errorMessage});
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res, $Val extends DetailsState>
    implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figures = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      figures: null == figures
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<DetailModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailsStateImplCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$$DetailsStateImplCopyWith(
          _$DetailsStateImpl value, $Res Function(_$DetailsStateImpl) then) =
      __$$DetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DetailModel> figures, Status status, String errorMessage});
}

/// @nodoc
class __$$DetailsStateImplCopyWithImpl<$Res>
    extends _$DetailsStateCopyWithImpl<$Res, _$DetailsStateImpl>
    implements _$$DetailsStateImplCopyWith<$Res> {
  __$$DetailsStateImplCopyWithImpl(
      _$DetailsStateImpl _value, $Res Function(_$DetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figures = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$DetailsStateImpl(
      figures: null == figures
          ? _value._figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<DetailModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailsStateImpl implements _DetailsState {
  const _$DetailsStateImpl(
      {final List<DetailModel> figures = const [],
      this.status = Status.initial,
      this.errorMessage = ''})
      : _figures = figures;

  final List<DetailModel> _figures;
  @override
  @JsonKey()
  List<DetailModel> get figures {
    if (_figures is EqualUnmodifiableListView) return _figures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_figures);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'DetailsState(figures: $figures, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsStateImpl &&
            const DeepCollectionEquality().equals(other._figures, _figures) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_figures), status, errorMessage);

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsStateImplCopyWith<_$DetailsStateImpl> get copyWith =>
      __$$DetailsStateImplCopyWithImpl<_$DetailsStateImpl>(this, _$identity);
}

abstract class _DetailsState implements DetailsState {
  const factory _DetailsState(
      {final List<DetailModel> figures,
      final Status status,
      final String errorMessage}) = _$DetailsStateImpl;

  @override
  List<DetailModel> get figures;
  @override
  Status get status;
  @override
  String get errorMessage;

  /// Create a copy of DetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailsStateImplCopyWith<_$DetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
