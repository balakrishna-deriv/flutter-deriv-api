/// Autogenerated from flutter_deriv_api|lib/api/sell_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sell_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellRequest {
  SellRequest();
  factory SellRequest.fromJson(Map<String, dynamic> json) =>
      _$SellRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SellRequestToJson(this);

  // Properties
  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  Map<String, dynamic> passthrough;

  /// Minimum price at which to sell the contract, or '0' for 'sell at market'
  num price;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Pass contract_id received from the Portfolio call
  int sell;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}