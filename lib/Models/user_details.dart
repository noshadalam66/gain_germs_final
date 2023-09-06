class UserResponse {
  CustomerData? customerData;
  int responseCode = 0;
  String responseMessage = "";

  UserResponse({this.customerData, required this.responseCode, required this.responseMessage});

  UserResponse.fromJson(Map<String, dynamic> json) {
    customerData = json['customerData'] != null ? CustomerData.fromJson(json['customerData']) : null;
    responseCode = json['responseCode'];
    responseMessage = json['responseMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final customerData = this.customerData;
    if (customerData != null) {
      data['customerData'] = customerData.toJson();
    }
    data['responseCode'] = this.responseCode;
    data['responseMessage'] = this.responseMessage;
    return data;
  }
}

class CustomerData {
  List<Deposits>? deposits;
  List<Lotteries>? lotteries;
  List<Referrals>? referrals;
  List<Withdrawls>? withdrawls;
  List<ActivityTimelinee>? activityTimeline;

  String? pointsEarnByComingOnline;
  String? pointsEarnBySpin;
  String? pointsEarnByContract;
  String? pointsEarnByLottery;
  String? pointsEarnByGame;
  String? pointsEarnByReferral;
  String? userLevel;
  String? userLevelPoints;
  String? totalPlayedLottery;
  String? totalGameWon;
  String? totalGameLost;
  String? totalSpinRolled;
  String? rollTime;
  String? smartContractTime;
  String? totalSignedContract;
  String? gameAttemptRemaining;
  String? totalGainsEarnFromLottery;
  String? totalGainsEarnFromGame;
  String? totalGainsEarnFromSpin;
  String? totalGainsEarnFromReferral;
  String? totalGainsEarnFromContract;
  String? totalGains;
  String? availableGains;

  String? withdrawnGains;

  String? pendingGains;
  String? gainsEarnByLevel;
  String? holdingGains;
  String? totalGamePlayed;
  String? adsWatchedForGame;
  String? adsWatchedForSpin;
  String? adsWatchedForContract;
  String? totalVideoWatched;
  String? winningGains;
  String? rollNumber;
  String? depositedGains;
  String? totalOperations;
  String? yourTicket;
  String? lotteryId;
  String? ticketPrice;
  String? drawDate;
  String? total_ticket;
  String? levelAward;
  String? soldOut;
  String? gainPrice;
  String? remainingTicket;
  String? minimumGainsToWithdraw;
  String? id;
  String? fullName;
  String? email;
  String? verifyEmail;
  String? countryCode;
  String? contactNumber;
  String? verifyContact;
  String? area;
  String? gender;
  String? dob;
  String? avatar;
  String? createdAt;
  String? accessToken;
  String? refCode;
  String? refBy;
  String? noOfReferrals;
  String? totalWithdrawalsAmount;
  String? lastLogin;
  String? lastOnline;
  String? pendingReferrals;


  CustomerData(
      {this.deposits,
        this.lotteries,
        this.referrals,
        this.withdrawls,
        this.activityTimeline,
        this.pointsEarnByComingOnline,
        this.pointsEarnBySpin,
        this.pointsEarnByContract,
        this.pointsEarnByLottery,
        this.pointsEarnByGame,
        this.pointsEarnByReferral,
        this.userLevel,
        this.userLevelPoints,
        this.totalPlayedLottery,
        this.totalGameWon,
        this.totalGameLost,
        this.totalSpinRolled,
        this.rollTime,
        this.smartContractTime,
        this.totalSignedContract,
        this.gameAttemptRemaining,
        this.totalGainsEarnFromLottery,
        this.totalGainsEarnFromGame,
        this.totalGainsEarnFromSpin,
        this.totalGainsEarnFromReferral,
        this.totalGainsEarnFromContract,
        this.totalGains,
        this.availableGains,
        this.withdrawnGains,
        this.pendingGains,
        this.gainsEarnByLevel,
        this.holdingGains,
        this.totalGamePlayed,
        this.adsWatchedForGame,
        this.adsWatchedForSpin,
        this.adsWatchedForContract,
        this.totalVideoWatched,
        this.winningGains,
        this.rollNumber,
        this.depositedGains,
        this.totalOperations,
        this.yourTicket,
        this.lotteryId,
        this.ticketPrice,
        this.drawDate,
        this.total_ticket,
        this.levelAward,
        this.soldOut,
        this.gainPrice,
        this.remainingTicket,
        this.minimumGainsToWithdraw,
        this.id,
        this.fullName,
        this.email,
        this.verifyEmail,
        this.countryCode,
        this.contactNumber,
        this.verifyContact,
        this.area,
        this.gender,
        this.dob,
        this.avatar,
        this.createdAt,
        this.accessToken,
        this.refCode,
        this.refBy,
        this.noOfReferrals,
        this.totalWithdrawalsAmount,
        this.lastLogin,
        this.lastOnline,
        this.pendingReferrals});

  CustomerData.fromJson(Map<String, dynamic> json) {
    if (json['deposits'] != null) {
      deposits = <Deposits>[];
      json['deposits'].forEach((v) {
        deposits?.add(new Deposits.fromJson(v));
      });
    }
    if (json['lotteries'] != null) {
      lotteries = <Lotteries>[];
      json['lotteries'].forEach((v) {
        lotteries?.add(new Lotteries.fromJson(v));
      });
    }
    if (json['referrals'] != null) {
      referrals = <Referrals>[];
      json['referrals'].forEach((v) {
        referrals?.add(new Referrals.fromJson(v));
      });
    }
    if (json['withdrawls'] != null) {
      withdrawls = <Withdrawls>[];
      json['withdrawls'].forEach((v) {
        withdrawls?.add(new Withdrawls.fromJson(v));
      });
    }

    if (json['activityTimeline'] != null) {
      activityTimeline = <ActivityTimelinee>[];
      json['activityTimeline'].forEach((v) {
        activityTimeline?.add(new ActivityTimelinee.fromJson(v));
      });
    }

    pointsEarnByComingOnline = json['points_earn_by_coming_online'];
    pointsEarnBySpin = json['points_earn_by_spin'];
    pointsEarnByContract = json['points_earn_by_contract'];
    pointsEarnByLottery = json['points_earn_by_lottery'];
    pointsEarnByGame = json['points_earn_by_game'];
    pointsEarnByReferral = json['points_earn_by_referral'];
    userLevel = json['user_level'];
    userLevelPoints = json['user_level_points'];
    totalPlayedLottery = json['total_played_lottery'];
    totalGameWon = json['total_game_won'];
    totalGameLost = json['total_game_lost'];
    totalSpinRolled = json['total_spin_rolled'];
    rollTime = json['roll_time'];
    smartContractTime = json['smart_contract_time'];
    totalSignedContract = json['total_signed_contract'];
    gameAttemptRemaining = json['game_attempt_remaining'];
    totalGainsEarnFromLottery = json['total_gains_earn_from_lottery'];
    totalGainsEarnFromGame = json['total_gains_earn_from_game'];
    totalGainsEarnFromSpin = json['total_gains_earn_from_spin'];
    totalGainsEarnFromReferral = json['total_gains_earn_from_referral'];
    totalGainsEarnFromContract = json['total_gains_earn_from_contract'];
    totalGains = json['total_gains'];
    availableGains = json['available_gains'];
    withdrawnGains = json['withdrawn_gains'];
    pendingGains = json['pending_gains'];
    gainsEarnByLevel = json['gains_earn_by_level'];
    holdingGains = json['holding_gains'];
    totalGamePlayed = json['total_game_played'];
    adsWatchedForGame = json['ads_watched_for_game'];
    adsWatchedForSpin = json['ads_watched_for_spin'];
    adsWatchedForContract = json['ads_watched_for_contract'];
    totalVideoWatched = json['total_video_watched'];
    winningGains = json['winning_gains'];
    rollNumber = json['roll_number'];
    depositedGains = json['depositedGains'];
    totalOperations = json['totalOperations'];
    yourTicket = json['your_ticket'];
    lotteryId = json['lottery_id'];
    ticketPrice = json['ticket_price'];
    drawDate = json['drawDate'];
    total_ticket = json['total_ticket'];
    levelAward = json['level_award'];
    soldOut = json['soldOut'];
    gainPrice = json['gainPrice'];
    remainingTicket = json['remainingTicket'];
    minimumGainsToWithdraw = json['minimumGainsToWithdraw'];
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    verifyEmail = json['verify_email'];
    countryCode = json['country_code'];
    contactNumber = json['contact_number'];
    verifyContact = json['verify_contact'];
    area = json['area'];
    gender = json['gender'];
    dob = json['dob'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    accessToken = json['access_token'];
    refCode = json['ref_code'];
    refBy = json['ref_by'];
    noOfReferrals = json['no_of_referrals'];
    totalWithdrawalsAmount = json['total_withdrawals_amount'];
    lastLogin = json['last_login'];
    lastOnline = json['last_online'];
    pendingReferrals = json['pending_referrals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    final deposits = this.deposits;
    if (deposits != null) {
      data['deposits'] = deposits.map((v) => v.toJson()).toList();
    }
    final lotteries = this.lotteries;
    if (lotteries != null) {
      data['lotteries'] = lotteries.map((v) => v.toJson()).toList();
    }
    final referrals = this.referrals;
    if (referrals != null) {
      data['referrals'] = referrals.map((v) => v.toJson()).toList();
    }
    final withdrawls = this.withdrawls;
    if (withdrawls != null) {
      data['withdrawls'] = withdrawls.map((v) => v.toJson()).toList();
    }
    final activityTimeline = this.activityTimeline;
    if (activityTimeline != null) {
      data['activityTimeline'] = activityTimeline.map((v) => v.toJson()).toList();
    }
    data['points_earn_by_coming_online'] = this.pointsEarnByComingOnline;
    data['points_earn_by_spin'] = this.pointsEarnBySpin;
    data['points_earn_by_contract'] = this.pointsEarnByContract;
    data['points_earn_by_lottery'] = this.pointsEarnByLottery;
    data['points_earn_by_game'] = this.pointsEarnByGame;
    data['points_earn_by_referral'] = this.pointsEarnByReferral;
    data['user_level'] = this.userLevel;
    data['user_level_points'] = this.userLevelPoints;
    data['total_played_lottery'] = this.totalPlayedLottery;
    data['total_game_won'] = this.totalGameWon;
    data['total_game_lost'] = this.totalGameLost;
    data['total_spin_rolled'] = this.totalSpinRolled;
    data['roll_time'] = this.rollTime;
    data['smart_contract_time'] = this.smartContractTime;
    data['total_signed_contract'] = this.totalSignedContract;
    data['game_attempt_remaining'] = this.gameAttemptRemaining;
    data['total_gains_earn_from_lottery'] = this.totalGainsEarnFromLottery;
    data['total_gains_earn_from_game'] = this.totalGainsEarnFromGame;
    data['total_gains_earn_from_spin'] = this.totalGainsEarnFromSpin;
    data['total_gains_earn_from_referral'] = this.totalGainsEarnFromReferral;
    data['total_gains_earn_from_contract'] = this.totalGainsEarnFromContract;
    data['total_gains'] = this.totalGains;
    data['available_gains'] = this.availableGains;
    data['withdrawn_gains'] = this.withdrawnGains;
    data['pending_gains'] = this.pendingGains;
    data['gains_earn_by_level'] = this.gainsEarnByLevel;
    data['holding_gains'] = this.holdingGains;
    data['total_game_played'] = this.totalGamePlayed;
    data['ads_watched_for_game'] = this.adsWatchedForGame;
    data['ads_watched_for_spin'] = this.adsWatchedForSpin;
    data['ads_watched_for_contract'] = this.adsWatchedForContract;
    data['total_video_watched'] = this.totalVideoWatched;
    data['winning_gains'] = this.winningGains;
    data['roll_number'] = this.rollNumber;
    data['depositedGains'] = this.depositedGains;
    data['totalOperations'] = this.totalOperations;
    data['your_ticket'] = this.yourTicket;
    data['lottery_id'] = this.lotteryId;
    data['ticket_price'] = this.ticketPrice;
    data['drawDate'] = this.drawDate;
    data['total_ticket'] = this.total_ticket;
    data['level_award'] = this.levelAward;
    data['soldOut'] = this.soldOut;
    data['gainPrice'] = this.gainPrice;
    data['remainingTicket'] = this.remainingTicket;
    data['minimumGainsToWithdraw'] = this.minimumGainsToWithdraw;
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['verify_email'] = this.verifyEmail;
    data['country_code'] = this.countryCode;
    data['contact_number'] = this.contactNumber;
    data['verify_contact'] = this.verifyContact;
    data['area'] = this.area;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['avatar'] = this.avatar;
    data['created_at'] = this.createdAt;
    data['access_token'] = this.accessToken;
    data['ref_code'] = this.refCode;
    data['ref_by'] = this.refBy;
    data['no_of_referrals'] = this.noOfReferrals;
    data['total_withdrawals_amount'] = this.totalWithdrawalsAmount;
    data['last_login'] = this.lastLogin;
    data['last_online'] = this.lastOnline;
    data['pending_referrals'] = this.pendingReferrals;
    return data;
  }
}

class Deposits {
  String? transactionId;
  String? depositAmount;
  String? depositGains;
  String? depositCurrency;
  String? depositTime;

  Deposits(
      {this.transactionId,
        this.depositAmount,
        this.depositGains,
        this.depositCurrency,
        this.depositTime});

  Deposits.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    depositAmount = json['depositAmount'];
    depositGains = json['depositGains'];
    depositCurrency = json['depositCurrency'];
    depositTime = json['depositTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['depositAmount'] = this.depositAmount;
    data['depositGains'] = this.depositGains;
    data['depositCurrency'] = this.depositCurrency;
    data['depositTime'] = this.depositTime;
    return data;
  }
}

class Lotteries {
  String? ticketNo;
  String? winnerPosition;
  String? winnerAmount;
  String? createdAt;

  Lotteries(
      {this.ticketNo, this.winnerPosition, this.winnerAmount, this.createdAt});

  Lotteries.fromJson(Map<String, dynamic> json) {
    ticketNo = json['ticket_no'];
    winnerPosition = json['winnerPosition'];
    winnerAmount = json['winnerAmount'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_no'] = this.ticketNo;
    data['winnerPosition'] = this.winnerPosition;
    data['winnerAmount'] = this.winnerAmount;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Referrals {
  String? fullName;
  String? userLevel;
  String? userLevelPoints;
  String? lastLogin;

  Referrals(
      {this.fullName, this.userLevel, this.userLevelPoints, this.lastLogin});

  Referrals.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    userLevel = json['user_level'];
    userLevelPoints = json['user_level_points'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['user_level'] = this.userLevel;
    data['user_level_points'] = this.userLevelPoints;
    data['last_login'] = this.lastLogin;
    return data;
  }
}

class Withdrawls {
  String? withdrawGains;
  String? withdrawAmount;
  String? withdrawDate;
  String? withdrawStatus;
  String? gainsPrice;
  String? withdrawProceedDate;
  String? paymentMethod;
  String? paymentToAccount;
  String? transactionId;
  String? withdrawFeesPercent;
  String? withdrawFeesAmount;

  Withdrawls(
      {this.withdrawGains,
        this.withdrawAmount,
        this.withdrawDate,
        this.withdrawStatus,
        this.gainsPrice,
        this.withdrawProceedDate,
        this.paymentMethod,
        this.paymentToAccount,
        this.transactionId,
        this.withdrawFeesPercent,
        this.withdrawFeesAmount});

  Withdrawls.fromJson(Map<String, dynamic> json) {
    withdrawGains = json['withdraw_gains'];
    withdrawAmount = json['withdraw_amount'];
    withdrawDate = json['withdraw_date'];
    withdrawStatus = json['withdraw_status'];
    gainsPrice = json['gains_price'];
    withdrawProceedDate = json['withdraw_proceed_date'];
    paymentMethod = json['payment_method'];
    paymentToAccount = json['payment_to_account'];
    transactionId = json['transaction_id'];
    withdrawFeesPercent = json['withdraw_fees_percent'];
    withdrawFeesAmount = json['withdraw_fees_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['withdraw_gains'] = this.withdrawGains;
    data['withdraw_amount'] = this.withdrawAmount;
    data['withdraw_date'] = this.withdrawDate;
    data['withdraw_status'] = this.withdrawStatus;
    data['gains_price'] = this.gainsPrice;
    data['withdraw_proceed_date'] = this.withdrawProceedDate;
    data['payment_method'] = this.paymentMethod;
    data['payment_to_account'] = this.paymentToAccount;
    data['transaction_id'] = this.transactionId;
    data['withdraw_fees_percent'] = this.withdrawFeesPercent;
    data['withdraw_fees_amount'] = this.withdrawFeesAmount;
    return data;
  }
}


class ActivityTimelinee {
  String? titleDescription;
  String? activityTime;

  ActivityTimelinee(
      {this.titleDescription,
        this.activityTime});

  ActivityTimelinee.fromJson(Map<String, dynamic> json) {
    titleDescription = json['title_description'];
    activityTime = json['activity_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title_description'] = this.titleDescription;
    data['activity_time'] = this.activityTime;
    return data;
  }

}
