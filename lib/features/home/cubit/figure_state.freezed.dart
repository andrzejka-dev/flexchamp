// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figure_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FigureState {
  List<FigureModel> get figures => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of FigureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FigureStateCopyWith<FigureState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigureStateCopyWith<$Res> {
  factory $FigureStateCopyWith(
          FigureState value, $Res Function(FigureState) then) =
      _$FigureStateCopyWithImpl<$Res, FigureState>;
  @useResult
  $Res call({List<FigureModel> figures, Status status, String? errorMessage});
}

/// @nodoc
class _$FigureStateCopyWithImpl<$Res, $Val extends FigureState>
    implements $FigureStateCopyWith<$Res> {
  _$FigureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FigureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figures = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      figures: null == figures
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<FigureModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FigureStateImplCopyWith<$Res>
    implements $FigureStateCopyWith<$Res> {
  factory _$$FigureStateImplCopyWith(
          _$FigureStateImpl value, $Res Function(_$FigureStateImpl) then) =
      __$$FigureStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FigureModel> figures, Status status, String? errorMessage});
}

/// @nodoc
class __$$FigureStateImplCopyWithImpl<$Res>
    extends _$FigureStateCopyWithImpl<$Res, _$FigureStateImpl>
    implements _$$FigureStateImplCopyWith<$Res> {
  __$$FigureStateImplCopyWithImpl(
      _$FigureStateImpl _value, $Res Function(_$FigureStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FigureState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figures = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$FigureStateImpl(
      figures: null == figures
          ? _value._figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<FigureModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FigureStateImpl implements _FigureState {
  const _$FigureStateImpl(
      {final List<FigureModel> figures = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _figures = figures;

  final List<FigureModel> _figures;
  @override
  @JsonKey()
  List<FigureModel> get figures {
    if (_figures is EqualUnmodifiableListView) return _figures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_figures);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'FigureState(figures: $figures, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigureStateImpl &&
            const DeepCollectionEquality().equals(other._figures, _figures) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_figures), status, errorMessage);

  /// Create a copy of FigureState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FigureStateImplCopyWith<_$FigureStateImpl> get copyWith =>
      __$$FigureStateImplCopyWithImpl<_$FigureStateImpl>(this, _$identity);
}

abstract class _FigureState implements FigureState {
  const factory _FigureState(
      {final List<FigureModel> figures,
      final Status status,
      final String? errorMessage}) = _$FigureStateImpl;

  @override
  List<FigureModel> get figures;
  @override
  Status get status;
  @override
  String? get errorMessage;

  /// Create a copy of FigureState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FigureStateImplCopyWith<_$FigureStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
