import 'package:flutter/foundation.dart';

class AccountsData with ChangeNotifier {
  List<Data> data;
  Paging paging;
  AccountsData({this.data, this.paging});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    return data;
  }

  // setUserData(Map<String, dynamic> jsonData) {
  //   AccountsData.fromJson(jsonData);
  //   notifyListeners();
  // }
}

extension AccountsDataX on AccountsData {
  void setData(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    notifyListeners();
  }

  AccountsData get getData => this;
}

class Data {
  String name;
  String category;
  List<CategoryList> categoryList;
  String id;

  Data({this.name, this.category, this.categoryList, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    if (json['category_list'] != null) {
      categoryList = new List<CategoryList>();
      json['category_list'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    if (this.categoryList != null) {
      data['category_list'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class CategoryList {
  String id;
  String name;

  CategoryList({this.id, this.name});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Paging {
  Cursors cursors;

  Paging({this.cursors});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors.toJson();
    }
    return data;
  }
}

class Cursors {
  String before;
  String after;

  Cursors({this.before, this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}
