// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:platform_device_id/platform_device_id.dart';
// import '../../constants/app_constant.dart';
// import '../../Models/commonmodel.dart';
// import '../../security/encryption.dart';
// import 'dart:io';
//
// import '../../widgets/qib_utility.dart';
import 'package:url_launcher/url_launcher.dart';
//
// class VersionCheck {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic>? deviceData;
//   PackageInfo? appPackageInfo;
//   static const platform = MethodChannel('com.qib.mb/encryption');
//
//   setAppPackageInfo(PackageInfo obj) {
//     appPackageInfo = obj;
//   }
//
//   PackageInfo? getAppPackageInfo() {
//     return appPackageInfo;
//   }
//
//   Map<String, dynamic>? getDeviceInfo() {
//     return deviceData;
//   }
//
//   setDeviceInfo(var deviceObj) {
//     deviceData = deviceObj;
//   }
//
//   Future getPackageInfo() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     return packageInfo;
//   }
//
//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'version.securityPatch': build.version.securityPatch,
//       'version.sdkInt': build.version.sdkInt,
//       'version.release': build.version.release,
//       'version.previewSdkInt': build.version.previewSdkInt,
//       'version.incremental': build.version.incremental,
//       'version.codename': build.version.codename,
//       'version.baseOS': build.version.baseOS,
//       'board': build.board,
//       'bootloader': build.bootloader,
//       'brand': build.brand,
//       'device': build.device,
//       'display': build.display,
//       'fingerprint': build.fingerprint,
//       'hardware': build.hardware,
//       'host': build.host,
//       'id': build.id,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'product': build.product,
//       'supported32BitAbis': build.supported32BitAbis,
//       'supported64BitAbis': build.supported64BitAbis,
//       'supportedAbis': build.supportedAbis,
//       'tags': build.tags,
//       'type': build.type,
//       'isPhysicalDevice': build.isPhysicalDevice,
//       'androidId': 'andr0',//build.androidId,
//       'systemFeatures': build.systemFeatures,
//     };
//   }
//
//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'systemName': data.systemName,
//       'systemVersion': data.systemVersion,
//       'model': data.model,
//       'localizedModel': data.localizedModel,
//       'identifierForVendor': data.identifierForVendor,
//       'isPhysicalDevice': data.isPhysicalDevice,
//       'utsname.sysname:': data.utsname.sysname,
//       'utsname.nodename:': data.utsname.nodename,
//       'utsname.release:': data.utsname.release,
//       'utsname.version:': data.utsname.version,
//       'utsname.machine:': data.utsname.machine,
//     };
//   }
//
//   Future getVersionDetails() async {
//     try {
//       if (Platform.isAndroid) {
//         deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
//       } else if (Platform.isIOS) {
//         deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
//       }
//     } on Exception {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }
//     return deviceData;
//   }
//
//   void gotoStoreForUpdate() async {
//     var url;
//     if (Platform.isIOS) {
//       url = AppConstant.appleAppStoreUrl;
//     } else {
//       url = AppConstant.googleAppStoreUrl;
//     }
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       //print\("Could not launch $url");
//     }
//   }
//
//   void skipUpdate() {}
//
//   String getDeviceName(String machineId) {
//     Map<String, dynamic> iPhoneDevices = {
//       "i386": "iPhone Simulator",
//       "x86_64": "iPhone Simulator",
//       "iPhone1,1": "iPhone",
//       "iPhone1,2": "iPhone 3G",
//       "iPhone2,1": "iPhone 3GS",
//       "iPhone3,1": "iPhone 4",
//       "iPhone3,2": "iPhone 4 GSM Rev A",
//       "iPhone3,3": "iPhone 4 CDMA",
//       "iPhone4,1": "iPhone 4S",
//       "iPhone5,1": "iPhone 5 (GSM)",
//       "iPhone5,2": "iPhone 5 (GSM+CDMA)",
//       "iPhone5,3": "iPhone 5C (GSM)",
//       "iPhone5,4": "iPhone 5C (Global)",
//       "iPhone6,1": "iPhone 5S (GSM)",
//       "iPhone6,2": "iPhone 5S (Global)",
//       "iPhone7,1": "iPhone 6 Plus",
//       "iPhone7,2": "iPhone 6",
//       "iPhone8,1": "iPhone 6s",
//       "iPhone8,2": "iPhone 6s Plus",
//       "iPhone8,4": "iPhone SE (GSM)",
//       "iPhone9,1": "iPhone 7",
//       "iPhone9,2": "iPhone 7 Plus",
//       "iPhone9,3": "iPhone 7",
//       "iPhone9,4": "iPhone 7 Plus",
//       "iPhone10,1": "iPhone 8",
//       "iPhone10,2": "iPhone 8 Plus",
//       "iPhone10,3": "iPhone X Global",
//       "iPhone10,4": "iPhone 8",
//       "iPhone10,5": "iPhone 8 Plus",
//       "iPhone10,6": "iPhone X GSM",
//       "iPhone11,2": "iPhone XS",
//       "iPhone11,4": "iPhone XS Max",
//       "iPhone11,6": "iPhone XS Max Global",
//       "iPhone11,8": "iPhone XR",
//       "iPhone12,1": "iPhone 11",
//       "iPhone12,3": "iPhone 11 Pro",
//       "iPhone12,5": "iPhone 11 Pro Max",
//       "iPhone12,8": "iPhone SE 2nd Gen",
//       "iPhone13,1": "iPhone 12 Mini",
//       "iPhone13,2": "iPhone 12",
//       "iPhone13,3": "iPhone 12 Pro",
//       "iPhone13,4": "iPhone 12 Pro Max",
//       "iPhone14,2": "iPhone 13 Pro",
//       "iPhone14,3": "iPhone 13 Pro Max",
//       "iPhone14,4": "iPhone 13 Mini",
//       "iPhone14,5": "iPhone 13",
//       "iPhone14,6": "iPhone SE 3rd Gen",
//       "iPhone14,7": "iPhone 14",
//       "iPhone14,8": "iPhone 14 Plus",
//       "iPhone15,2": "iPhone 14 Pro",
//       "iPhone15,3": "iPhone 14 Pro Max",
//       "iPod1,1": "1st Gen iPod",
//       "iPod2,1": "2nd Gen iPod",
//       "iPod3,1": "3rd Gen iPod",
//       "iPod4,1": "4th Gen iPod",
//       "iPod5,1": "5th Gen iPod",
//       "iPod7,1": "6th Gen iPod",
//       "iPod9,1": "7th Gen iPod",
//       "iPad1,1": "iPad",
//       "iPad1,2": "iPad 3G",
//       "iPad2,1": "2nd Gen iPad",
//       "iPad2,2": "2nd Gen iPad GSM",
//       "iPad2,3": "2nd Gen iPad CDMA",
//       "iPad2,4": "2nd Gen iPad New Revision",
//       "iPad3,1": "3rd Gen iPad",
//       "iPad3,2": "3rd Gen iPad CDMA",
//       "iPad3,3": "3rd Gen iPad GSM",
//       "iPad2,5": "iPad mini",
//       "iPad2,6": "iPad mini GSM+LTE",
//       "iPad2,7": "iPad mini CDMA+LTE",
//       "iPad3,4": "4th Gen iPad",
//       "iPad3,5": "4th Gen iPad GSM+LTE",
//       "iPad3,6": "4th Gen iPad CDMA+LTE",
//       "iPad4,1": "iPad Air (WiFi)",
//       "iPad4,2": "iPad Air (GSM+CDMA)",
//       "iPad4,3": "1st Gen iPad Air (China)",
//       "iPad4,4": "iPad mini Retina (WiFi)",
//       "iPad4,5": "iPad mini Retina (GSM+CDMA)",
//       "iPad4,6": "iPad mini Retina (China)",
//       "iPad4,7": "iPad mini 3 (WiFi)",
//       "iPad4,8": "iPad mini 3 (GSM+CDMA)",
//       "iPad4,9": "iPad Mini 3 (China)",
//       "iPad5,1": "iPad mini 4 (WiFi)",
//       "iPad5,2": "4th Gen iPad mini (WiFi+Cellular)",
//       "iPad5,3": "iPad Air 2 (WiFi)",
//       "iPad5,4": "iPad Air 2 (Cellular)",
//       "iPad6,3": "iPad Pro (9.7 inch, WiFi)",
//       "iPad6,4": "iPad Pro (9.7 inch, WiFi+LTE)",
//       "iPad6,7": "iPad Pro (12.9 inch, WiFi)",
//       "iPad6,8": "iPad Pro (12.9 inch, WiFi+LTE)",
//       "iPad6,11": "iPad (2017)",
//       "iPad6,12": "iPad (2017)",
//       "iPad7,1": "iPad Pro 2nd Gen (WiFi)",
//       "iPad7,2": "iPad Pro 2nd Gen (WiFi+Cellular)",
//       "iPad7,3": "iPad Pro 10.5-inch",
//       "iPad7,4": "iPad Pro 10.5-inch",
//       "iPad7,5": "iPad 6th Gen (WiFi)",
//       "iPad7,6": "iPad 6th Gen (WiFi+Cellular)",
//       "iPad7,11": "iPad 7th Gen 10.2-inch (WiFi)",
//       "iPad7,12": "iPad 7th Gen 10.2-inch (WiFi+Cellular)",
//       "iPad8,1": "iPad Pro 11 inch 3rd Gen (WiFi)",
//       "iPad8,2": "iPad Pro 11 inch 3rd Gen (1TB, WiFi)",
//       "iPad8,3": "iPad Pro 11 inch 3rd Gen (WiFi+Cellular)",
//       "iPad8,4": "iPad Pro 11 inch 3rd Gen (1TB, WiFi+Cellular)",
//       "iPad8,5": "iPad Pro 12.9 inch 3rd Gen (WiFi)",
//       "iPad8,6": "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi)",
//       "iPad8,7": "iPad Pro 12.9 inch 3rd Gen (WiFi+Cellular)",
//       "iPad8,8": "iPad Pro 12.9 inch 3rd Gen (1TB, WiFi+Cellular)",
//       "iPad8,9": "iPad Pro 11 inch 4th Gen (WiFi)",
//       "iPad8,10": "iPad Pro 11 inch 4th Gen (WiFi+Cellular)",
//       "iPad8,11": "iPad Pro 12.9 inch 4th Gen (WiFi)",
//       "iPad8,12": "iPad Pro 12.9 inch 4th Gen (WiFi+Cellular)",
//       "iPad11,1": "iPad mini 5th Gen (WiFi)",
//       "iPad11,2": "iPad mini 5th Gen",
//       "iPad11,3": "iPad Air 3rd Gen (WiFi)",
//       "iPad11,4": "iPad Air 3rd Gen",
//       "iPad11,6": "iPad 8th Gen (WiFi)",
//       "iPad11,7": "iPad 8th Gen (WiFi+Cellular)",
//       "iPad13,1": "iPad air 4th Gen (WiFi)",
//       "iPad13,2": "iPad air 4th Gen (WiFi+Cellular)",
//       "iPad13,4": "iPad Pro 11 inch 5th Gen",
//       "iPad13,5": "iPad Pro 11 inch 5th Gen",
//       "iPad13,6": "iPad Pro 11 inch 5th Gen",
//       "iPad13,7": "iPad Pro 11 inch 5th Gen",
//       "iPad13,8": "iPad Pro 12.9 inch 5th Gen",
//       "iPad13,9": "iPad Pro 12.9 inch 5th Gen",
//       "iPad13,10": "iPad Pro 12.9 inch 5th Gen",
//       "iPad13,11": "iPad Pro 12.9 inch 5th Gen",
//       "iPad13,16": "iPad Air 5th Gen (WiFi)",
//       "iPad13,17": "iPad Air 5th Gen (WiFi+Cellular)",
//       "Watch1,1": "Apple Watch 38mm case",
//       "Watch1,2": "Apple Watch 42mm case",
//       "Watch2,6": "Apple Watch Series 1 38mm case",
//       "Watch2,7": "Apple Watch Series 1 42mm case",
//       "Watch2,3": "Apple Watch Series 2 38mm case",
//       "Watch2,4": "Apple Watch Series 2 42mm case",
//       "Watch3,1": "Apple Watch Series 3 38mm case (GPS+Cellular)",
//       "Watch3,2": "Apple Watch Series 3 42mm case (GPS+Cellular)",
//       "Watch3,3": "Apple Watch Series 3 38mm case (GPS)",
//       "Watch3,4": "Apple Watch Series 3 42mm case (GPS)",
//       "Watch4,1": "Apple Watch Series 4 40mm case (GPS)",
//       "Watch4,2": "Apple Watch Series 4 44mm case (GPS)",
//       "Watch4,3": "Apple Watch Series 4 40mm case (GPS+Cellular)",
//       "Watch4,4": "Apple Watch Series 4 44mm case (GPS+Cellular)",
//       "Watch5,1": "Apple Watch Series 5 40mm case (GPS)",
//       "Watch5,2": "Apple Watch Series 5 44mm case (GPS)",
//       "Watch5,3": "Apple Watch Series 5 40mm case (GPS+Cellular)",
//       "Watch5,4": "Apple Watch Series 5 44mm case (GPS+Cellular)",
//       "Watch5,9": "Apple Watch SE 40mm case (GPS)",
//       "Watch5,10": "Apple Watch SE 44mm case (GPS)",
//       "Watch5,11": "Apple Watch SE 40mm case (GPS+Cellular)",
//       "Watch5,12": "Apple Watch SE 44mm case (GPS+Cellular)",
//       "Watch6,1": "Apple Watch Series 6 40mm case (GPS)",
//       "Watch6,2": "Apple Watch Series 6 44mm case (GPS)",
//       "Watch6,3": "Apple Watch Series 6 40mm case (GPS+Cellular)",
//       "Watch6,4": "Apple Watch Series 6 44mm case (GPS+Cellular)"
//     };
//     String deviceName = (iPhoneDevices[machineId] != null)
//         ? iPhoneDevices[machineId].toString()
//         : machineId;
//     return deviceName;
//   }
//
//   Future getDeviceModelForApi() async {
//     var deviceObj = await getVersionDetails();
//     setDeviceInfo(deviceObj);
//     var packageInfo = await getPackageInfo();
//     setAppPackageInfo(packageInfo);
//     Map<String, dynamic>? deviceJson = deviceObj;
//     var deviceInfo;
//     if (Platform.isIOS) {
//       //var deviceId = deviceJson["identifierForVendor"];
//       var deviceId = await Encryption().getDeviceUDID();
//       var deviceModel =
//           getDeviceName(deviceJson!["utsname.machine:"].toString());
//       var deviceOS = deviceJson["systemVersion"];
//       var devicePlatform = "iPhone";
//       var addDt = DateTime.now();
//       var deviceTZE = addDt.timeZoneName;
//       var deviceName = deviceJson["name"].toString().length < 20
//           ? deviceJson["name"]
//           : deviceJson["name"].toString().substring(0, 20);
//       setDeviceName(deviceName);
//       setDeviceId(deviceId);
//       var createTime = Utility.getInstance()!.getCurrentTimeStamp();
//       deviceInfo = {
//         "createTime": createTime.toString(),
//         "deviceId": deviceId,
//         "deviceModel": deviceModel,
//         "deviceOS": deviceOS,
//         "devicePlatform": devicePlatform,
//         "deviceTZE": deviceTZE,
//         "deviceName": deviceName
//       };
//     } else {
//       // var deviceId = deviceJson!["androidId"];
//       var deviceId = await PlatformDeviceId.getDeviceId;
//       var deviceModel = deviceJson!["model"];
//       var deviceOS = deviceJson["version.release"];
//       var devicePlatform = getIsHuawei() ? "HuaweiAndroid" : "Android";
//       var addDt = DateTime.now();
//       var deviceTZE = addDt.timeZoneName;
//       var deviceName = deviceJson["device"].toString().length < 20
//           ? deviceJson["device"]
//           : deviceJson["device"].toString().substring(0, 20);
//       final result = await platform.invokeMethod('getDeviceName');
//
//       if (result.toString() == "AndroidEmulator") {
//         var deviceNameM = "Emulator " + deviceName;
//         setDeviceName(deviceNameM);
//         deviceName = deviceNameM.length < 20
//             ? deviceNameM
//             : deviceNameM.toString().substring(0, 20);
//       } else {
//         deviceName = result.toString().length < 20
//             ? result.toString()
//             : result.toString().substring(0, 20);
//         setDeviceName(deviceName);
//       }
//       setDeviceId(deviceId);
//       var createTime = Utility.getInstance()!.getCurrentTimeStamp();
//       deviceInfo = {
//         "createTime": createTime.toString(),
//         "deviceId": deviceId,
//         "deviceModel": deviceModel,
//         "deviceOS": deviceOS,
//         "devicePlatform": devicePlatform,
//         "deviceTZE": deviceTZE,
//         "deviceName": deviceName
//       };
//     }
//     ////print\("DEVICEINFO :: ${deviceInfo}");
//     return deviceInfo;
//   }
//
//   void startVersionCheck() async {
//     var deviceObj = await getVersionDetails();
//     setDeviceInfo(deviceObj);
//     var packageInfo = await getPackageInfo();
//     setAppPackageInfo(packageInfo);
//
//     /*
//     var url = AppConstant.apiBaseUrl+""+AppConstant.versionCheck;
//     //var jsonResponse = await callPostApi(url, {});
//     var jsonResponse = [{"position":1,"portalName":"qib","version":"6.5","platform":"ANDROID","status":"OK","link":null,"forceUpdate":true},{"position":2,"portalName":"qib","version":"6.5","platform":"IPHONE","status":"OK","link":null,"forceUpdate":true}];
//     //print\("JSON RESPONSE :: $jsonResponse");
//     var serverVersion;
//     bool forceUpdate = false;
//     if(jsonResponse != null && jsonResponse.length > 0){
//       //Map<String, dynamic> androidObj = jsonResponse[0];
//       //Map<String, dynamic> iPhoneObj = jsonResponse[1];
//       for(Map<String, dynamic> jsonObj in jsonResponse){
//         var plat = jsonObj["platform"];
//         if(Platform.isIOS && plat == "IPHONE"){
//           //iPhoneObj = jsonObj;
//           serverVersion = jsonObj["version"];
//           forceUpdate = false;//jsonObj["forceUpdate"];
//         }else{
//           //androidObj = jsonObj;
//           serverVersion = jsonObj["version"];
//           forceUpdate = false;//jsonObj["forceUpdate"];
//         }
//       }
//
//       PackageInfo package = getAppPackageInfo();
//       //print\("PACKAGE :: ${package.version} DEVICE DATA :: $deviceData");
//
//       int serVer = int.parse(serverVersion.toString().replaceAll(".", ""));
//       int appVer = 10;//int.parse(package.version.toString().replaceAll(".", ""));
//       if(serVer > appVer){
//         Future.delayed(const Duration(seconds: 8), () {
//           if(forceUpdate){
//             Utility.getInstance().versionPopupWithTwoButtons(getBuildContext(), 'version_update'.tr().toString(), 'looks_like_you_are_using_old_version'.tr().toString(), "", "", 'update'.tr().toString(), skipUpdate, gotoStoreForUpdate, forceUpdate);
//           }else{
//             Utility.getInstance().versionPopupWithTwoButtons(getBuildContext(), 'version_update'.tr().toString(),'looks_like_you_are_using_old_version'.tr().toString(), "", 'update'.tr().toString(), 'skip'.tr().toString(), gotoStoreForUpdate, skipUpdate, forceUpdate);
//           }
//         });
//       }
//     }*/
//   }
// }
