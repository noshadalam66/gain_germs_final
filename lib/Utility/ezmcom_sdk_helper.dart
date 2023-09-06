import 'package:flutter/services.dart';
import 'dart:io';

import '../Models/commonmodel.dart';

class EzmcomService {
  static const platform = MethodChannel('com.qib.mb/encryption');

  Future callHologarm(data) async {
    try {
      //print\("scanQID Called");
      final result = await platform.invokeMethod('scanQID', data);
      return result;
    } on Exception {
      //print\("scanQID data: '$e'.");
      return "";
    }
  }

  //Save License detaisl of Daon
  Future saveDaonLicense(docLic, faceLic) async {
    try {
      final result = await platform.invokeMethod('saveDaonLicense', {"documentLic": docLic, "faceLic": faceLic});
      return result;
    } on Exception {
      return "";
    }
  }
  //Daon Server Start
  Future callDaonDocumentQID() async {
    try {
      //print\("scanQID Called");
      final result = await platform.invokeMethod('scanDaonQID', {"lang":
        getUserCurrentLanguageInMemory()});
      return result;
    } on Exception {
      //print\("scanQID data: '$e'.");
      return "";
    }
  }
  Future callDaonDocumentPassport() async {
    try {
      //print\("scanQID Called");
      final result = await platform.invokeMethod('scanDaonPassport', {});
      return result;
    } on Exception {
      //print\("scanQID data: '$e'.");
      return "";
    }
  }
  Future takeDaonSelfi(data) async {
    try {
      final result = await platform.invokeMethod('takeDaonSelfi', data);
      ////print\("takeSelfi RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get takeSelfi data: '$e'.");
      return "";
    }
  }
  Future takeDaonSelfi1() async {
    try {
      final result = await platform.invokeMethod('takeDaonSelfi1', {});
      ////print\("takeSelfi RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get takeSelfi data: '$e'.");
      return "";
    }
  }
  //Daon server end

  Future writeNativeLogs(data) async {
    try {
      //print\("writeNativeLogs Called");
      if (Platform.isAndroid) {
        final result = await platform.invokeMethod('writeNativeLogs', data);
        return result;
      }
    } on Exception {
      //print\("Failed to get writeNativeLogs data: '$e'.");
      return "";
    }
  }

  Future scanFrontQID(data) async {
    try {
      //print\("scanFrontID Called");
      final result = await platform.invokeMethod('scanFrontID', data);
      return result;
    } on Exception {
      //print\("Failed to get scanFrontID data: '$e'.");
      return "";
    }
  }

  Future scanCBackQID(data) async {
    try {
      //print\("scanBackID Called");
      final result = await platform.invokeMethod('scanBackID', data);
      //print\("scanBackID RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get scanBackID data: '$e'.");
      return "";
    }
  }

  Future getOcrPayload(data) async {
    try {
      //print\("getOcrPayload Called");
      final result = await platform.invokeMethod('getOcrPayload', data);
      //print\("getOcrPayload RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get getOcrPayload data: '$e'.");
      return "";
    }
  }

  Future scanPassport(data) async {
    try {
      final result = await platform.invokeMethod('scanPassport', data);
      ////print\("scanPassport RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get scanPassport data: '$e'.");
      return "";
    }
  }

  Future takeSelfi(data) async {
    try {
      final result = await platform.invokeMethod('scanDaonFace', data);
      ////print\("takeSelfi RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get takeSelfi data: '$e'.");
      return "";
    }
  }

  Future updateSelfiResponseToSDK(data) async {
    try {
      final result = await platform.invokeMethod('updateFidoconfirmation', data);
      ////print\("takeSelfi RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get takeSelfi data: '$e'.");
      return "";
    }
  }

  Future updateSelfiComplete() async {
    try {
      final result = await platform.invokeMethod('updateSelfiComplete', {});
      ////print\("takeSelfi RESULT : $result");
      return result;
    } on Exception {
      //print\("Failed to get takeSelfi data: '$e'.");
      return "";
    }
  }

  Future redeemAbsherPoints(data) async {
    try {
      final result = await platform.invokeMethod('redeemAbsherPoints', data);
      return result;
    } on Exception {
      //print\("Failed to get redeemAbsherPoints data: '$e'.");
      return "";
    }
  }

  Future startBrokerage(data) async {
    try {
      //print\("into calling method");
      final result = await platform.invokeMethod('startBrokerage', data);
      return result;
    } on Exception {
      //print\("Failed to start brokerage data: '$e'.");
      return "";
    }
  }

  Future fundTransferBrokerage(data) async {
    try {
      //print\("into calling method");
      final result = await platform.invokeMethod('startBrokerage', data);
      return result;
    } on Exception {
      //print\("Failed to start brokerage data: '$e'.");
      return "";
    }
  }

  Future downloadPdf(data) async {
    try {
      final result = await platform.invokeMethod('downlaodPDF', data);
      return result;
    } on Exception {
      //print\("Failed to downloadPdf: '$e'.");
      return "";
    }
  }

  Future saveReceipt() async {
    try {
      final result = await platform.invokeMethod('saveReceipt', {});
      return result;
    } on Exception {
      //print\("Failed to saveReceipt: '$e'.");
      return "";
    }
  }

  /// **
  ///For Face Enroll/Authentication
  Future openFaceEnrollment() async {
    try {
      final result = await platform.invokeMethod('faceEnroll');
      return result;
    } on Exception {
      //print\("Failed to open the Face Enrollment: '$e'.");
    }
  }

  Future openFaceAuthentication() async {
    try {
      //print\("Open Face Authentication in Encryption");
      final result = await platform.invokeMethod('faceAuth');
      return result;
    } on Exception {
      //print\("Failed to open Face Authentication : '$e'.");
    }
  }

  Future CheckFaceEnrolled() async {
    try {
      //print\("Check Face Enrolled in Encryption");
      final result = await platform.invokeMethod('checkFaceEnrolled');
      return result;
    } on Exception {
      //print\("Failed to check Face Enrolled : '$e'.");
    }
  }

  Future setLocalForAndroid(data) async {
    try {
      //print\("setLocalForAndroid Called");
      final result = await platform.invokeMethod('setLocale', data);
      return result;
    } on Exception {
      //print\("setLocalForAndroid data: '$e'.");
      return "";
    }
  }
}
