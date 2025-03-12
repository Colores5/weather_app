// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainAppEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainAppEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainAppEvent()';
  }
}

/// @nodoc
class $MainAppEventCopyWith<$Res> {
  $MainAppEventCopyWith(MainAppEvent _, $Res Function(MainAppEvent) __);
}

/// @nodoc

class _Init implements MainAppEvent {
  const _Init();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainAppEvent.init()';
  }
}

/// @nodoc

class _ChangeTheme implements MainAppEvent {
  const _ChangeTheme({required this.themeStatus});

  final ThemeStatus themeStatus;

  /// Create a copy of MainAppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeThemeCopyWith<_ChangeTheme> get copyWith =>
      __$ChangeThemeCopyWithImpl<_ChangeTheme>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTheme &&
            (identical(other.themeStatus, themeStatus) ||
                other.themeStatus == themeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeStatus);

  @override
  String toString() {
    return 'MainAppEvent.changeTheme(themeStatus: $themeStatus)';
  }
}

/// @nodoc
abstract mixin class _$ChangeThemeCopyWith<$Res>
    implements $MainAppEventCopyWith<$Res> {
  factory _$ChangeThemeCopyWith(
          _ChangeTheme value, $Res Function(_ChangeTheme) _then) =
      __$ChangeThemeCopyWithImpl;
  @useResult
  $Res call({ThemeStatus themeStatus});
}

/// @nodoc
class __$ChangeThemeCopyWithImpl<$Res> implements _$ChangeThemeCopyWith<$Res> {
  __$ChangeThemeCopyWithImpl(this._self, this._then);

  final _ChangeTheme _self;
  final $Res Function(_ChangeTheme) _then;

  /// Create a copy of MainAppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeStatus = null,
  }) {
    return _then(_ChangeTheme(
      themeStatus: null == themeStatus
          ? _self.themeStatus
          : themeStatus // ignore: cast_nullable_to_non_nullable
              as ThemeStatus,
    ));
  }
}

/// @nodoc
mixin _$MainAppState {
  bool get loading;
  ThemeData? get theme;
  ThemeStatus? get themeStatus;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainAppStateCopyWith<MainAppState> get copyWith =>
      _$MainAppStateCopyWithImpl<MainAppState>(
          this as MainAppState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainAppState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeStatus, themeStatus) ||
                other.themeStatus == themeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, theme, themeStatus);

  @override
  String toString() {
    return 'MainAppState(loading: $loading, theme: $theme, themeStatus: $themeStatus)';
  }
}

/// @nodoc
abstract mixin class $MainAppStateCopyWith<$Res> {
  factory $MainAppStateCopyWith(
          MainAppState value, $Res Function(MainAppState) _then) =
      _$MainAppStateCopyWithImpl;
  @useResult
  $Res call({bool loading, ThemeData? theme, ThemeStatus? themeStatus});
}

/// @nodoc
class _$MainAppStateCopyWithImpl<$Res> implements $MainAppStateCopyWith<$Res> {
  _$MainAppStateCopyWithImpl(this._self, this._then);

  final MainAppState _self;
  final $Res Function(MainAppState) _then;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? theme = freezed,
    Object? themeStatus = freezed,
  }) {
    return _then(_self.copyWith(
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      themeStatus: freezed == themeStatus
          ? _self.themeStatus
          : themeStatus // ignore: cast_nullable_to_non_nullable
              as ThemeStatus?,
    ));
  }
}

/// @nodoc

class _MainAppState implements MainAppState {
  const _MainAppState({this.loading = true, this.theme, this.themeStatus});

  @override
  @JsonKey()
  final bool loading;
  @override
  final ThemeData? theme;
  @override
  final ThemeStatus? themeStatus;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MainAppStateCopyWith<_MainAppState> get copyWith =>
      __$MainAppStateCopyWithImpl<_MainAppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainAppState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.themeStatus, themeStatus) ||
                other.themeStatus == themeStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, theme, themeStatus);

  @override
  String toString() {
    return 'MainAppState(loading: $loading, theme: $theme, themeStatus: $themeStatus)';
  }
}

/// @nodoc
abstract mixin class _$MainAppStateCopyWith<$Res>
    implements $MainAppStateCopyWith<$Res> {
  factory _$MainAppStateCopyWith(
          _MainAppState value, $Res Function(_MainAppState) _then) =
      __$MainAppStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool loading, ThemeData? theme, ThemeStatus? themeStatus});
}

/// @nodoc
class __$MainAppStateCopyWithImpl<$Res>
    implements _$MainAppStateCopyWith<$Res> {
  __$MainAppStateCopyWithImpl(this._self, this._then);

  final _MainAppState _self;
  final $Res Function(_MainAppState) _then;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loading = null,
    Object? theme = freezed,
    Object? themeStatus = freezed,
  }) {
    return _then(_MainAppState(
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      theme: freezed == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      themeStatus: freezed == themeStatus
          ? _self.themeStatus
          : themeStatus // ignore: cast_nullable_to_non_nullable
              as ThemeStatus?,
    ));
  }
}

// dart format on
