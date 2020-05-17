import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contains information about contract cancellation option.
class CancellationInfoModel {
  /// Initializes
  CancellationInfoModel(this.askPrice, this.dateExpiry);

  /// Generate an instance from JSON
  factory CancellationInfoModel.fromJson(Map<String, dynamic> json) =>
      CancellationInfoModel(
        json['ask_price'],
        getDateTime(json['date_expiry']),
      );

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;

  /// Generate a copy of instance with given parameters
  CancellationInfoModel copyWith({
    double askPrice,
    DateTime dateExpiry,
  }) =>
      CancellationInfoModel(
        askPrice ?? this.askPrice,
        dateExpiry ?? this.dateExpiry,
      );
}