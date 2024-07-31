//
//  Generated code. Do not modify.
//  source: protos/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userInfoArgDescriptor instead')
const UserInfoArg$json = {
  '1': 'UserInfoArg',
};

/// Descriptor for `UserInfoArg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoArgDescriptor = $convert.base64Decode(
    'CgtVc2VySW5mb0FyZw==');

@$core.Deprecated('Use userInfoResultDescriptor instead')
const UserInfoResult$json = {
  '1': 'UserInfoResult',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'balance', '3': 3, '4': 1, '5': 13, '10': 'balance'},
    {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `UserInfoResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoResultDescriptor = $convert.base64Decode(
    'Cg5Vc2VySW5mb1Jlc3VsdBIXCgd1c2VyX2lkGAEgASgNUgZ1c2VySWQSEgoEbmFtZRgCIAEoCV'
    'IEbmFtZRIYCgdiYWxhbmNlGAMgASgNUgdiYWxhbmNlEhIKBGljb24YBCABKAlSBGljb24=');

@$core.Deprecated('Use fruitPlayArgDescriptor instead')
const FruitPlayArg$json = {
  '1': 'FruitPlayArg',
  '2': [
    {'1': 'flag', '3': 1, '4': 1, '5': 9, '10': 'flag'},
    {'1': 'fruits', '3': 2, '4': 3, '5': 11, '6': '.ftproto.Bet', '10': 'fruits'},
  ],
};

/// Descriptor for `FruitPlayArg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fruitPlayArgDescriptor = $convert.base64Decode(
    'CgxGcnVpdFBsYXlBcmcSEgoEZmxhZxgBIAEoCVIEZmxhZxIkCgZmcnVpdHMYAiADKAsyDC5mdH'
    'Byb3RvLkJldFIGZnJ1aXRz');

@$core.Deprecated('Use fruitPlayResultDescriptor instead')
const FruitPlayResult$json = {
  '1': 'FruitPlayResult',
  '2': [
    {'1': 'lights', '3': 1, '4': 3, '5': 13, '10': 'lights'},
    {'1': 'fruits', '3': 2, '4': 3, '5': 11, '6': '.ftproto.Bet', '10': 'fruits'},
    {'1': 'odds', '3': 3, '4': 1, '5': 13, '10': 'odds'},
    {'1': 'part', '3': 4, '4': 3, '5': 11, '6': '.ftproto.Bet', '10': 'part'},
    {'1': 'win', '3': 5, '4': 1, '5': 13, '10': 'win'},
    {'1': 'balance', '3': 6, '4': 1, '5': 13, '10': 'balance'},
  ],
};

/// Descriptor for `FruitPlayResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fruitPlayResultDescriptor = $convert.base64Decode(
    'Cg9GcnVpdFBsYXlSZXN1bHQSFgoGbGlnaHRzGAEgAygNUgZsaWdodHMSJAoGZnJ1aXRzGAIgAy'
    'gLMgwuZnRwcm90by5CZXRSBmZydWl0cxISCgRvZGRzGAMgASgNUgRvZGRzEiAKBHBhcnQYBCAD'
    'KAsyDC5mdHByb3RvLkJldFIEcGFydBIQCgN3aW4YBSABKA1SA3dpbhIYCgdiYWxhbmNlGAYgAS'
    'gNUgdiYWxhbmNl');

@$core.Deprecated('Use bsPlayArgDescriptor instead')
const BsPlayArg$json = {
  '1': 'BsPlayArg',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    {'1': 'amount', '3': 2, '4': 1, '5': 13, '10': 'amount'},
  ],
};

/// Descriptor for `BsPlayArg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bsPlayArgDescriptor = $convert.base64Decode(
    'CglCc1BsYXlBcmcSFAoFaW5kZXgYASABKA1SBWluZGV4EhYKBmFtb3VudBgCIAEoDVIGYW1vdW'
    '50');

@$core.Deprecated('Use bsPlayResultDescriptor instead')
const BsPlayResult$json = {
  '1': 'BsPlayResult',
  '2': [
    {'1': 'result', '3': 3, '4': 1, '5': 13, '10': 'result'},
    {'1': 'win', '3': 4, '4': 1, '5': 13, '10': 'win'},
    {'1': 'balance', '3': 5, '4': 1, '5': 13, '10': 'balance'},
  ],
};

/// Descriptor for `BsPlayResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bsPlayResultDescriptor = $convert.base64Decode(
    'CgxCc1BsYXlSZXN1bHQSFgoGcmVzdWx0GAMgASgNUgZyZXN1bHQSEAoDd2luGAQgASgNUgN3aW'
    '4SGAoHYmFsYW5jZRgFIAEoDVIHYmFsYW5jZQ==');

@$core.Deprecated('Use cancelArgDescriptor instead')
const CancelArg$json = {
  '1': 'CancelArg',
};

/// Descriptor for `CancelArg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelArgDescriptor = $convert.base64Decode(
    'CglDYW5jZWxBcmc=');

@$core.Deprecated('Use cancelResultDescriptor instead')
const CancelResult$json = {
  '1': 'CancelResult',
  '2': [
    {'1': 'balance', '3': 3, '4': 1, '5': 13, '10': 'balance'},
  ],
};

/// Descriptor for `CancelResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelResultDescriptor = $convert.base64Decode(
    'CgxDYW5jZWxSZXN1bHQSGAoHYmFsYW5jZRgDIAEoDVIHYmFsYW5jZQ==');

@$core.Deprecated('Use betDescriptor instead')
const Bet$json = {
  '1': 'Bet',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    {'1': 'amount', '3': 2, '4': 1, '5': 13, '10': 'amount'},
  ],
};

/// Descriptor for `Bet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List betDescriptor = $convert.base64Decode(
    'CgNCZXQSFAoFaW5kZXgYASABKA1SBWluZGV4EhYKBmFtb3VudBgCIAEoDVIGYW1vdW50');

