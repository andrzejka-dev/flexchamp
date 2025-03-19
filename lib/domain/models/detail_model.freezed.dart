// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) {
  return _DetailModel.fromJson(json);
}

/// @nodoc
mixin _$DetailModel {
  @JsonKey(name: 'name')
  List<String> get names => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  List<String> get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'photoURL')
  List<String> get photoURLs => throw _privateConstructorUsedError;
  @JsonKey(name: 'headerImage')
  String get headerImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'figureIcon')
  String get figureIcon => throw _privateConstructorUsedError;

  /// Serializes this DetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailModelCopyWith<DetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailModelCopyWith<$Res> {
  factory $DetailModelCopyWith(
          DetailModel value, $Res Function(DetailModel) then) =
      _$DetailModelCopyWithImpl<$Res, DetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') List<String> names,
      @JsonKey(name: 'description') List<String> descriptions,
      @JsonKey(name: 'photoURL') List<String> photoURLs,
      @JsonKey(name: 'headerImage') String headerImage,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'figureIcon') String figureIcon});
}

/// @nodoc
class _$DetailModelCopyWithImpl<$Res, $Val extends DetailModel>
    implements $DetailModelCopyWith<$Res> {
  _$DetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
    Object? descriptions = null,
    Object? photoURLs = null,
    Object? headerImage = null,
    Object? id = null,
    Object? title = null,
    Object? figureIcon = null,
  }) {
    return _then(_value.copyWith(
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoURLs: null == photoURLs
          ? _value.photoURLs
          : photoURLs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      figureIcon: null == figureIcon
          ? _value.figureIcon
          : figureIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailModelImplCopyWith<$Res>
    implements $DetailModelCopyWith<$Res> {
  factory _$$DetailModelImplCopyWith(
          _$DetailModelImpl value, $Res Function(_$DetailModelImpl) then) =
      __$$DetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') List<String> names,
      @JsonKey(name: 'description') List<String> descriptions,
      @JsonKey(name: 'photoURL') List<String> photoURLs,
      @JsonKey(name: 'headerImage') String headerImage,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'figureIcon') String figureIcon});
}

/// @nodoc
class __$$DetailModelImplCopyWithImpl<$Res>
    extends _$DetailModelCopyWithImpl<$Res, _$DetailModelImpl>
    implements _$$DetailModelImplCopyWith<$Res> {
  __$$DetailModelImplCopyWithImpl(
      _$DetailModelImpl _value, $Res Function(_$DetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
    Object? descriptions = null,
    Object? photoURLs = null,
    Object? headerImage = null,
    Object? id = null,
    Object? title = null,
    Object? figureIcon = null,
  }) {
    return _then(_$DetailModelImpl(
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoURLs: null == photoURLs
          ? _value._photoURLs
          : photoURLs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      headerImage: null == headerImage
          ? _value.headerImage
          : headerImage // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      figureIcon: null == figureIcon
          ? _value.figureIcon
          : figureIcon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailModelImpl implements _DetailModel {
  const _$DetailModelImpl(
      {@JsonKey(name: 'name') required final List<String> names,
      @JsonKey(name: 'description') required final List<String> descriptions,
      @JsonKey(name: 'photoURL') required final List<String> photoURLs,
      @JsonKey(name: 'headerImage') required this.headerImage,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'figureIcon') required this.figureIcon})
      : _names = names,
        _descriptions = descriptions,
        _photoURLs = photoURLs;

  factory _$DetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailModelImplFromJson(json);

  final List<String> _names;
  @override
  @JsonKey(name: 'name')
  List<String> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  final List<String> _descriptions;
  @override
  @JsonKey(name: 'description')
  List<String> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  final List<String> _photoURLs;
  @override
  @JsonKey(name: 'photoURL')
  List<String> get photoURLs {
    if (_photoURLs is EqualUnmodifiableListView) return _photoURLs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoURLs);
  }

  @override
  @JsonKey(name: 'headerImage')
  final String headerImage;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'figureIcon')
  final String figureIcon;

  @override
  String toString() {
    return 'DetailModel(names: $names, descriptions: $descriptions, photoURLs: $photoURLs, headerImage: $headerImage, id: $id, title: $title, figureIcon: $figureIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailModelImpl &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            const DeepCollectionEquality()
                .equals(other._photoURLs, _photoURLs) &&
            (identical(other.headerImage, headerImage) ||
                other.headerImage == headerImage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.figureIcon, figureIcon) ||
                other.figureIcon == figureIcon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_photoURLs),
      headerImage,
      id,
      title,
      figureIcon);

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      __$$DetailModelImplCopyWithImpl<_$DetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailModelImplToJson(
      this,
    );
  }
}

abstract class _DetailModel implements DetailModel {
  const factory _DetailModel(
      {@JsonKey(name: 'name') required final List<String> names,
      @JsonKey(name: 'description') required final List<String> descriptions,
      @JsonKey(name: 'photoURL') required final List<String> photoURLs,
      @JsonKey(name: 'headerImage') required final String headerImage,
      @JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'figureIcon')
      required final String figureIcon}) = _$DetailModelImpl;

  factory _DetailModel.fromJson(Map<String, dynamic> json) =
      _$DetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  List<String> get names;
  @override
  @JsonKey(name: 'description')
  List<String> get descriptions;
  @override
  @JsonKey(name: 'photoURL')
  List<String> get photoURLs;
  @override
  @JsonKey(name: 'headerImage')
  String get headerImage;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'figureIcon')
  String get figureIcon;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
