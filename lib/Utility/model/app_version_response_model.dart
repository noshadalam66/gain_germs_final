class AppVersionResponseModel {
  String? status;
  String? statusCode;
  Data? data;
  String? returnStatus;
  String? channelId;
  String? reference;
  String? dateTime;

  AppVersionResponseModel(
      {this.status,
      this.statusCode,
      this.data,
      this.returnStatus,
      this.channelId,
      this.reference,
      this.dateTime});

  AppVersionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'].toString();
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    returnStatus = json['returnStatus'];
    channelId = json['channelId'];
    reference = json['reference'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['returnStatus'] = returnStatus;
    data['channelId'] = channelId;
    data['reference'] = reference;
    data['dateTime'] = dateTime;
    return data;
  }
}

class Data {
  bool? cacheEnabled;
  bool? bioLoginEnabled;
  bool? isPrimary;
  String? defaultTTL;
  List<VersionInfo>? versionInfo;
  dynamic cacheConfig;

  Data(
      {this.cacheEnabled,
      this.bioLoginEnabled,
      this.isPrimary,
      this.defaultTTL,
      this.versionInfo,
      this.cacheConfig});

  Data.fromJson(Map<String, dynamic> json) {
    cacheEnabled = json['cacheEnabled'];
    bioLoginEnabled = json['bioLoginEnabled'];
    isPrimary = json['isPrimary'];
    defaultTTL = json['defaultTTL'];
    if (json['versionInfo'] != null) {
      versionInfo = [];
      json['versionInfo'].forEach((v) {
        versionInfo!.add(VersionInfo.fromJson(v));
      });
    }
    cacheConfig = json['cacheConfig'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cacheEnabled'] = cacheEnabled;
    data['bioLoginEnabled'] = bioLoginEnabled;
    data['isPrimary'] = isPrimary;
    data['defaultTTL'] = defaultTTL;
    if (versionInfo != null) {
      data['versionInfo'] = versionInfo!.map((v) => v.toJson()).toList();
    }
    if (cacheConfig != null) {
      data['cacheConfig'] = cacheConfig.toJson();
    }
    return data;
  }
}

class VersionInfo {
  String? created;
  String? updated;
  int? id;
  String? portalName;
  String? version;
  String? status;
  String? link;
  String? platform;
  bool? forceUpdate;

  VersionInfo(
      {this.created,
      this.updated,
      this.id,
      this.portalName,
      this.version,
      this.status,
      this.link,
      this.platform,
      this.forceUpdate});

  VersionInfo.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    updated = json['updated'];
    id = json['id'];
    portalName = json['portalName'];
    version = json['version'];
    status = json['status'];
    link = json['link'];
    platform = json['platform'];
    forceUpdate = json['forceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created'] = created;
    data['updated'] = updated;
    data['id'] = id;
    data['portalName'] = portalName;
    data['version'] = version;
    data['status'] = status;
    data['link'] = link;
    data['platform'] = platform;
    data['forceUpdate'] = forceUpdate;
    return data;
  }
}
