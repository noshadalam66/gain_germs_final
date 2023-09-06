import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Models/commonmodel.dart';



showAlertDialog(BuildContext context, String title, String msg) {
  Alert(
    // image: Image.asset("assets/success.png"),
    context: context,
    // type: AlertType.error,
    title: title,
    desc: msg,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}

getCurrentLanguage() {
  if ((getUserCurrentLanguageInMemory() == "en_US" ||
      getUserCurrentLanguageInMemory() == null ||
      getUserCurrentLanguageInMemory().toString().isEmpty)) {
    return "en";
  } else {
    return "ar";
  }
}

class AppConstant {
  static int selectedIndex = 0; //using to change drawer selected menu item color
  static double openedDrawerWidth = 250.0;




  static bool isFromSmartButton = false;
  static const double absherEquivalent = 22.543;
  static int idealTimeout = 840000; //MILISECONDS 14MINT
  static const int serviceTimeout = 60;
  static const int dobServiceTimeout = 120;
  static const String channelId = "OMB";
  static const String traceId = "Trace-Id";
  static String qibCustomerCareMobileNo = "0097444448444";

  static List<String> sslPiningFingerPrint = [
    "DE:3F:4D:05:D9:D4:A2:39:EF:C0:C6:15:80:E6:7B:F1:B4:4E:0C:2E:D0:B6:63:82:59:F0:78:B7:67:26:2A:96",
    "8B:E0:3A:12:51:C8:03:EE:19:20:85:02:2A:72:2A:8A:6A:2B:78:E7:01:B2:BA:90:26:93:CD:B4:A5:EC:63:61"
  ];

  static String apiBaseUrl = "https://qibretailmbuat.qib.com.qa/api/"; //UAT
  // static String apiBaseUrl = "https://qibrmbsit.qib.com.qa/"; //SIT

// "https://mbomniuat.qib.com.qa/rmbdev/"; RMBDEV

  //prod= "https://retailapp.qib.com.qa/";
  //uat= "https://qibretailmbuat.qib.com.qa/";
  //sit ="https://qibretailmbsit.qib.com.qa/";
  //sit ="https://qibrmbsit.qib.com.qa/";

  //static String deliveryNotification = "api/proxy/cgi/v1/update/notification/delivery?notificationId=";


  ///WU Constants - Cancellation
  static const String REFUND_SEARCH_FAILED =
      "cancellation request has not been processed, please try again later";
  static const String REFUND_STORE_FAILED =
      "cancellation request has not been processed, please try again after 10 mins";
  static const String PICK_UP_VALIDATE_FAILED =
      "cancellation request completed and refund is under process";
  static const String PICK_UP_STORE_FAILED =
      "cancellation request completed and refund is under process";
  static const String CANCELLATION_SUCCESSFUL =
      "cancellation successful, principle amount credited to your account";
  static const String CANCELLED = "cancelled";

  ///WU Constants - Amendment
  static const String AML_FAILED =
      "beneficiary name update has not been processed";
  static const String COOLING_PERIOD = "beneficiary name update under process";
  static const String SEARCH_FAILED =
      "western union cannot process the beneficiary name update";
  static const String STORE_FAILED =
      "western union cannot process the beneficiary name update";
  static const String BENEFICIARY_UPDATE = "name changed";

  static String getApiVersion = "auth/public/mobile/version";
  static String checkAman = "aggregator/isAmanUser";

  static String verifyCard = "auth/public/enroll/verify";
  static String initiatOTP = "auth/public/enroll/initiate";
  static String checkUserExist = "auth/public/validate/username?userName=";
  static String confirm = "auth/public/enroll/confirm";
  static String enroll = "auth/public/enroll";
  static String resentOTP = "auth/public/otp/resend";
  static String refreshToken = "auth/refreshToken";

  static String versionCheck =
      "portalserver/services/rest/v1/public/mobile/version";

  //BioMetric
  static String getAllDevices = "auth/mblogin/getAllDevices";
  static String getRecentLogsUpd = "auth/mblogin/getRecentLogsUpd";
  static String setDevicePrimary = "auth/mblogin/setPrimaryDevice";
  static String removeDevice = "auth/public/mblogin/removeDevice";
  static String deActivateDevice = "auth/public/mblogin/deActivateDevice";

  //LOGIN APIS
  static String login = "auth/public/mblogin"; //login";

  static String loginVerifyOTP = "auth/public/mblogin/verify"; //login/verify";
  static String enrollBiometricApi = "auth/public/mblogin/bioenroll";
  static String bioLogin = "auth/public/mblogin/bioLogin";
  static String logout = 'auth/public/logout';

  //SYSTEM Server TIME API
  static String serverTime = "aggregator/getSystemDate";

  //MY PRODUCTS APIS
  static String account = "proxy/customer/v1/account?status=ACTIVE";
  static String filterAccount = "proxy/customer/v1/getFilterAccounts";
  static String getCardProfileRist = "proxy/live/Cards/getCardProfileRist";
  static String cardImgData =
      "aggregator/public/getContents/cards/card-images/";
  static String cardStatusData =
      "aggregator/public/getContents/cards/cardStatusNew.json";
  static String getAllAccountBalancePreference =
      "proxy/customer/v1/account/balance/preference";

  static String getPrepaidCards =
      "aggregator/public/getContents/cards/prepaidCards.json";

  static String docUploadReason =
      "aggregator/public/getContents/marketplace/uploadDocReason.json";
  static String getTakaful =
      "qib-standing-order-service/v1/fs/create/sto?customerId=";

  //Account Overview
  static String getAccountTransactionHistory =
      "aggregator/Account/getAccountTransactionHistory";
  static String getDebitCardDetails = "proxy/live/Cards/getDebitCardDetails";

  static String getDebitCardByAccount = "proxy/live/Cards/cardsbyaccount";

  static String cardStatus = "proxy/live/Cards/status";
  static String acivateRenewCard = "proxy/live/Cards/activatecardrenewal";

  //Account Certificate Statement
  static String sendAccCertStatment =
      "proxy/customer/v1/account/sendAccountCertificate";

  //Salary Certificate Statement
  static String sendSalaryCertStatment =
      "proxy/customer/v1/account/sendSalaryCertificate";

  //Account Statment
  static String downloadStatment =
      "proxy/customer/v1/account/download/account-statement";

  //Save Receipt
  static String receiptPdfPayment = "proxy/cgi/v1/transaction/Payments/receipt";

  static String googleAppStoreUrl =
      "https://play.google.com/store/apps/details?id=com.pozitron.qib&hl=en&gl=US";
  static String appleAppStoreUrl =
      "https://apps.apple.com/qa/app/qib-mobile/id587428616";

  static String huaweiAppStoreUrl =
      'https://appgallery.cloud.huawei.com/marketshare/app/C102788351';

  static String googleAmanAppStoreUrl =
      "https://play.google.com/store/apps/details?id=com.qib.softtoken";
  static String appleAmanAppStoreUrl =
      "https://apps.apple.com/in/app/qib-aman/id771220873";

  //Home
  static String lastTransaction = "proxy/spend/v2/latest/activity";
  static String getHomeReward = "aggregator/Miscellaneous/accountInfo";
  static String getCustomerInfo = "proxy/customer/v1/customer";
  static String saveBalancePreference =
      "proxy/customer/v1/account/save/balance/preference";
  static String getCommunicationPrefferedLanguage =
      "proxy/cgi/v1/get/sms/preffered/language";
  static String setCommunicationPrefferedLanguage =
      "proxy/cgi/v1/sms/preffered/language";
  static String preferredUserAction =
      "aggregator/public/getContents/dashboard/mostUsedServices.json";
  static String tliConfig =
      "aggregator/public/getContents/cards/cardConfigs.json";

  //Most Use
  static String mostUsedAcc = "proxy/cgi/v1/most/used/accounts";
  static String mostUsedBeneficiaries = "proxy/cgi/v1/most/used/beneficiaries";
  static String getMostUsedCard = "proxy/cgi/v1/most/used/cards";

  static String contentRepository = "aggregator/public/getContents";

  static String fetchPreLoginOffers =
      "aggregator/public/getContents/offers/pre-login/pre_login_offers.json";

  static String exchangeRateForAuthPublic =
      "auth/public/v1/Account/getExchangeRates";
  static String exchangeRateForProxyLive =
      "proxy/live/Account/getExchangeRates";

  //BENEFICARY APIS
  static String validatePakistanIban =
      "proxy/corridor/v1/common/validateHBLAccount";

  static String getExchangeRate =
      "proxy/corridor/v1/common/getExchangeRates?currency=";
  static String transferDetails =
      "proxy/corridor/v1/remittance/getTransferDetails";
  static String transferInitiate =
      "aggregator/fund/transfer/init"; // "aggregator/fund/transfer/initiate";

  static String transferOTPGenerate = "auth/otp/generate";
  static String transferConfirm = "aggregator/fund/transfer/confirm";
  static String multipleLocalTransferConfirm =
      "aggregator/fund/transfer/multiple/confirm";
  static String getPurposeCode = "proxy/cgi/v1/common/purposecode";
  static String getCountryFeeUrl = "proxy/cgi/v1/common/countryListFee";
  static String currencyLimitUrl =
      "aggregator/public/getContents/transfer/curreny-limit.json";
  static String getCurrencyCodeForSelectedCountry =
      "proxy/ben/v1/beneficiary/currency/country/list?countryCode";
  static String getMostUsePayment = "proxy/cgi/v1/most/used/utilities";

  //WITH IN ACCOUNT APIS
  static String withInTransferInitiate =
      "aggregator/fund/transfer/within/initiate";
  static String withInTransferConfrim =
      "aggregator/fund/transfer/within/confirm";

  static String cashAdvancePayment = 'aggregator/cashAdvancePayment';

  //DIRECT REMIT APIS
  static String directRemitListOfCorridor =
      "proxy/corridor/v1/common/getCorridors";
  static String directRemitanceTransferDetails =
      "proxy/corridor/v1/remittance/getTransferDetails";
  static String directRemitTransferInitiate =
      "proxy/corridor/v1/remittance/initiate"; //"proxy/corridor/v1/common/initiateTransfer"
  static String directRemitTransferConfirm =
      "proxy/corridor/v1/remittance/confirm";
  static String validateIfscCode =
      "proxy/corridor/v1/common/validateIFSCCode?ifscCode=";
  static String beneficiaryAdd = "proxy/ben/v1/dr/beneficiary/add";
  static String directRemitAddBeneficiaryWithImage =
      "proxy/ben/v1/dr/beneficiary/add/images";
  static String beneficiaryUpdate = "proxy/ben/v1/dr/beneficiary/update";
  static String directRemitUpdateBeneficiaryWithImage =
      "proxy/ben/v1/dr/beneficiary/update/images";

  static String wugetCountryList =
      "proxy/qib-western-union/api/v1/getCountryList";
  static String wuFeeInquireService =
      "proxy/qib-western-union/api/v1/feeInquireService";
  static String wcSendMoneyValidate =
      "proxy/qib-western-union/api/v1/sendMoneyValidate";
  static String wcSendMoneyStore =
      "proxy/qib-western-union/api/v1/sendMoneyStore";
  static String wuPurposeCode = "proxy/qib-western-union/v1/getPurposeCode";
  static String wuPurposeCodeSendToBankAccount =
      "proxy/qib-western-union/api/v1/dynamicpurposecode?";
  static String getCountryCapabilities =
      "proxy/qib-western-union/v1/countrycapabilities";

  static String wuProtectYourselfData =
      "aggregator/public/getContents/wu/wu_confirmation.html";
  static String wuProtectYourselfDataAr =
      "aggregator/public/getContents/wu/wu_confirmationAr.html";
  static String wuTermsAndConditions =
      "aggregator/public/getContents/wu/wu_tandc_En.html";
  static String wuTermsAndConditionsAr =
      "aggregator/public/getContents/wu/wu_terms_conditions_ar.html";
  static String wuGetStatesAndCity =
      "proxy/qib-western-union/v1/getStateAndCity?countryCode=";
  static String wuAddBeneficiary = "proxy/qib-western-union/v1/beneficiary/add";
  static String wuAddBeneficiaryWithImage =
      "proxy/qib-western-union/v1/beneficiary/add/images";
  static String wuUpdateBeneficiary =
      "proxy/qib-western-union/v1/beneficiary/update";
  static String wuEditBeneficiaryWithImage =
      "proxy/qib-western-union/v1/beneficiary/edit/images";

  //WESTERN UNION
  static String cancelWU =
      "proxy/qib-western-union/api/v1/westernunion/transaction/cancelation";
  static String wuTransactionEnquiry =
      "proxy/qib-western-union/api/v1/westernunion/transactionenquiry";

  //WITHIN QATAR API
  static String validateBeneficiary = "proxy/ben/v1/validate/beneficiary";
  static String addBeneficiary = "proxy/ben/v1/add/beneficiary";
  static String addBeneficiaryWithImage = "proxy/ben/v1/add/beneficiary/image";
  static String updateBeneficiary = "proxy/ben/v1/update/beneficiary";
  static String updateBeneficiaryWithImage =
      "proxy/ben/v1/update/beneficiary/image";
  static String getCurrencyList =
      "aggregator/public/getContents/beneficiary/qibCurrencyList.json";

  //beneficiary management
  static String getbeneficiariesList = "proxy/ben/v1/ben/list";
  static String deletebeneficiary = "proxy/ben/v1/delete/beneficiary";
  static String delStandingOrderDetails =
      "proxy/sto/v1/standing-order/beneficiary/delete-standing-order-details";
  static String getCorridor = "proxy/corridor/v1/common/getCorridors";
  static String getBanks = "proxy/corridor/v1/common/getBanks";

  //Dhareeba payment
  static String getTinNumber = "aggregator/dhareeba/getTin";
  static String addTinNumber = "aggregator/dhareeba/addTin";
  static String deleteTinNumber = "aggregator/dhareeba/removeTin";
  static String listDhareebaBill = "aggregator/dhareeba/billsList";
  static String payDhareebaBill = "aggregator/dhareeba/billPayment";

  //Oredoo payment
  static String getlastpayments = "proxy/cgi/v1/transaction/history";
  static String topupDenomination =
      "aggregator/public/getContents/payments/ooredoo/ooredoo-hala-topup.json";
  static String checkabsherStatus = "aggregator/Miscellaneous/accountInfo";
  static String paymentconfirm = "aggregator/payment/OOREDOO/confirm";
  static String ooredobillenquiry =
      "aggregator/Payments/billInquiryOoredoo"; //"aggregator/payments/billinquiryooredoo";
  static String ooredopaymentusingAbsher =
      "aggregator/ooredoPaymentUsingAbsherPoints";
  static String ooredoHalaTopupusingAbsher =
      "aggregator/ooredoHalaTopup"; //"aggregator/ooredoHalaTopupUsingAbsherPoints";

  static String processOoredoPaymentsUsingAbsher =
      "aggregator/processOredoPaymentusingAbsherPoints";
  static String ooredooTopUPConfirmByCreditCard =
      "aggregator/ooredooTopUpVoucher";
  static String ooredooBillPaymentConfirmByCreditCard =
      "aggregator/BillPaymentOoredoo";

  //Vodafone payment
  static String getVodafoneproductCategoryList =
      'aggregator/getProductCategories';
  static String getproductList = "aggregator/getProductList";
  static String vodafonePaymentUsingAbsher = "aggregator/vodafonePayment";
  static String vodafonetopupUsingAbsher = "aggregator/vodafoneTopup";
  static String vodofoneBillpayment = "aggregator/vodofoneBillpayment";
  static String vodofoneBalancetopup = "aggregator/vodofoneBalancetopup";
  static String vodafonebillEqnuiry = "aggregator/getCustomerBillList";
  static String vodofonePaymentFromCreditCard =
      "aggregator/utilityPaymentVodofone";

  static String getlastTransfer = "proxy/cgi/v1/transactions/history";

  //e-cash
  static String ecashlimit = "aggregator/Payments/cardlessCash";
  static String ecashpaymentConfirm = "aggregator/payment/ecash/confirm";

  //charity
  static String getCharitylist = "proxy/ben/v1/beneficiary/charity/list";
  static String charitypayment = "aggregator/payment/charity";

  //common api for all payments
  static String ooredoGetBeneficiarylist =
      "proxy/ben/v1/beneficiary/beneficiaryType";

  //kaharama
  static String kaharmabill_enquiry = "aggregator/Payments/billInquiryKahrama";
  static String kaharmabill_payment_by_account =
      "aggregator/payment/kahramaa/confirm";
  static String kaharmabill_payment_by_creditCard =
      "aggregator/KahramaaBillPayment";
  static String kaharmabill_payment_by_absher =
      "services/rest/v1/absher/kharamaa/payment";
  static String kaharma_payment = "aggregator/kaharamaPayment";

  //APPLICATION CONSTANT VARIABLE
  static int otpResentSecondsValue = 180;

  //SmartBtn
  static String netWorth = "proxy/customer/v1/account/networth";
  static String exchangeRate = "proxy/cgi/v1/public/getRates";

  //e-cash
  //static String ecashlimit =  "aggregator/Payments/cardlessCash" ;
  //static String ecashpaymentConfirm =  "aggregator/payment/ecash/confirm" ;

  //Requset Cheque book

  static String noOfleafs =
      "aggregator/public/getContents/marketplace/noOfLeafs.json";
  static String chargesInfo =
      "aggregator/public/getContents/E-Request/chequeBookFees.json";

  //static String requsetFee = "proxy/live/Miscellaneous/eService";

  static String requsetFee = "proxy/cgi/v1/services/request/validate";

  static String submitReqest = "proxy/cgi/v1/services/request";

  static String chequeHistoryList =
      "proxy/cgi/v1/request/cheque/image/list/without/filter";
  static String chequeHistoryFilteredList =
      "proxy/cgi/v1/request/cheque/image/list";
  static String chequeHistoryImage = "proxy/cgi/v1/request/cheque/image";
  static String chequeHint = "proxy/cgi/v1/cheque/hints";

//ALL OFFERS

  static String getStaticOffers =
      "aggregator/public/getContents/offers/offers_content.json";

  static String getDohaCitiesEn =
      "aggregator/public/getContents/profile/dohaCitiesEn.json";

  static String allOffersListUrl = "proxy/ocf/v1/ocf/offer/list?Customer-Id=";
  static String allNewOffersListUrl =
      "proxy/ocf/v1/ocf/offer/list/final?Customer-Id=";
  static String getCreditBureau = "proxy/ocf/v1/ocf/validate/creditbureau";
  static String validateSchedule =
      "proxy/ocf/v1/ocf/ocf/v1/request/validate/schedule";
  static String getDohaCities =
      "aggregator/public/getContents/profile/dohaCities.json";

  static String getDohaCitiesAr =
      "aggregator/public/getContents/profile/dohaCitiesAr.json";
  static String getListLD = "proxy/ocf/v1/ocf/loan/details";
  static String updateUserProfile =
      "aggregator/ESBGateway/updateCustomerDetails";

  static String buyCommodity =
      "proxy/ocf/v1/ocf/request/treasury/rest/commodity/buy";
  static String ocfVerifyOTP = "proxy/ocf/v1/ocf/verify/token";
  static String logOTPStopReversingCommodity =
      "proxy/ocf/v1/ocf/request/treasury/commodity/otp/status";
  static String invalidOffer = "proxy/ocf/v1/ocf/offer/invalidate";
  static String sellCommodity =
      "proxy/ocf/v1/ocf/request/treasury/rest/commodity/sell";
  static String initiateExpartsJourney =
      "proxy/ocf/v1/ocf/expat/journey/complete";
  static String purchaseAccountEntries =
      "proxy/ocf/v1/ocf/request/purchase/account/entries";
  static String financeCreation = "proxy/ocf/v1/ocf/request/finance/creation";

  static String reversalOfCommodity =
      "proxy/ocf/v1/ocf/request/treasury/rest/commodity/reversal";
  static String logLDDetails = "proxy/ocf/v1/ocf/request/save/LD/Details";

  static String resumeFinanceFlowUrl =
      "proxy/ocf/v1/ocf/finance/pf/resume?"; //"proxy/ocf/v1/ocf/finance/pf/resume?"; //"qib-ocf/v1/ocf/finance/pf/resume";

  static String otpInvalidOCFOffer =
      "proxy/ocf/v1/ocf/request/save/OTP/invalidate/offer";

  //ICC APIS\
  static String dedeupCheckUrl = "proxy/qib-icc/v1/icc/request/dedupeCheck";
  static String iCCCreditBuraueUrl = "proxy/qib-icc/v1/icc/creditBureau";
  static String offerDetailsSaveUrl =
      "proxy/qib-icc/v1/icc/request/iccOfferAvail";
  static String lienOfferAvail = "proxy/qib-icc/v1/icc/request/lienOfferAvail";
  static String createCardUrl = "proxy/qib-icc/v1/icc/create/card";
  static String createLienCardUrl = "proxy/qib-icc/v1/icc/create/liencard";

  static String cardProductsUrlEN =
      "aggregator/public/getContents/icc/card_products_En.json";
  static String cardProductsUrlAR =
      "aggregator/public/getContents/icc/card_products_Ar.json";

  // DOB

  static String mobNumValidPefix =
      "aggregator/public/getContents/dob/common.json";
  static String validateCustomerDetails =
      "qib-digital-onboarding/v1/public/customer/validate/customer/details";
  static String dobOtpGeneration =
      "qib-digital-onboarding/v1/public/dob/generate/otp";
  static String dobOtpVerify =
      "qib-digital-onboarding/v1/public/dob/verify/otp";
  static String saveAccSelection =
      "qib-digital-onboarding/v1/public/customer/save/account/selection";
  static String ezmcomInt = "qib-digital-onboarding/v1/public/ezmcom/init";
  static String daonCreateUser =
      "qib-digital-onboarding/v1/public/daon/user/create";
  static String saveEzmcomIntData =
      "qib-digital-onboarding/v1/public/customer/init";
  static String ezmcomOcr = "qib-digital-onboarding/v1/public/ezmcom/ocr";
  static String daonOcr = "qib-digital-onboarding/v1/public/daon/ocr";
  static String createChallengeDOB =
      "qib-digital-onboarding/v1/public/daon/registration/challenge";
  static String updateChallengeDOB =
      "qib-digital-onboarding/v1/public/daon/update/registrationChallenge";
  static String daonEvalutionDOB =
      "qib-digital-onboarding/v1/public/daon/evaluation";
  static String ezmcomCommit = "qib-digital-onboarding/v1/public/ezmcom/commit";
  static String saveQIdDetails =
      "qib-digital-onboarding/v1/public/customer/save/QID/details";
  static String savePassportDetails =
      "qib-digital-onboarding/v1/public/customer/save/passport/details";
  static String saveImage =
      "qib-digital-onboarding/v1/public/customer/save/image/options";
  static String emplymentName =
      "aggregator/public/getContents/dob/employer_names.json";
  static String occupation =
      "aggregator/public/getContents/dob/occupation_list_dob.json";
  static String occupationAr =
      "aggregator/public/getContents/dob/occupation_list_dob_Ar.json";
  static String saveDetialSummary =
      "qib-digital-onboarding/v1/public/customer/save/details/summary";
  static String crsInfoEnglish =
      "aggregator/public/getContents/dob/crs_En.html";
  static String crsInfoArabic = "aggregator/public/getContents/dob/crs_Ar.html";
  static String saveCrsInfo =
      "qib-digital-onboarding/v1/public/customer/save/crs/declaration";
  static String fatcaInfoEnglish =
      "aggregator/public/getContents/dob/fatca_En.html";
  static String fatcaInfoArabic =
      "aggregator/public/getContents/dob/fatca_Ar.html";
  static String saveFatcaInfo =
      "qib-digital-onboarding/v1/public/customer/save/fatca/declaration";
  static String crsAndFatcaDeclerationEn =
      "aggregator/public/getContents/dob/declaration_En.html";
  static String crsAndFatcaDeclerationAr =
      "aggregator/public/getContents/dob/declaration_Ar.html";
  static String getCountryList =
      "aggregator/public/getContents/dob/countries_cob.json";
  static String getEzmcomStatus =
      "qib-digital-onboarding/v1/public/ezmcom/status";
  static String registerAccount =
      "qib-digital-onboarding/v1/public/customer/create/sso/user";
  static String createRim =
      "qib-digital-onboarding/v1/public/customer/create/customer/fatca";
  static String accountActivation =
      "qib-digital-onboarding/v1/public/customer/save/delivery/selection";
  static String updateStatus =
      "qib-digital-onboarding/v1/public/customer/update/status";
  static String getTitle = "qib-digital-onboarding/v1/public/dob/util/title";
  static String validateEmpDetails =
      "qib-digital-onboarding/v1/public/customer/validate/employer/details";
  static String uploadSalaryCertificate =
      "qib-digital-onboarding/v1/public/customer/upload/salary";
  static String getImagesfromEzmcom =
      "qib-digital-onboarding/v1/public/ezmcom/pull";
  static String uploadStuID =
      "qib-digital-onboarding/v1/public/customer/upload/studentidcard";
  static String uploadAuthLetter =
      "qib-digital-onboarding/v1/public/customer/upload/studentidauthorizationletter";
  static String stuCreditCard =
      "aggregator/public/getContents/dob/student_credit_card_En.json";
  static String stuCreditCardTCAr =
      "aggregator/public/getContents/dob/bedayaCreditCardTCAr.html";
  static String stuCreditCardTCEn =
      "aggregator/public/getContents/dob/bedayaCreditCardTCEn.html";

  // Apply For Home Finance
  static String desiredFinanceRequest =
      "proxy/ocf/v1/ocf/offline/request/ocf/create/lead";
  static String getFinanceDataEn =
      "aggregator/public/getContents/OCF/financeLeadVariables.json";
  static String getFinanceDataAr =
      "aggregator/public/getContents/OCF/financeLeadVariablesAr.json";

  // Brokreage

  static String brokerageEnquiry = "proxy/qib-group/v1/group/customer/inquiry";
  static String brokerageRegistration =
      "proxy/qib-group/v1/group/register/customer";
  static String brokerageLogin = "proxy/qib-group/v1/group/login/customer";
  static String brokerageUpdateAccounts =
      "proxy/qib-group/v1/group/customer/reregister";

  // for mpay
  static String customerEnquiry = "proxy/qib-mpay/v1/customer/inquiry";
  static String customerRegistration = "proxy/qib-mpay/v1/registration";
  static String mpayAccountToWallet =
      "proxy/qib-mpay/v1/addmoney/accounttowallet";
  static String mpayTransperToPerson =
      "proxy/qib-mpay/v1/addmoney/wallettowallet";
  static String mpayTransferWalletToAccount =
      "proxy/qib-mpay/v1/addmoney/wallettoaccount";
  static String mpayMiniStatement = "proxy/qib-mpay/v1/ministatement";

  static String mpayTransactionHistory =
      "proxy/qib-mpay/v1/transaction/history";
  static String mpayTransferFees = "proxy/qib-mpay/v1/get/fees";

  static String mpayMerchantPayment = "proxy/qib-mpay/v1/mpay/p2m?customerId=";

//Card Details OverView Apis
  static String getCreditCardDetailsUrl =
      "proxy/live/Cards/getCreditCardDetails?cardNumber=";
  static String getCreditCardTranscationUrl =
      "proxy/live/Cards/getCardTransactions?cardNumber=";
  static String getCreditCardFilterTranscationUrl =
      "proxy/live/Cards/getCardTransactions?";
  static String getCardElegibilityLimitUrl =
      "proxy/qib-icc/v1/icc/tli/eligibilityLimit";
  static String createTLIUrl = "proxy/qib-icc/v1/icc/tli/create";
  static String iccBranchOfferUrl = "proxy/qib-icc/v1/icc/resume/offer";

  static String cardPaymentUrl = "aggregator/card/payment";

  //Card View Statement
  static String cardDownloadStatementUrl =
      "proxy/cgi/v1/card/download/card-statement?";
  static String getAccountMudarabaUrl = "proxy/live/Account/mudaraba?";

  //Card Replace Url
  static String cardGetListUrl = "proxy/live/Cards/getCardProfileRist";

  static String cardGetDetails = "aggregator/card/getDigitalCardDetails";

  //mpay help and faq
  static String mpayHelpNFaqEng =
      "aggregator/public/getContents/mpay/faqs_en.html";
  static String mpayHelpNFaqAr =
      "aggregator/public/getContents/mpay/faqs_ar.html";

  // mpay activation terms and condition
  static String mpayActivationTermsAndConditionEng =
      "aggregator/public/getContents/mpay/mpay_termsNconditions_en.html";
  static String mpayActivationTermsAndConditionAr =
      "aggregator/public/getContents/mpay/mpay_termsNconditions_ar.html";

  // EMI POST PONE
  static String emiPostPoneUrl =
      "proxy/ocf/v1/ocf/request/emiPostponementCutOff"; //"ocf/v1/ocf/request/emiPostponementCutOff"; //"proxy/ocf/v1/request/emiPostponementCutOff";

  // supplementary card
  // static String getBranchList = "contentstream/contentRepository/marketplace/branchList.json";
  static String getCreditCardRequest = "proxy/cgi/v1/service/request";
  static String getBranchList =
      "aggregator/public/getContents/marketplace/branchList.json";
  static String getBranchListAr =
      "aggregator/public/getContents/marketplace/branchList_Ar.json";
  static String createSupplementaryServiceRequest =
      "proxy/cgi/v1/services/request/supplementarycard";
  static String supplementaryUploadDocument =
      "proxy/cgi/v1/service/request/uploaddocument";
  static String createSupplementaryCard =
      "proxy/qib-icc/v1/icc/create/supplementarycard";

  //  for debit card replacement
  static String cardReplacementRequest = "proxy/cgi/v1/services/request";

  //Change Password
  static String changePassword = "auth/profile/password/confirm";

  //Abhser Api
  static String abhserActivation = "aggregator/Miscellaneous/activateMember";

  //E_IPO Registration Check
  static String eipoCountryList =
      "aggregator/public/getContents/eipo/eipo-eligible-countries.json";
  static String eipoRegistrationCheck =
      "proxy/live/ESBGateway/getPrimaryCustomerDetails";
  static String eipoRegistrationDataUpload = "auth/public/v1/ipo/register";
  static String eipoGetDataOfUser = "auth/public/v1/qcb";
  static String getEipo = "proxy/live/ESBGateway/EIPO/init";
  static String eipoGetDependentList =
      "proxy/live/ESBGateway/getDependentsData";
  static String arTermsAndCondition =
      "aggregator/public/getContents/eipo/eIPO-TermCond-Ar.html";
  static String enTermsAndCondition =
      "aggregator/public/getContents/eipo/eIPO-TermCond-En.html";
  static String eipoSubscribe = "proxy/eipo/ipo/subscribePrimaryDependents";
  static String eipoHistory = "proxy/live/Miscellaneous/EIPO/history";

  static String currencyCountryListUrl =
      "aggregator/public/getContents/market%20place/CurrencyConverter.json";
  static String currencExchangeRateUrl = "proxy/live/Account/getExchangeRates";
  static String generatePinUrl =
      "aggregator/card/pin/"; //"proxy/live/Cards/pin";

  static String foreignExchangeRateUrl =
      "proxy/live/visa/forexrates/v1/foreignexchangerates";

  /// CARD - MAGSTRIPE */
  static String magstripeCreditCardUrl = "proxy/live/Cards/credit/strip";
  static String eipoRegisterDependent = "proxy/eipo/ipo/registerdependents";
  static String eipoDeleteDependent = "proxy/live/ESBGateway/deleteDependent";

  //update CRS/Fatca info
  static String updateCrsFatcaInfo = "proxy/cgi/v1/dob/request/submit/fatcaCrs";

  //manage CARD
  static String cardInrollment = "proxy/qib-visa/v1/visa/cardEnrollment";
  static String retriveTransactionControll =
      "proxy/qib-visa/v1/visa/retriveTransactionalControl";
  static String newTransactionalControl =
      "proxy/qib-visa/v1/visa/newTransactionalControl";
  static String updateTransactionalControl =
      "proxy/qib-visa/v1/visa/updateTransactionalControl";

  /* DEBIT CARD - MAGSTRIPE */
  static String inqueryDebitCardMagstripeUrl =
      "proxy/live/Cards/inquiryCardMagneticStrip";
  static String countryListUrl = "proxy/ben/v1/beneficiary/country/list";
  static String debitUpdateMagstripeUrl =
      "proxy/live/Cards/updateCardMagneticStrip";
  static String fscountryListUrl =
      "aggregator/public/getContents/cards/countries.json";

  /* Takaful product URL */
  static String takafulProductsUrl = "proxy/sto/v1/tp/getDetails";

  static String familyShieldGetActivePolicyDetailsUrl =
      "proxy/sto/v1/fs/getDetails";

  static String familyShieldGetPolicyDetailsUrl = "proxy/sto/v1/fs/settings";
  static String familyShieldCreatePolicyUrl = "proxy/sto/v1/fs/create/sto";
  static String familyShieldRenewalPolicyUrl = "proxy/sto/v1/fsr/offers";

  static String getRelationshipUrl = "E-Request/fs-relationship.json";
  static String fsRenewalPlansUrl =
      "aggregator/public/getContents/E-Request/fsRenewal_BenefitCoverPlans.json";
  static String fsRenewalHealthQuestionsUrl =
      "aggregator/public/getContents/E-Request/fsRenewal_HealthQuestionaire_en.json";
  static String fsRenewalHealthQuestionsArUrl =
      "aggregator/public/getContents/E-Request/fsRenewal_HealthQuestionaire_ar.json";

  static String fsTermsAndConditionEN =
      "aggregator/public/getContents/E-Request/fs_termsNconditions_en.html";
  static String fsTermsAndConditionAR =
      "aggregator/public/getContents/E-Request/fs_termsNconditions_ar.html";
  static String fsRenewalTermsAndConditionAR =
      "aggregator/public/getContents/E-Request/family-shield-renewal-tnc_ar.html";
  static String fsRenewalTermsAndConditionEN =
      "aggregator/public/getContents/E-Request/family-shield-renewal-tnc_en.html";
  static String fsRelationshipJsonUrl =
      "aggregator/public/getContents/E-Request/relationship.json";

  // Update Profile
  static String updateProfile = "aggregator/ESBGateway/updateCustomerDetails";
  static String updateProfileCity =
      "aggregator/public/getContents/profile/dohaCities.json";
  static String updateProfileCityEn =
      "aggregator/public/getContents/profile/dohaCitiesEn.json";
  static String updateProfileCityAr =
      "aggregator/public/getContents/profile/dohaCitiesAr.json";

  //Help & Support
  static String getRetailSupport = "proxy/cgi/v1/common/support/email";

  //static String getRetailSupport = "aggregator/retail/support";

  //  Update Profile Document
  static String updateQIDAndPassportOfCustomer =
      "proxy/live/ESBGateway/updateCustomerDetails";
  static String uploadCustomerDocuments = "proxy/cgi/v1/document/upload";
  static String updateCustomerSalaryCertificate =
      "proxy/live/ESBGateway/updateCustomerSalary";

  //*********Login Assistance***********
  static String verifyDebitCardDetails = "auth/public/forgot/password/verify";
  static String verifyDebitCardOTP = "auth/public/forgot/password/confirm";
  static String initiateUsernameOTP = "auth/public/retrieve/username/initiate";
  static String retriveUsername = "auth/public/retrieve/username/confirm";

  //Addition Account
  static String displayAcc =
      "aggregator/public/getContents/open-a-new-account/products.json";
  static String displayAccAr =
      "aggregator/public/getContents/open-a-new-account/productsAr.json";
  static String openAdditionalAcc = "aggregator/Account/accountOpening";
  static String savingAndCurrentEnTandc =
      "aggregator/public/getContents/dob/cob_termsAndCondition.html";
  static String savingAndCurrentArTandc =
      "aggregator/public/getContents/dob/cob_termsAndCondition_ar.html";
  static String miskEnTandc =
      "aggregator/public/getContents/open-a-new-account/miskAccTermCon-En.html";
  static String miskArTandc =
      "aggregator/public/getContents/open-a-new-account/MiskAccTermCon-Ar.html";
  static String fdEnTandc =
      "aggregator/public/getContents/open-a-new-account/FD-TermCon-En.html";
  static String fdArTandc =
      "aggregator/public/getContents/open-a-new-account/FD-TermCon-Ar.html";
  static String cdEnTandc =
      "aggregator/public/getContents/open-a-new-account/CD-TermCon-En.html";
  static String cdArTandc =
      "aggregator/public/getContents/open-a-new-account/CD-TermCon-Ar.html";

  static String cdFlEnTandc =
      "aggregator/public/getContents/open-a-new-account/CD-Flexi-TermCon-En.html";
  static String cdFlArTandc =
      "aggregator/public/getContents/open-a-new-account/CD-Flexi-TermCon-Ar.html";

  static String scdEnTandc =
      "aggregator/public/getContents/open-a-new-account/SCD-TermCon-En.html";
  static String scdArTandc =
      "aggregator/public/getContents/open-a-new-account/SCD-TermCon-Ar.html";
  static String earlyCdEnTandc =
      "aggregator/public/getContents/open-a-new-account/CD-earlyExit-En.html";
  static String earlyCdArTandc =
      "aggregator/public/getContents/open-a-new-account/CD-earlyExit-Ar.html";
  static String fdTermsData =
      "aggregator/public/getContents/open-a-new-account/mudaraba-list.json";
  static String uploadSalaryInfo = "proxy/live/ESBGateway/updateCustomerSalary";
  static String createFixedDeposite =
      "aggregator/Account/createFixedDepositAccount";
  static String validateQid =
      "proxy/live/ESBGateway/getCustomerDetailsByQatarId?QID=";
  static String flexiCdRedeem = "aggregator/Account/updateFixedDepositAccount";

  static String rdTncAr =
      "aggregator/public/getContents/open-a-new-account/recTermcontions_Ar.html";
  static String rdTncEn =
      "aggregator/public/getContents/open-a-new-account/recTermcondition_en.html";

  /* STANDING ORDEr */
  static String stoFrequencyUrl =
      "aggregator/public/getContents/standing-orders/timefreq.json";
  static String stoTransferDetails = "proxy/sto/v2/transfer-details";
  static String stoStandingOrderUrl = "proxy/sto/v2/standing-order";
  static String deleteStandingOrderUrl =
      "proxy/sto/v1/standing-order/delete-standing-order";
  static String modifyStandingOrderUrl = "proxy/sto/v1/standing-order/modify";
  static String modifyBulkStandingOrderUrl =
      "proxy/sto/v1/standing-order/bulk/modify";
  static String deleteStandingOrderPaymentUrl =
      "proxy/sto/v1/standing-order/delete";
  static String revisedStandingOrderURL =
      "proxy/sto/v1/standing-order/revised/payments";

// my discounts
  static String getMyDiscounts =
      "proxy/cgi/v1/offers/myDiscounts?channelId=OMB";

  /* Car Renewal Urls */
  static String approvePolicy = "proxy/qib-beema/v1/beema/motor/approvepolicy";
  static String newPremium = "proxy/qib-beema/v1/beema/motor/netpremium";
  static String policyRenewal = "proxy/qib-beema/v1/beema/motor/policyrenewal";
  static String quotation = "proxy/qib-beema/v1/beema/motor/quotation";
  static String quotevehicleinfo =
      "proxy/qib-beema/v1/beema/motor/quotevehicleinfo";
  static String policyreport = "proxy/qib-beema/v1/beema/policyreport";

//  card shield
  static String getConfigurationDetailsForCardShield =
      "proxy/cgi/v1/common/creditshield/setting";

  // static String getCreditCardShieldSubmission = "proxy/live/Cards/manage/extensions";
  static String getCreditCardShieldSubmission =
      "proxy/cgi/v1/apply/creditShield";

  //travel takaful
  static String traveltarrif = "proxy/qib-beema/v1/beema/travel/tariff";
  static String netPremium = "proxy/qib-beema/v1/beema/travel/netpremium";
  static String createPolicy = "proxy/qib-beema/v1/beema/travel/approvepolicy";
  static String travelTakafulCode =
      "aggregator/public/getContents/takaful/takaful-codes.json";

  /* Deposite OverView */
  static String mudarabaDetailsUrl =
      "proxy/customer/v1/account/mudaraba/details";
  static String depositeCDEmail =
      "proxy/customer/v1/account/cod/email?accountNumber=";

  /* Card Statement */
  static String cardStatementUrl = "proxy/cgi/v1/card/card-statement";
  static String downloadCardStatementUrl =
      "proxy/cgi/v1/card/download/card-statement";

  static String custDashboardPref = "proxy/customer/v1/customer/dashboard";
  static String getCustDashboardPref =
      "proxy/customer/v1/retrieve/customer/dashboard";

//  for walady Education plan
  static String miscellaneousLeadCreation =
      "proxy/live/Miscellaneous/leadCreation";

// Remove Image
  static String removePicture = "proxy/cgi/v1/removeImage";

//  upload profile picture
  static String uploadProfilePicture = "proxy/cgi/v1/storeImage";
  static String getUploadProfilePicture = "aggregator/public/getImage";
  static String getpublicImages = "aggregator/public/getImage";
  static String getUserProfile =
      "minor/proxy/customer/v1/switchAndTransact/getUserProfile";

  //en
  static String getImage = "aggregator/getImage"; //"proxy/cgi/v1/getImage";

  static String swiftCode = "proxy/ben/v1/beneficiary/swift";

  // retrieve iban number
  static String getIbanNumber = "aggregator/public/retrieve/iban";

  // notification list
// notification list
  static String getNotificationList = "proxy/cgi/v1/request/notifications/list";
  static String getActiveNotificationList =
      "proxy/cgi/v1/request/notifications/list/active";
  static String getUnReadNotificationCount =
      "proxy/v1/request/notifications/list/active";
  static String getNotificationEnable =
      "proxy/cgi/v1/retrieve/notifications/status";
  static String updateNotificationEnable =
      "proxy/cgi/v1/update/notifications/preference"; //"api/proxy/cgi/v1/update/notifications/status";
  static String updateNotificationEnableStatus =
      "proxy/cgi/v1/update/notification/status"; //"api/proxy/cgi/v1/update/notifications/status";
  // static String updateNotificationEnable =
  //     "api/proxy/cgi/v1/update/notification/status"; //"api/proxy/cgi/v1/update/notifications/status";
  static String notificationRead = "proxy/cgi/v1/update/notifications";

  /// Notification AdvanceSearch
  static String getPushNotificationMessage =
      "proxy/cgi/v1/getPushNotificationMessage?";

  static String notificationCategoriesList =
      "proxy/cgi/v1/request/notifications/preference";

  static String minimumBalanceCasaAccounts =
      "proxy/cgi/v1/request/minimum/balance";

  // static String notificationRead = "api/proxy/cgi/v1/request/notification/read";

  // get Demo Video List
  static String getDemoVideoList =
      "aggregator/public/getContents/help/video_tutorials.json";

  //help and faq
  static String helpNFaqEng =
      "aggregator/public/getContents/help/faq/faq-en.json";
  static String helpNFaqAr =
      "aggregator/public/getContents/help/faq/faq-ar.json";

  // car takaful terms and conditions
  static String carTakafulTermsAndConditionEng =
      "aggregator/public/getContents/takaful/ct_termsNconditions_en.html";
  static String carTakafulTermsAndConditionAr =
      "aggregator/public/getContents/takaful/ct_termsNconditions_ar.html";

  static String travelTakafulTermsAndConditionEng =
      "aggregator/public/getContents/takaful/tt_termsNconditions_en.html";
  static String travelTakafulTermsAndConditionAr =
      "aggregator/public/getContents/takaful/tt_termsNconditions_ar.html";

  //  credit shield terms and conditions
  static String creditShieldTermsAndConditionEng =
      "aggregator/public/getContents/cards/cs_termsNconditions_en.html";
  static String creditShieldTermsAndConditionAr =
      "aggregator/public/getContents/cards/cs_termsNconditions_ar.html";

  //  atm locator
  static String getAtmLocatorData =
      "auth/public/v1/common/config?key=ATM_BRANCH";

  static String oCFtermsAndConds_Ar =
      "aggregator/public/getContents/OCF/termsAndConds_Ar.html";
  static String oCFtermsAndConds_En =
      "aggregator/public/getContents/OCF/termsAndConds_En.html";

  static String icctermsAndConds_Ar =
      "aggregator/public/getContents/icc/terms_conditions_Ar.html";
  static String icctermsAndConds_En =
      "aggregator/public/getContents/icc/terms_conditions_En.html";

  // Book a Visit
  static String getBranchQueue = "aggregator/retail/qmatic";
  static String bookTicket = "aggregator/retail/qmatic";
  static String getTicketHistory = "aggregator/retail/qmatic/history";

  // VB
  static String videoBankingAvailability =
      "qib-digital-onboarding/v1/public/vb/restriction";
  static String videoBankingPBConversationID =
      "proxy/qib-vb-cms/v1/cms/getconversationid";

  //kyc
  static String getKycDropdownsData =
      "proxy/customer/v1/crp/customer/configuration";
  static String updatePersonalDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=PERSONAL_INFORMATION";
  static String updatePassportDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=PASSPORT_DETAILS";
  static String updateFatcaDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=FATCA_CRS_INFORMATION";
  static String updateIncomeDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=INCOME_INFORMATION";
  static String updateEmploymentDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=EMPLOYMENT_INFORMATION";
  static String updateAddressDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=ADDRESS_INFORMATION";
  static String updateContactDetails =
      "proxy/customer/v1/crp/customer/update?cprUpdate=CONTACT_INFORMATION";
  static String getKycStatus = "proxy/customer/v1/crp/customer/status";
  static String getCustomerAdditionalInfo =
      "proxy/customer/v1/customer/additional/info";
  static String getBankList =
      'aggregator/public/getContents/crp/qatarBankList.json';
  static String getKycAdditionalInfo =
      "proxy/customer/v1/customer/additional/info";
  static String getMaritalAndEducationList =
      "aggregator/public/getContents/crp/config.json";

  //Visa direct
  static String visaDirectanceTransferDetails =
      "proxy/corridor/v1/remittance/getTransferDetails";
  static String visaDirectGetBenificaryList =
      "proxy/ben/v1/visadirect/beneficiary/getBeneficiaryList";
  static String visaDirectBeneficiaryAdd =
      "proxy/ben/v1/visadirect/beneficiary/add";
  static String visaDirectAddBeneficiaryWithImage =
      "proxy/ben/v1/visadirect/beneficiary/add/images";
  static String visaDirectBeneficiaryUpdate =
      "proxy/ben/v1/visadirect/beneficiary/update";
  static String visaDirectUpdateBeneficiaryWithImage =
      "proxy/ben/v1/visadirect/beneficiary/update/images";
  static String visaDirectCountryListUrl =
      "proxy/visadirect/v1/common/getallowedcountries";
  static String visaDirectRelationshipListUrl =
      "proxy/visadirect/v1/common/getbenrelationshiplist";
  static String visaDirectGetcardinfo =
      "proxy/visadirect/v1/common/getcardinfo";
  static String visaDirectCurrencyListtUrl =
      "proxy/visadirect/v1/common/getcurrencylist";
  static String visaDirectExchangeRateUrl =
      "proxy/visadirect/v1/common/getExchangeRates";
  static String visaDirectTransferInitiate =
      "proxy/visadirect/v1/remittance/initiate";
  static String visaDirectTransferConfirm =
      "proxy/visadirect/v1/remittance/confirm";

  static String visaDirectTransferConfirmCreditCard =
      "proxy/visadirect/v1/remittance/payments";
  static String visaDirectConfigparams =
      "proxy/visadirect/v1/common/configparams";
  static String visaDirectPurposeCode =
      "proxy/visadirect/v1/common/getPurposeCodes?countryCode=";
  static String visatermsAndConds_Ar =
      "aggregator/public/getContents/visadirect/visadirect_terms_conditions_ar.html";
  static String visatermsAndConds_En =
      "aggregator/public/getContents/visadirect/visadirect_terms_conditions_en.html";
  static String validateQIDExpDate =
      "proxy/customer/v1/customer/getCustomerDetailsByQatarId";
  static String crpCountries =
      'aggregator/public/getContents/crp/countries.json';
  static String faqData = "auth/public/v1/common/config?key=FAQ";

  // OCF Against Deposits
  static String getInitialValuesForOCFAgainstDeposits =
      "proxy/ocf/v1/ocf/request/ocfAgainstFd/init";

  //cheque book
  static String chequeIssuanceEnquiry =
      "proxy/live/Account/chequeIssuanceEnquiry";
  static String accountCreatedDate = "proxy/cgi/v1/createDate";
  static String eligibilityCheck = "proxy/cgi/v1/internalAndExternalValidation";
  static String termsAndConditions_En = "/login/termsAndConds_En.html";
  static String termsAndConditions_Ar = "/login/termsAndConds_Ar.html";
  static String digitCardTermsAndConditions_En =
      "/cards/digitalCardTermsConditions_en.html";
  static String digitCardTermsAndConditions_Ar =
      "/cards/digitalCardTermsConditions_ar.html";
  static String submitChequeRequest =
      "proxy/cgi/chequeBookRequest/submitChequeIssuance";

  static String getServiceRequestData =
      "proxy/cgi/chequeBookRequest/getServiceRequestData";

  //FIFA
  static String getFifaDashboard = "proxy/qib-icc/v1/fifa/offers?customerId=";
  static String getFifaDashboardContent =
      "aggregator/public/getContents/fifa/config.json";
  static String fifaConfig =
      "aggregator/public/getContents/fifa/dashboard/config.json";
  static String createPrepaidCardUrl =
      "proxy/qib-icc/v1/icc/create/prepaid/card";
  static String campaignOffers = 'proxy/cgi/v1/campaign/offers';

  static String createReplacementSupplementaryCard =
      "proxy/qib-icc/v1/icc/card/create/replacementcard";

  static String getReplacementReasons =
      "aggregator/public/getContents/cards/card_replacement_reason.json";

  static String getDeliveryMethod =
      "aggregator/public/getContents/marketplace/deliveryMethod.json";

  static String preLoginOffers =
      "aggregator/public/getContents/offers/pre-login/pre_login_offers.json";

  static String shareReceipt = "proxy/cgi/v1/transaction/";

  static String enrollFifaCampaign =
      "proxy/qib-icc/v1/fifa/activate/spend?customerId=";

  static String earlySettlementCollateralInfo =
      "proxy/ocf/v1/ocf/earlysettlement/getCollateralInfoByLD?ldNumber=";

  static String earlySettlementFinalCallWithOTP =
      "proxy/ocf/v1/ocf/earlysettlement/confirm/request";

  static String earlySettlementStaticContractEn =
      "aggregator/public/getContents/OCF/earlySettlementAgainstDeposit_Contract_en.html";
  static String earlySettlementStaticContractAr =
      "aggregator/public/getContents/OCF/earlySettlementAgainstDeposit_Contract_ar.html";

  // Family Court Payment
  static String getFamilyCourtBeneficiary = "aggregator/sjc/list";
  static String addFamilyCourtBeneficiary = "aggregator/sjc/add";
  static String deleteFamilyCourtBeneficiary = "aggregator/sjc/remove";
  static String addFamilyCourtPayment = "aggregator/sjc/sendPayment";
  static String validateFamilyCourtPayment = "aggregator/sjc/validatePayment";
  static String prepaid_card_terms_Ar =
      "aggregator/public/getContents/prepaidCard/prepaid_card_terms_condition_ar.html";

  static String prepaid_card_terms_En =
      "aggregator/public/getContents/prepaidCard/prepaid_card_terms_condition_en.html";

  /******************* Minor Account Consolidation Start **********************/

  static String validatingMinorDebitAndAccountDetails =
      "proxy/customer/v1/validate/minoraccountdetails";
  static String linkingMinorToGuardian = "proxy/customer/v1/link/linkaccount";

  /// GET API
  static String getCustomerDetails =
      "http://172.31.12.118:8761/qib-customer/v1/customer/getCustomerDetailsByQatarId?ExpDate=20261119&QID=27368200019";
  static String getMinorAccounts =
      "proxy/customer/v1/getMinorAccounts?customerId=";
  static String deLinkAccounts = "proxy/customer/v1/delink/delinkaccounts?";
  static String autoDeLinkAccounts =
      "proxy/customer/v1/getDelinkedMinorDetails?guardianRimNumber=";
  static String minorTransferOTPGenerate = "auth/otp/customer/generate?custId=";
  static String uploadMinorProfilePicture = "proxy/cgi/v1/storeMinorImage";
  static String removeMinorPicture = "proxy/cgi/v1/removeMinorImage";

  /******************* Minor Account Consolidation End ************************/

  /// SneakPeek
  static String sneakPeekSetting =
      "proxy/customer/v1/account/sneakpeekSettings";
  static String saveSneakPeek = "proxy/customer/v1/saveSneakPeek";
  static String getSneakPeekData = "aggregator/public/getSneakPeekBalance";

  /********************** Feature Management Start ****************************/
  static String featureManagement =
      "proxy/customer/v1/featuremanagement/getfeatures";

  static String getCardTemplates =
      "proxy/customer/v1/featuremanagement/cards/getalltemplatenames";

  static String getTlI = "proxy/customer/v1/featuremanagement/fetch/allcards";

  /********************** Feature Management End ****************************/
  // Debit Card STP
  static String createReplacementDebitCard =
      "aggregator/card/debit/replacement";

  // Lien ICC
  static String lienArTermsAndCondition =
      "aggregator/public/getContents/cards/lienAgreement_ar.html";
  static String lienEnTermsAndCondition =
      "aggregator/public/getContents/cards/lienAgreement_en.html";
  static String lienCreditCardTermsAndConditionEng =
      "aggregator/public/getContents/cards/lienTermsConditions_en.html";
  static String lienCreditCardTermsAndConditionAr =
      "aggregator/public/getContents/cards/lienTermsConditions_ar.html";

  //Manage my Transfer
  static String getAllTransfers =
      "proxy/customer/v1/customer/getAllTransferLimit";
  static String updateTransferLimit =
      "proxy/customer/v1/customer/updateTransferLimit";
  static String updateExceptionalTransferLimit =
      "proxy/customer/v1/exceptional/limit/submit";
  static String cancelExceptionalLimit =
      "proxy/customer/v1/exceptional/limit/cancel";

  //change Mobile Number
  static String changeMobNumber =
      "proxy/cgi/v1/services/request/updatemobilenumber";

  //Ecommerce for Debit card
  static String customerAccountInquiry =
      "proxy/qib-icc/v1/transactionlimit/customeraccountinquiry?cardNumber=";
  static String debitCardModifyLimit =
      "proxy/qib-icc/v1/transactionlimit/setriskoveride";
  static String enableEcomDisable =
      "proxy/qib-icc/v1/transactionlimit/updatecardauthparam";

  /********* Update Mobile Number Api For ICC ***************/
  static String updateMobileNumberApi =
      "proxy/live/Cards/registercardmobilenumber";

  /// RMPicture
  static String rm_picture = "proxy/customer/v1/getRmPicture?rmCode=";
  static String getDefaultValues = "proxy/cgi/v1/getDefaultValues";

  //rcd start
  static String validateEnablingRCD =
      "proxy/cgi/v1/validateEnablingRCD?customerId=";
  static String validateRCDLimit = "proxy/cgi/v1/validateRCDLimit?customerId=";
  static String validateScanCheque = "proxy/cgi/v1/validateScanCheque";
  static String depositCheque = "proxy/cgi/v1/rcd/depositCheque";

//rcd end

  ///WU Cancellation and Amendment
  static String wuAmendment =
      "proxy/qib-western-union/v1/beneficiary/updateBeneficiaryName";
  static String wuCancellation =
      "proxy/qib-western-union/api/v1/westernunion/transaction/cancel";
  static String wuCancellationReason =
      "aggregator/public/getContents/wu/cancellation_reason.json";

  ///SIT

//EPP

  static String eppCheckAndList = "proxy/ocf/v1/ocf/request/epp/internalCheck?";
  static String eppInit = "proxy/ocf/v1/ocf/request/epp/init";
  static String eppProduct = "proxy/ocf/v1/ocf/request/epp/details?";

  //School Payment
  static String getSchoolList = "proxy/cgi/v1/schools/getAll";
  static String getSchoolBeneficiariesList =
      "proxy/cgi/v1/schools/customer/beneficiary";
  static String deleteSchoolBeneficiary =
      "proxy/ben/v1/schools/customer/beneficiary/disable";
  static String getSchoolPaymentType = "proxy/cgi/v1/schools/paymentType";
  static String addBeneficiarySchool =
      "proxy/ben/v1/schools/customer/beneficiary/add";
  static String schoolGetChargesByAccount =
      "aggregator/fund/transfer/school/account/init";
  static String schoolPaymentByAccount =
      "aggregator/fund/transfer/school/account/confirm";
  static String schoolPaymentByCard = "aggregator/fund/transfer/school/card";
  static String addschoolPayment = "proxy/v1/schools/";

  /// API url of the VCAS
  static String vcasComplete = "proxy/cgi/v1/transactions/vcas/complete";
  static String vcasPending = "proxy/cgi/v1/transactions/vcas/pending";
  static String pendingNotifications =
      "proxy/cgi/v1/customer/pending/notifications";
  static String uploadContract = "proxy/qib-vb-cms/v1/cms/upload/documents";

  //  /cgi/v1/transactions/vcas/pending?customerId=101183&customerName=Abhay Meshram&title=MR

  /****** Status Related Translation *******/
  static String fetchAllArStatus =
      "aggregator/public/getContents/login/status_related_translation_final.json";

  /// PositivePay - Easy Cheque Clearing
  static String chequeNumberValidate =
      'proxy/cgi/v1/positivePay/validateCheque';
  static String easyChequeClearingHistory =
      'proxy/cgi/v1/positivePay/view?accNo=';
  static String easyChequeClearingAdvanceSearch =
      'proxy/cgi/v1/positivePay/advancedSearch';
  static String easyChequeClearingAddCheque =
      'proxy/cgi/v1/positivePay/addCheque';
  static String cancelChequeClearing = 'proxy/cgi/v1/positivePay/cancelCheque';

  //Link De Link debit card
  static String getAccountListfromDebitCard =
      "proxy/customer/v1/linkDelinkDebitCards/accountsList";

  ///SIT
  static String postListofAccountsLinkDeLink =
      "proxy/customer/v1/linkDelinkDebitCards/linkDelinkAcc";

  ///SIT
  // Dispute Transaction
  static String uploadDisputeTransactionDocument =
      "proxy/customer/v1/customer/raiseDispute";
  static String transactionDisputeReason =
      "aggregator/public/getContents/disputeTransaction/TransactionDisputeReasons.json";

  ///Activation of dormant account
  static String accountActivationRequestStatus =
      "proxy/customer/v1/dormantAccount/accStatus";
  static String customerCRPStatus =
      "proxy/customer/v1/dormantAccount/crpStatus";

  //activateDormantAccount this api is used when account data is up to date
  static String activateDormantAccount =
      "proxy/customer/v1/dormantAccount/accountActivation";
  static String validateOtpForActivationOfAcc =
      "proxy/customer/v1/dormantAccount/otpValidation";

  //activateAccountSave this api is used when account data is not up to date
  //and we store request to be check with maker checker from admin panel side
  static String activateAccountSave =
      "proxy/customer/v1/dormantAccount/submit/activationDormantRequest";

  /// Recurring Deposit

  static String createRecurringDeposit = "proxy/sto/v2/rd-standing-order";

  // De Link Of Devices
  static String getPrimaryDeviceName = "auth/public/delink/getDevice";
  static String verifyOTPForAllDevices = "auth/public/delink/allDevices";
  static String removeDeviceForDeviceExceeded =
      "auth/public/delink/removeAllDevices";

//  Analyze spending chart
  //common start
  static String getAnalyzeSpendingIntroShownStatus =
      "proxy/rmb-spend-analyzer/v1/timeline/getIntroShownStatus";

  //common end

  //timeline balance start
  static String spendTransactionsDetails =
      "proxy/rmb-spend-analyzer/v1/timeline/getSpendTransactionsDetails";

  //timeline balance end

  //category start
  static String transactionsByCategory =
      "proxy/rmb-spend-analyzer/v1/categorization/getTransactionsDetailsByCategory";
  static String transactionsByCountry =
      "proxy/rmb-spend-analyzer/v1/categorization/getTransactionsDetailsByCountry";

//category end
//Analyze spendings end

  /// Local Multiple Transfer
  static String multiShareReceipt =
      'proxy/cgi/v1/transaction/multipleTransfers/multiplereceipts';

  ///Multiple payments
  static String getVodafoneBillList = "aggregator/getMultipleCustomerBillList";
  static String getOoredooBillList =
      "aggregator/Payments/multipleBillInquiryOoredoo";
  static String ooredooMultiBillPayAbsher =
      "aggregator/absher/multipleOoredoPayment";
  static String ooredooMultiBillPayCreditCard =
      "aggregator/creditCard/multipleOOredooBillPayment";
  static String ooredooMultiBillPayAccount =
      "aggregator/account/multipleOoredoPayment";
  static String vodafoneMultiBillPayAbsher =
      "aggregator/absher/multipleVodafonePayment";
  static String vodafoneMultiBillPayAccount =
      "aggregator/account/multipleVodafonePayment";
  static String vodafoneMultiBillPayCard =
      "aggregator/creditCard/vodafonePayment";
  static String multiplePaymentShareRecipt =
      "proxy/cgi/v1/transaction/Payments/multiplereceipts";

  ///Request To Pay
  static String createRequestToPay =
      "proxy/qib-mpay/v1/r2p/request?customerId=";
  static String authorizeRequest =
      "proxy/qib-mpay/v1/r2p/authorize?customerId="; // Accept or Reject Request
  static String getListOfRequests = "proxy/qib-mpay/v1/r2p/inquiry?customerId=";
  static String getRequestHistory = "proxy/qib-mpay/v1/r2p/request/history";
  static String r2pTransferFees = "proxy/qib-mpay/v1/get/fees";

  //api/proxy/qib-mpay/v1/mpay/fee
  // Generate Swift Copy
  static String getInternationalTransferSwiftList =
      "proxy/cgi/v1/intltransfers";
  static String swiftcopypdf = "proxy/cgi/v1/generate/swiftcopy";

  ///WU - AC to AC
  static String getTypesOfServicesForWU =
      "proxy/qib-western-union/v1/wuactoac/transferoption?destCountryCode=";
  static String getDynamicBankDetails =
      "proxy/qib-western-union/api/v1/bankdetails";
  static String getCombo2Values = "proxy/qib-western-union/api/v1/combo2value";
  static String getDynamicTranslations =
      "aggregator/public/getContents/wu/wu_send_to_bank_fields.json";


  //Manage Merchants
   static String getMerchantLists = "proxy/visadirect/v1/cardOnFile";
   static String eligibleMerchantLists = "proxy/visadirect/v1/eligibleTransactions";
   static String resumeMerchantPayment = "proxy/visadirect/v1/cancelStopPayment";
   static String stopMerchantPayment = "proxy/visadirect/v1/addMerchant";

}
