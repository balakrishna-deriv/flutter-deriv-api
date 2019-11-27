/// Autogenerated from flutter_deriv_api|lib/api/active_symbols_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'active_symbols_receive.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ActiveSymbolsResponse {
  ActiveSymbolsResponse();
  factory ActiveSymbolsResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveSymbolsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveSymbolsResponseToJson(this);

  // Properties
  /// List of active symbols.
  List<Map<String, dynamic>> activeSymbols;

  /// Echo of the request made.
  Map<String, dynamic> echoReq;

  /// Action name of the request made.
  String msgType;

  /// Optional field sent in request to map to response, present only when request contains req_id.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}