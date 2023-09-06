import 'package:flutter/services.dart';

const String METHOD_CHANNEL = 'com.qib.mb/encryption';
const String SCAN_METHOD = 'scanCheque';
const String MICR_REGEX =
    "<(\\d{6,8})<(\\d{1}):(\\d{3})(\\d{3})(\\d{3}):(<)?(\\d{10,18})<";


get POST_CHECK_SUCCESS => 0X000001;

class ProgresSoftSDKHelper {


  Future<dynamic> scanBackCheckAction() async {
    const MethodChannel channel = const MethodChannel(METHOD_CHANNEL);
    int side = 222;
    int imageQuality = 100;
    var arguments = {
      "language": "en",
      "side": side,
      "imageQuality": imageQuality
    };
    var result = await channel.invokeMethod(SCAN_METHOD, arguments);
    return result;

  }

  Future<dynamic> scanFrontCheckAction() async {
    const MethodChannel channel = MethodChannel(METHOD_CHANNEL);
    int side = 111;
    int imageQuality = 100;
    var arguments = {
      "regex": MICR_REGEX,
      "language": 'en',
      "side": side,
      "imageQuality": imageQuality
    };
    var result = await channel.invokeMethod(SCAN_METHOD, arguments);
    return result;

  }
}
