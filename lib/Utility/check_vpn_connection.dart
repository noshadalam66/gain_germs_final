import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

///A class that contains static method of checking VPN connection
class CheckVpnConnection {
  ///Returns true if device has VPN connection
  static Future<bool> isVpnActive() async {
    bool isVpnActive;
   

    List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);
    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any((interface) =>
            interface.name.contains("tun") ||
            interface.name.contains("ppp") ||
            interface.name.contains("pptp"))
        : isVpnActive = false;
    if (Platform.isIOS ) {  // for ios 16 beta issue 19/6/2022 
       var iosInfo = await DeviceInfoPlugin().iosInfo;
    var osVersion = iosInfo.systemVersion;
        print('iOSVersionPrint---------->>>>>>: $osVersion'); 

    if(osVersion!.contains("16."))  
    
    {
interfaces.isNotEmpty
          ? isVpnActive = interfaces.any((interface) =>
              interface.name.contains("ppp") ||
              interface.name.contains("pptp"))
          : isVpnActive = false;
    }      

      
    }

    return isVpnActive;
  }
}
