// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AffirmationModel _$AffirmationModelFromJson(Map<String, dynamic> json) {
  return _AffirmationModel.fromJson(json);
}

/// @nodoc
mixin _$AffirmationModel {
  int get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this AffirmationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AffirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AffirmationModelCopyWith<AffirmationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationModelCopyWith<$Res> {
  factory $AffirmationModelCopyWith(
          AffirmationModel value, $Res Function(AffirmationModel) then) =
      _$AffirmationModelCopyWithImpl<$Res, AffirmationModel>;
  @useResult
  $Res call({int id, String imageUrl});
}

/// @nodoc
class _$AffirmationModelCopyWithImpl<$Res, $Val extends AffirmationModel>
    implements $AffirmationModelCopyWith<$Res> {
  _$AffirmationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AffirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AffirmationModelImplCopyWith<$Res>
    implements $AffirmationModelCopyWith<$Res> {
  factory _$$AffirmationModelImplCopyWith(_$AffirmationModelImpl value,
          $Res Function(_$AffirmationModelImpl) then) =
      __$$AffirmationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String imageUrl});
}

/// @nodoc
class __$$AffirmationModelImplCopyWithImpl<$Res>
    extends _$AffirmationModelCopyWithImpl<$Res, _$AffirmationModelImpl>
    implements _$$AffirmationModelImplCopyWith<$Res> {
  __$$AffirmationModelImplCopyWithImpl(_$AffirmationModelImpl _value,
      $Res Function(_$AffirmationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AffirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
  }) {
    return _then(_$AffirmationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AffirmationModelImpl implements _AffirmationModel {
  const _$AffirmationModelImpl({required this.id, required this.imageUrl});

  factory _$AffirmationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AffirmationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'AffirmationModel(id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffirmationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl);

  /// Create a copy of AffirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AffirmationModelImplCopyWith<_$AffirmationModelImpl> get copyWith =>
      __$$AffirmationModelImplCopyWithImpl<_$AffirmationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AffirmationModelImplToJson(
      this,
    );
  }
}

abstract class _AffirmationModel implements AffirmationModel {
  const factory _AffirmationModel(
      {required final int id,
      required final String imageUrl}) = _$AffirmationModelImpl;

  factory _AffirmationModel.fromJson(Map<String, dynamic> json) =
      _$AffirmationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get imageUrl;

  /// Create a copy of AffirmationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AffirmationModelImplCopyWith<_$AffirmationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
