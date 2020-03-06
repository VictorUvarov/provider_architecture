// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_snack_bar_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmSnackBarRequest extends ConfirmSnackBarRequest {
  @override
  final String message;
  @override
  final String childText;
  @override
  final int colorCode;
  @override
  final int duration;
  @override
  final void Function() onPressed;

  factory _$ConfirmSnackBarRequest(
          [void Function(ConfirmSnackBarRequestBuilder) updates]) =>
      (new ConfirmSnackBarRequestBuilder()..update(updates)).build();

  _$ConfirmSnackBarRequest._(
      {this.message,
      this.childText,
      this.colorCode,
      this.duration,
      this.onPressed})
      : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('ConfirmSnackBarRequest', 'message');
    }
    if (childText == null) {
      throw new BuiltValueNullFieldError('ConfirmSnackBarRequest', 'childText');
    }
  }

  @override
  ConfirmSnackBarRequest rebuild(
          void Function(ConfirmSnackBarRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmSnackBarRequestBuilder toBuilder() =>
      new ConfirmSnackBarRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ConfirmSnackBarRequest &&
        message == other.message &&
        childText == other.childText &&
        colorCode == other.colorCode &&
        duration == other.duration &&
        onPressed == _$dynamicOther.onPressed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, message.hashCode), childText.hashCode),
                colorCode.hashCode),
            duration.hashCode),
        onPressed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfirmSnackBarRequest')
          ..add('message', message)
          ..add('childText', childText)
          ..add('colorCode', colorCode)
          ..add('duration', duration)
          ..add('onPressed', onPressed))
        .toString();
  }
}

class ConfirmSnackBarRequestBuilder
    implements Builder<ConfirmSnackBarRequest, ConfirmSnackBarRequestBuilder> {
  _$ConfirmSnackBarRequest _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _childText;
  String get childText => _$this._childText;
  set childText(String childText) => _$this._childText = childText;

  int _colorCode;
  int get colorCode => _$this._colorCode;
  set colorCode(int colorCode) => _$this._colorCode = colorCode;

  int _duration;
  int get duration => _$this._duration;
  set duration(int duration) => _$this._duration = duration;

  void Function() _onPressed;
  void Function() get onPressed => _$this._onPressed;
  set onPressed(void Function() onPressed) => _$this._onPressed = onPressed;

  ConfirmSnackBarRequestBuilder();

  ConfirmSnackBarRequestBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _childText = _$v.childText;
      _colorCode = _$v.colorCode;
      _duration = _$v.duration;
      _onPressed = _$v.onPressed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmSnackBarRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConfirmSnackBarRequest;
  }

  @override
  void update(void Function(ConfirmSnackBarRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfirmSnackBarRequest build() {
    final _$result = _$v ??
        new _$ConfirmSnackBarRequest._(
            message: message,
            childText: childText,
            colorCode: colorCode,
            duration: duration,
            onPressed: onPressed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
