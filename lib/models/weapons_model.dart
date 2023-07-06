class Weapons {
  int? status;
  List<Data>? data;

  Weapons({this.status, this.data});

  Weapons.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  Data(
      {this.uuid,
        this.displayName,
        this.category,
        this.defaultSkinUuid,
        this.displayIcon,
        this.killStreamIcon,
        this.assetPath,
        this.weaponStats,
     });

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];
    weaponStats = json['weaponStats'] != null
        ? new WeaponStats.fromJson(json['weaponStats'])
        : null;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['category'] = this.category;
    data['defaultSkinUuid'] = this.defaultSkinUuid;
    data['displayIcon'] = this.displayIcon;
    data['killStreamIcon'] = this.killStreamIcon;
    data['assetPath'] = this.assetPath;
    if (this.weaponStats != null) {
      data['weaponStats'] = this.weaponStats!.toJson();
    }

    return data;
  }
}
class WeaponStats {
  double? fireRate;
  int? magazineSize;
  double? runSpeedMultiplier;
  double? equipTimeSeconds;
  double? reloadTimeSeconds;
  double? firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  String? fireMode;
  String? altFireType;

  WeaponStats({
    this.fireRate,
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
    this.wallPenetration,
    this.feature,
    this.fireMode,
    this.altFireType,
  });

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate']?.toDouble();
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier']?.toDouble();
    equipTimeSeconds = json['equipTimeSeconds']?.toDouble();
    reloadTimeSeconds = json['reloadTimeSeconds']?.toDouble();
    firstBulletAccuracy = json['firstBulletAccuracy']?.toDouble();
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fireRate'] = this.fireRate;
    data['magazineSize'] = this.magazineSize;
    data['runSpeedMultiplier'] = this.runSpeedMultiplier;
    data['equipTimeSeconds'] = this.equipTimeSeconds;
    data['reloadTimeSeconds'] = this.reloadTimeSeconds;
    data['firstBulletAccuracy'] = this.firstBulletAccuracy;
    data['shotgunPelletCount'] = this.shotgunPelletCount;
    data['wallPenetration'] = this.wallPenetration;
    data['feature'] = this.feature;
    data['fireMode'] = this.fireMode;
    data['altFireType'] = this.altFireType;

    return data;
  }
}