/// Autogenerated from flutter_deriv_api|lib/api/app_delete_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'app_delete_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppDeleteRequest {
  AppDeleteRequest();
  factory AppDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$AppDeleteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AppDeleteRequestToJson(this);

  // Properties
  /// Application app_id
  int appDelete;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}