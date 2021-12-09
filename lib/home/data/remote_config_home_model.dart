class RemoteConfigHomeModel {
  List<HomeMenu> homeMenu;

  RemoteConfigHomeModel({this.homeMenu});

  RemoteConfigHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['home_menu'] != null) {
      homeMenu = <HomeMenu>[];
      json['home_menu'].forEach((v) {
        homeMenu.add(HomeMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.homeMenu != null) {
      data['home_menu'] = this.homeMenu.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeMenu {
  String name;
  bool isactive;
  String value;
  String asset;
  String color;

  HomeMenu({this.name, this.isactive, this.value, this.asset, this.color});

  HomeMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isactive = json['isactive'];
    value = json['value'];
    asset = json['asset'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['isactive'] = this.isactive;
    data['value'] = this.value;
    data['asset'] = this.asset;
    data['color'] = this.color;
    return data;
  }
}
