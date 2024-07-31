//
//  Generated code. Do not modify.
//  source: protos/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// @tos_1001
/// 进入游戏 请求玩家信息
class UserInfoArg extends $pb.GeneratedMessage {
  factory UserInfoArg() => create();
  UserInfoArg._() : super();
  factory UserInfoArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfoArg', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoArg clone() => UserInfoArg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoArg copyWith(void Function(UserInfoArg) updates) => super.copyWith((message) => updates(message as UserInfoArg)) as UserInfoArg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoArg create() => UserInfoArg._();
  UserInfoArg createEmptyInstance() => create();
  static $pb.PbList<UserInfoArg> createRepeated() => $pb.PbList<UserInfoArg>();
  @$core.pragma('dart2js:noInline')
  static UserInfoArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoArg>(create);
  static UserInfoArg? _defaultInstance;
}

/// @toc_1001
/// 进入游戏 请求玩家信息
class UserInfoResult extends $pb.GeneratedMessage {
  factory UserInfoResult({
    $core.int? userId,
    $core.String? name,
    $core.int? balance,
    $core.String? icon,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    return $result;
  }
  UserInfoResult._() : super();
  factory UserInfoResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserInfoResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoResult clone() => UserInfoResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoResult copyWith(void Function(UserInfoResult) updates) => super.copyWith((message) => updates(message as UserInfoResult)) as UserInfoResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserInfoResult create() => UserInfoResult._();
  UserInfoResult createEmptyInstance() => create();
  static $pb.PbList<UserInfoResult> createRepeated() => $pb.PbList<UserInfoResult>();
  @$core.pragma('dart2js:noInline')
  static UserInfoResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoResult>(create);
  static UserInfoResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get balance => $_getIZ(2);
  @$pb.TagNumber(3)
  set balance($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);
}

/// @tos_2001
/// 玩水果游戏 请求
class FruitPlayArg extends $pb.GeneratedMessage {
  factory FruitPlayArg({
    $core.String? flag,
    $core.Iterable<Bet>? fruits,
  }) {
    final $result = create();
    if (flag != null) {
      $result.flag = flag;
    }
    if (fruits != null) {
      $result.fruits.addAll(fruits);
    }
    return $result;
  }
  FruitPlayArg._() : super();
  factory FruitPlayArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FruitPlayArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FruitPlayArg', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'flag')
    ..pc<Bet>(2, _omitFieldNames ? '' : 'fruits', $pb.PbFieldType.PM, subBuilder: Bet.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FruitPlayArg clone() => FruitPlayArg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FruitPlayArg copyWith(void Function(FruitPlayArg) updates) => super.copyWith((message) => updates(message as FruitPlayArg)) as FruitPlayArg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FruitPlayArg create() => FruitPlayArg._();
  FruitPlayArg createEmptyInstance() => create();
  static $pb.PbList<FruitPlayArg> createRepeated() => $pb.PbList<FruitPlayArg>();
  @$core.pragma('dart2js:noInline')
  static FruitPlayArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FruitPlayArg>(create);
  static FruitPlayArg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get flag => $_getSZ(0);
  @$pb.TagNumber(1)
  set flag($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFlag() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlag() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Bet> get fruits => $_getList(1);
}

/// @toc_2001
/// 玩水果游戏 响应结果
class FruitPlayResult extends $pb.GeneratedMessage {
  factory FruitPlayResult({
    $core.Iterable<$core.int>? lights,
    $core.Iterable<Bet>? fruits,
    $core.int? odds,
    $core.Iterable<Bet>? part,
    $core.int? win,
    $core.int? balance,
  }) {
    final $result = create();
    if (lights != null) {
      $result.lights.addAll(lights);
    }
    if (fruits != null) {
      $result.fruits.addAll(fruits);
    }
    if (odds != null) {
      $result.odds = odds;
    }
    if (part != null) {
      $result.part.addAll(part);
    }
    if (win != null) {
      $result.win = win;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    return $result;
  }
  FruitPlayResult._() : super();
  factory FruitPlayResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FruitPlayResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FruitPlayResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'lights', $pb.PbFieldType.KU3)
    ..pc<Bet>(2, _omitFieldNames ? '' : 'fruits', $pb.PbFieldType.PM, subBuilder: Bet.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'odds', $pb.PbFieldType.OU3)
    ..pc<Bet>(4, _omitFieldNames ? '' : 'part', $pb.PbFieldType.PM, subBuilder: Bet.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'win', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FruitPlayResult clone() => FruitPlayResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FruitPlayResult copyWith(void Function(FruitPlayResult) updates) => super.copyWith((message) => updates(message as FruitPlayResult)) as FruitPlayResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FruitPlayResult create() => FruitPlayResult._();
  FruitPlayResult createEmptyInstance() => create();
  static $pb.PbList<FruitPlayResult> createRepeated() => $pb.PbList<FruitPlayResult>();
  @$core.pragma('dart2js:noInline')
  static FruitPlayResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FruitPlayResult>(create);
  static FruitPlayResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get lights => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<Bet> get fruits => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get odds => $_getIZ(2);
  @$pb.TagNumber(3)
  set odds($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOdds() => $_has(2);
  @$pb.TagNumber(3)
  void clearOdds() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Bet> get part => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get win => $_getIZ(4);
  @$pb.TagNumber(5)
  set win($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWin() => $_has(4);
  @$pb.TagNumber(5)
  void clearWin() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get balance => $_getIZ(5);
  @$pb.TagNumber(6)
  set balance($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBalance() => $_has(5);
  @$pb.TagNumber(6)
  void clearBalance() => clearField(6);
}

/// @tos_2002
/// 玩大小游戏 请求
class BsPlayArg extends $pb.GeneratedMessage {
  factory BsPlayArg({
    $core.int? index,
    $core.int? amount,
  }) {
    final $result = create();
    if (index != null) {
      $result.index = index;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  BsPlayArg._() : super();
  factory BsPlayArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BsPlayArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BsPlayArg', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BsPlayArg clone() => BsPlayArg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BsPlayArg copyWith(void Function(BsPlayArg) updates) => super.copyWith((message) => updates(message as BsPlayArg)) as BsPlayArg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BsPlayArg create() => BsPlayArg._();
  BsPlayArg createEmptyInstance() => create();
  static $pb.PbList<BsPlayArg> createRepeated() => $pb.PbList<BsPlayArg>();
  @$core.pragma('dart2js:noInline')
  static BsPlayArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BsPlayArg>(create);
  static BsPlayArg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get amount => $_getIZ(1);
  @$pb.TagNumber(2)
  set amount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}

/// @toc_2002
/// 玩大小游戏 响应结果
class BsPlayResult extends $pb.GeneratedMessage {
  factory BsPlayResult({
    $core.int? result,
    $core.int? win,
    $core.int? balance,
  }) {
    final $result = create();
    if (result != null) {
      $result.result = result;
    }
    if (win != null) {
      $result.win = win;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    return $result;
  }
  BsPlayResult._() : super();
  factory BsPlayResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BsPlayResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BsPlayResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'result', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'win', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BsPlayResult clone() => BsPlayResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BsPlayResult copyWith(void Function(BsPlayResult) updates) => super.copyWith((message) => updates(message as BsPlayResult)) as BsPlayResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BsPlayResult create() => BsPlayResult._();
  BsPlayResult createEmptyInstance() => create();
  static $pb.PbList<BsPlayResult> createRepeated() => $pb.PbList<BsPlayResult>();
  @$core.pragma('dart2js:noInline')
  static BsPlayResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BsPlayResult>(create);
  static BsPlayResult? _defaultInstance;

  /// string id = 1;
  @$pb.TagNumber(3)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(3)
  set result($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(3)
  void clearResult() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get win => $_getIZ(1);
  @$pb.TagNumber(4)
  set win($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasWin() => $_has(1);
  @$pb.TagNumber(4)
  void clearWin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get balance => $_getIZ(2);
  @$pb.TagNumber(5)
  set balance($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(5)
  void clearBalance() => clearField(5);
}

/// @tos_2003
/// 撤注 请求
class CancelArg extends $pb.GeneratedMessage {
  factory CancelArg() => create();
  CancelArg._() : super();
  factory CancelArg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CancelArg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CancelArg', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CancelArg clone() => CancelArg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CancelArg copyWith(void Function(CancelArg) updates) => super.copyWith((message) => updates(message as CancelArg)) as CancelArg;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelArg create() => CancelArg._();
  CancelArg createEmptyInstance() => create();
  static $pb.PbList<CancelArg> createRepeated() => $pb.PbList<CancelArg>();
  @$core.pragma('dart2js:noInline')
  static CancelArg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CancelArg>(create);
  static CancelArg? _defaultInstance;
}

/// @toc_2003
/// 撤注 响应结果
class CancelResult extends $pb.GeneratedMessage {
  factory CancelResult({
    $core.int? balance,
  }) {
    final $result = create();
    if (balance != null) {
      $result.balance = balance;
    }
    return $result;
  }
  CancelResult._() : super();
  factory CancelResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CancelResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CancelResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'balance', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CancelResult clone() => CancelResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CancelResult copyWith(void Function(CancelResult) updates) => super.copyWith((message) => updates(message as CancelResult)) as CancelResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelResult create() => CancelResult._();
  CancelResult createEmptyInstance() => create();
  static $pb.PbList<CancelResult> createRepeated() => $pb.PbList<CancelResult>();
  @$core.pragma('dart2js:noInline')
  static CancelResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CancelResult>(create);
  static CancelResult? _defaultInstance;

  @$pb.TagNumber(3)
  $core.int get balance => $_getIZ(0);
  @$pb.TagNumber(3)
  set balance($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);
}

class Bet extends $pb.GeneratedMessage {
  factory Bet({
    $core.int? index,
    $core.int? amount,
  }) {
    final $result = create();
    if (index != null) {
      $result.index = index;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  Bet._() : super();
  factory Bet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Bet', package: const $pb.PackageName(_omitMessageNames ? '' : 'ftproto'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Bet clone() => Bet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Bet copyWith(void Function(Bet) updates) => super.copyWith((message) => updates(message as Bet)) as Bet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bet create() => Bet._();
  Bet createEmptyInstance() => create();
  static $pb.PbList<Bet> createRepeated() => $pb.PbList<Bet>();
  @$core.pragma('dart2js:noInline')
  static Bet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bet>(create);
  static Bet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get amount => $_getIZ(1);
  @$pb.TagNumber(2)
  set amount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
