// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AffirmationState {
  AffirmationModel? get affirmation => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<Color> get gradientColors => throw _privateConstructorUsedError;
  List<double> get gradientStops => throw _privateConstructorUsedError;
  bool get isLoadingPalette => throw _privateConstructorUsedError;

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AffirmationStateCopyWith<AffirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationStateCopyWith<$Res> {
  factory $AffirmationStateCopyWith(
          AffirmationState value, $Res Function(AffirmationState) then) =
      _$AffirmationStateCopyWithImpl<$Res, AffirmationState>;
  @useResult
  $Res call(
      {AffirmationModel? affirmation,
      Status status,
      String errorMessage,
      List<Color> gradientColors,
      List<double> gradientStops,
      bool isLoadingPalette});

  $AffirmationModelCopyWith<$Res>? get affirmation;
}

/// @nodoc
class _$AffirmationStateCopyWithImpl<$Res, $Val extends AffirmationState>
    implements $AffirmationStateCopyWith<$Res> {
  _$AffirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmation = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? gradientColors = null,
    Object? gradientStops = null,
    Object? isLoadingPalette = null,
  }) {
    return _then(_value.copyWith(
      affirmation: freezed == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as AffirmationModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      gradientColors: null == gradientColors
          ? _value.gradientColors
          : gradientColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      gradientStops: null == gradientStops
          ? _value.gradientStops
          : gradientStops // ignore: cast_nullable_to_non_nullable
              as List<double>,
      isLoadingPalette: null == isLoadingPalette
          ? _value.isLoadingPalette
          : isLoadingPalette // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AffirmationModelCopyWith<$Res>? get affirmation {
    if (_value.affirmation == null) {
      return null;
    }

    return $AffirmationModelCopyWith<$Res>(_value.affirmation!, (value) {
      return _then(_value.copyWith(affirmation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AffirmationStateImplCopyWith<$Res>
    implements $AffirmationStateCopyWith<$Res> {
  factory _$$AffirmationStateImplCopyWith(_$AffirmationStateImpl value,
          $Res Function(_$AffirmationStateImpl) then) =
      __$$AffirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AffirmationModel? affirmation,
      Status status,
      String errorMessage,
      List<Color> gradientColors,
      List<double> gradientStops,
      bool isLoadingPalette});

  @override
  $AffirmationModelCopyWith<$Res>? get affirmation;
}

/// @nodoc
class __$$AffirmationStateImplCopyWithImpl<$Res>
    extends _$AffirmationStateCopyWithImpl<$Res, _$AffirmationStateImpl>
    implements _$$AffirmationStateImplCopyWith<$Res> {
  __$$AffirmationStateImplCopyWithImpl(_$AffirmationStateImpl _value,
      $Res Function(_$AffirmationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmation = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? gradientColors = null,
    Object? gradientStops = null,
    Object? isLoadingPalette = null,
  }) {
    return _then(_$AffirmationStateImpl(
      affirmation: freezed == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as AffirmationModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      gradientColors: null == gradientColors
          ? _value._gradientColors
          : gradientColors // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      gradientStops: null == gradientStops
          ? _value._gradientStops
          : gradientStops // ignore: cast_nullable_to_non_nullable
              as List<double>,
      isLoadingPalette: null == isLoadingPalette
          ? _value.isLoadingPalette
          : isLoadingPalette // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AffirmationStateImpl implements _AffirmationState {
  const _$AffirmationStateImpl(
      {this.affirmation,
      this.status = Status.initial,
      this.errorMessage = '',
      final List<Color> gradientColors = const [
        Color.fromARGB(255, 121, 93, 165),
        Color(0xFF9D7BCA),
        Color(0xFFA77CB2),
        Color(0xFFB683A8),
        Color(0xFFE9A8A2)
      ],
      final List<double> gradientStops = const [0.0, 0.25, 0.5, 0.75, 1.0],
      this.isLoadingPalette = false})
      : _gradientColors = gradientColors,
        _gradientStops = gradientStops;

  @override
  final AffirmationModel? affirmation;
  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;
  final List<Color> _gradientColors;
  @override
  @JsonKey()
  List<Color> get gradientColors {
    if (_gradientColors is EqualUnmodifiableListView) return _gradientColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradientColors);
  }

  final List<double> _gradientStops;
  @override
  @JsonKey()
  List<double> get gradientStops {
    if (_gradientStops is EqualUnmodifiableListView) return _gradientStops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradientStops);
  }

  @override
  @JsonKey()
  final bool isLoadingPalette;

  @override
  String toString() {
    return 'AffirmationState(affirmation: $affirmation, status: $status, errorMessage: $errorMessage, gradientColors: $gradientColors, gradientStops: $gradientStops, isLoadingPalette: $isLoadingPalette)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffirmationStateImpl &&
            (identical(other.affirmation, affirmation) ||
                other.affirmation == affirmation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._gradientColors, _gradientColors) &&
            const DeepCollectionEquality()
                .equals(other._gradientStops, _gradientStops) &&
            (identical(other.isLoadingPalette, isLoadingPalette) ||
                other.isLoadingPalette == isLoadingPalette));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      affirmation,
      status,
      errorMessage,
      const DeepCollectionEquality().hash(_gradientColors),
      const DeepCollectionEquality().hash(_gradientStops),
      isLoadingPalette);

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AffirmationStateImplCopyWith<_$AffirmationStateImpl> get copyWith =>
      __$$AffirmationStateImplCopyWithImpl<_$AffirmationStateImpl>(
          this, _$identity);
}

abstract class _AffirmationState implements AffirmationState {
  const factory _AffirmationState(
      {final AffirmationModel? affirmation,
      final Status status,
      final String errorMessage,
      final List<Color> gradientColors,
      final List<double> gradientStops,
      final bool isLoadingPalette}) = _$AffirmationStateImpl;

  @override
  AffirmationModel? get affirmation;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  List<Color> get gradientColors;
  @override
  List<double> get gradientStops;
  @override
  bool get isLoadingPalette;

  /// Create a copy of AffirmationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AffirmationStateImplCopyWith<_$AffirmationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
