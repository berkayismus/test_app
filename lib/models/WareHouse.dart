class WareHouse {
  String id;
  String warehouse_name;
  String language;
  String ref_id;
  String status;

  WareHouse.toJSON(Map json) {
    this.id = json['id'];
    this.warehouse_name = json['warehouse_name'];
    this.language = json['language'];
    this.ref_id = json['ref_id'];
    this.status = json['status'];
  }
}
