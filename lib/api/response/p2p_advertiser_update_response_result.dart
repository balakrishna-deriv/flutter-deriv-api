// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advertiser update response model class.
abstract class P2pAdvertiserUpdateResponseModel extends Equatable {
  /// Initializes P2p advertiser update response model class .
  const P2pAdvertiserUpdateResponseModel({
    this.p2pAdvertiserUpdate,
  });

  /// P2P advertiser information.
  final P2pAdvertiserUpdate? p2pAdvertiserUpdate;
}

/// P2p advertiser update response class.
class P2pAdvertiserUpdateResponse extends P2pAdvertiserUpdateResponseModel {
  /// Initializes P2p advertiser update response class.
  const P2pAdvertiserUpdateResponse({
    P2pAdvertiserUpdate? p2pAdvertiserUpdate,
  }) : super(
          p2pAdvertiserUpdate: p2pAdvertiserUpdate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdateResponse.fromJson(
    dynamic p2pAdvertiserUpdateJson,
  ) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdateJson == null
            ? null
            : P2pAdvertiserUpdate.fromJson(p2pAdvertiserUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserUpdate != null) {
      resultMap['p2p_advertiser_update'] = p2pAdvertiserUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Updates the information of the P2P (peer to peer) advertiser for the current account.
  /// Can only be used by an approved P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserUpdateRequest].
  static Future<P2pAdvertiserUpdateResponse> updateAdvertiser(
    P2pAdvertiserUpdateRequest request,
  ) async {
    final P2pAdvertiserUpdateReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserUpdateResponse.fromJson(response.p2pAdvertiserUpdate);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserUpdateResponse copyWith({
    P2pAdvertiserUpdate? p2pAdvertiserUpdate,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// P2p advertiser update model class.
abstract class P2pAdvertiserUpdateModel extends Equatable {
  /// Initializes P2p advertiser update model class .
  const P2pAdvertiserUpdateModel({
    required this.totalTurnover,
    required this.totalOrdersCount,
    required this.showName,
    required this.sellOrdersCount,
    required this.sellOrdersAmount,
    required this.paymentInfo,
    required this.partnerCount,
    required this.name,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.favourited,
    required this.defaultAdvertDescription,
    required this.createdTime,
    required this.contactInfo,
    required this.chatUserId,
    required this.chatToken,
    required this.cancelsRemaining,
    required this.buyOrdersCount,
    required this.buyOrdersAmount,
    required this.basicVerification,
    required this.balanceAvailable,
    this.advertRates,
    this.blockedUntil,
    this.buyCompletionRate,
    this.buyTimeAvg,
    this.cancelTimeAvg,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.firstName,
    this.lastName,
    this.maxOrderAmount,
    this.minBalance,
    this.minOrderAmount,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.totalCompletionRate,
  });

  /// Total order volume since advertiser registration.
  final String totalTurnover;

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool showName;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// Sell order volume in the past 30 days.
  final String sellOrdersAmount;

  /// Advertiser's payment information.
  final String paymentInfo;

  /// Number of different users the advertiser has traded with since registration.
  final int partnerCount;

  /// The advertiser's displayed name.
  final String name;

  /// Indicates if the advertiser's active adverts are listed. When `false`, adverts won't be listed regardless if they are active or not.
  final bool isListed;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// The advertiser's identification number.
  final String id;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// Number of other users who have favourited this advertiser.
  final int favourited;

  /// Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The epoch time that the client became an advertiser.
  final DateTime createdTime;

  /// Advertiser's contact information.
  final String contactInfo;

  /// The unique identifier for the chat user.
  final String chatUserId;

  /// The token to be used for authenticating the client for chat.
  final String chatToken;

  /// The number of times the user may cancel orders before being temporarily blocked.
  final int cancelsRemaining;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Buy order volume in the past 30 days.
  final String buyOrdersAmount;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double balanceAvailable;

  /// Average difference of advert rate compared to the market rate over the past 30 days.
  final double? advertRates;

  /// If a temporary bar was placed, this is the epoch time at which it will end.
  final DateTime? blockedUntil;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to make payment as a buyer within the past 30 days.
  final int? buyTimeAvg;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int? cancelTimeAvg;

  /// Total value of P2P buy transactions in the past 24 hours.
  final String? dailyBuy;

  /// Maximum allowed value of P2P buy transactions in a 24 hour period.
  final String? dailyBuyLimit;

  /// Total value of P2P sell transactions in the past 24 hours.
  final String? dailySell;

  /// Maximum allowed value of P2P sell transactions in a 24 hour period.
  final String? dailySellLimit;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

  /// Maximum order amount for adverts.
  final String? maxOrderAmount;

  /// Sell ads will be hidden when your available balance or remaining daily sell limit falls beneath this value.
  final String? minBalance;

  /// Minimum order amount for adverts.
  final String? minOrderAmount;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int? releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double? sellCompletionRate;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;
}

/// P2p advertiser update class.
class P2pAdvertiserUpdate extends P2pAdvertiserUpdateModel {
  /// Initializes P2p advertiser update class.
  const P2pAdvertiserUpdate({
    required double balanceAvailable,
    required bool basicVerification,
    required String buyOrdersAmount,
    required int buyOrdersCount,
    required int cancelsRemaining,
    required String chatToken,
    required String chatUserId,
    required String contactInfo,
    required DateTime createdTime,
    required String defaultAdvertDescription,
    required int favourited,
    required bool fullVerification,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required int partnerCount,
    required String paymentInfo,
    required String sellOrdersAmount,
    required int sellOrdersCount,
    required bool showName,
    required int totalOrdersCount,
    required String totalTurnover,
    double? advertRates,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? firstName,
    String? lastName,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
  }) : super(
          balanceAvailable: balanceAvailable,
          basicVerification: basicVerification,
          buyOrdersAmount: buyOrdersAmount,
          buyOrdersCount: buyOrdersCount,
          cancelsRemaining: cancelsRemaining,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          defaultAdvertDescription: defaultAdvertDescription,
          favourited: favourited,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          partnerCount: partnerCount,
          paymentInfo: paymentInfo,
          sellOrdersAmount: sellOrdersAmount,
          sellOrdersCount: sellOrdersCount,
          showName: showName,
          totalOrdersCount: totalOrdersCount,
          totalTurnover: totalTurnover,
          advertRates: advertRates,
          blockedUntil: blockedUntil,
          buyCompletionRate: buyCompletionRate,
          buyTimeAvg: buyTimeAvg,
          cancelTimeAvg: cancelTimeAvg,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          firstName: firstName,
          lastName: lastName,
          maxOrderAmount: maxOrderAmount,
          minBalance: minBalance,
          minOrderAmount: minOrderAmount,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdate(
        balanceAvailable: getDouble(json['balance_available'])!,
        basicVerification: getBool(json['basic_verification'])!,
        buyOrdersAmount: json['buy_orders_amount'],
        buyOrdersCount: json['buy_orders_count'],
        cancelsRemaining: json['cancels_remaining'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        defaultAdvertDescription: json['default_advert_description'],
        favourited: json['favourited'],
        fullVerification: getBool(json['full_verification'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        name: json['name'],
        partnerCount: json['partner_count'],
        paymentInfo: json['payment_info'],
        sellOrdersAmount: json['sell_orders_amount'],
        sellOrdersCount: json['sell_orders_count'],
        showName: getBool(json['show_name'])!,
        totalOrdersCount: json['total_orders_count'],
        totalTurnover: json['total_turnover'],
        advertRates: getDouble(json['advert_rates']),
        blockedUntil: getDateTime(json['blocked_until']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyTimeAvg: json['buy_time_avg'],
        cancelTimeAvg: json['cancel_time_avg'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        maxOrderAmount: json['max_order_amount'],
        minBalance: json['min_balance'],
        minOrderAmount: json['min_order_amount'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_available'] = balanceAvailable;
    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_orders_amount'] = buyOrdersAmount;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['cancels_remaining'] = cancelsRemaining;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['favourited'] = favourited;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['name'] = name;
    resultMap['partner_count'] = partnerCount;
    resultMap['payment_info'] = paymentInfo;
    resultMap['sell_orders_amount'] = sellOrdersAmount;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['show_name'] = showName;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['total_turnover'] = totalTurnover;
    resultMap['advert_rates'] = advertRates;
    resultMap['blocked_until'] = getSecondsSinceEpochDateTime(blockedUntil);
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_time_avg'] = buyTimeAvg;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['min_balance'] = minBalance;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserUpdate copyWith({
    required double balanceAvailable,
    required bool basicVerification,
    required String buyOrdersAmount,
    required int buyOrdersCount,
    required int cancelsRemaining,
    required String chatToken,
    required String chatUserId,
    required String contactInfo,
    required DateTime createdTime,
    required String defaultAdvertDescription,
    required int favourited,
    required bool fullVerification,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required int partnerCount,
    required String paymentInfo,
    required String sellOrdersAmount,
    required int sellOrdersCount,
    required bool showName,
    required int totalOrdersCount,
    required String totalTurnover,
    double? advertRates,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? firstName,
    String? lastName,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
  }) =>
      P2pAdvertiserUpdate(
        balanceAvailable: balanceAvailable,
        basicVerification: basicVerification,
        buyOrdersAmount: buyOrdersAmount,
        buyOrdersCount: buyOrdersCount,
        cancelsRemaining: cancelsRemaining,
        chatToken: chatToken,
        chatUserId: chatUserId,
        contactInfo: contactInfo,
        createdTime: createdTime,
        defaultAdvertDescription: defaultAdvertDescription,
        favourited: favourited,
        fullVerification: fullVerification,
        id: id,
        isApproved: isApproved,
        isListed: isListed,
        name: name,
        partnerCount: partnerCount,
        paymentInfo: paymentInfo,
        sellOrdersAmount: sellOrdersAmount,
        sellOrdersCount: sellOrdersCount,
        showName: showName,
        totalOrdersCount: totalOrdersCount,
        totalTurnover: totalTurnover,
        advertRates: advertRates ?? this.advertRates,
        blockedUntil: blockedUntil ?? this.blockedUntil,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyTimeAvg: buyTimeAvg ?? this.buyTimeAvg,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minBalance: minBalance ?? this.minBalance,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}