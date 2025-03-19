// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'figure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FigureModel _$FigureModelFromJson(Map<String, dynamic> json) {
  return _FigureModel.fromJson(json);
}

/// @nodoc
mixin _$FigureModel {
  String get title => throw _privateConstructorUsedError;
  String? get figureIcon => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this FigureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FigureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FigureModelCopyWith<FigureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FigureModelCopyWith<$Res> {
  factory $FigureModelCopyWith(
          FigureModel value, $Res Function(FigureModel) then) =
      _$FigureModelCopyWithImpl<$Res, FigureModel>;
  @useResult
  $Res call({String title, String? figureIcon, String? id});
}

/// @nodoc
class _$FigureModelCopyWithImpl<$Res, $Val extends FigureModel>
    implements $FigureModelCopyWith<$Res> {
  _$FigureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FigureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? figureIcon = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      figureIcon: freezed == figureIcon
          ? _value.figureIcon
          : figureIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FigureModelImplCopyWith<$Res>
    implements $FigureModelCopyWith<$Res> {
  factory _$$FigureModelImplCopyWith(
          _$FigureModelImpl value, $Res Function(_$FigureModelImpl) then) =
      __$$FigureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String? figureIcon, String? id});
}

/// @nodoc
class __$$FigureModelImplCopyWithImpl<$Res>
    extends _$FigureModelCopyWithImpl<$Res, _$FigureModelImpl>
    implements _$$FigureModelImplCopyWith<$Res> {
  __$$FigureModelImplCopyWithImpl(
      _$FigureModelImpl _value, $Res Function(_$FigureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FigureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? figureIcon = freezed,
    Object? id = freezed,
  }) {
    return _then(_$FigureModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      figureIcon: freezed == figureIcon
          ? _value.figureIcon
          : figureIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FigureModelImpl implements _FigureModel {
  const _$FigureModelImpl({required this.title, this.figureIcon, this.id});

  factory _$FigureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FigureModelImplFromJson(json);

  @override
  final String title;
  @override
  final String? figureIcon;
  @override
  final String? id;

  @override
  String toString() {
    return 'FigureModel(title: $title, figureIcon: $figureIcon, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FigureModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.figureIcon, figureIcon) ||
                other.figureIcon == figureIcon) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, figureIcon, id);

  /// Create a copy of FigureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FigureModelImplCopyWith<_$FigureModelImpl> get copyWith =>
      __$$FigureModelImplCopyWithImpl<_$FigureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FigureModelImplToJson(
      this,
    );
  }
}

abstract class _FigureModel implements FigureModel {
  const factory _FigureModel(
      {required final String title,
      final String? figureIcon,
      final String? id}) = _$FigureModelImpl;

  factory _FigureModel.fromJson(Map<String, dynamic> json) =
      _$FigureModelImpl.fromJson;

  @override
  String get title;
  @override
  String? get figureIcon;
  @override
  String? get id;

  /// Create a copy of FigureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FigureModelImplCopyWith<_$FigureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
