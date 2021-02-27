import 'package:railway_v1/models/stations.dart';

class TripsModel {
  List<Success> success;

  TripsModel({this.success});

  TripsModel.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = new List<Success>();
      json['success'].forEach((v) { success.add(new Success.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  int id;
  String departTime;
  String arrivalTime;
  String status;
  int baseId;
  int destinationId;
  int trainId;
  String createdAt;
  String updatedAt;
  BaseStation baseStation;
  BaseStation destinationStation;
  List<StationsModel> stations;
  List<Seats> seats;
  List<Levels> levels;

  Success({this.id, this.departTime, this.arrivalTime, this.status, this.baseId, this.destinationId, this.trainId, this.createdAt, this.updatedAt, this.baseStation, this.destinationStation, this.stations, this.seats, this.levels});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departTime = json['depart_time'];
    arrivalTime = json['arrival_time'];
    status = json['status'];
    baseId = json['base_id'];
    destinationId = json['destination_id'];
    trainId = json['train_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    baseStation = json['base_station'] != null ? new BaseStation.fromJson(json['base_station']) : null;
    destinationStation = json['destination_station'] != null ? new BaseStation.fromJson(json['destination_station']) : null;
    if (json['stations'] != null) {
      stations = new List<Null>();
      json['stations'].forEach((v) { stations.add(new StationsModel.fromJson(v)); });
    }
    if (json['seats'] != null) {
      seats = new List<Seats>();
      json['seats'].forEach((v) { seats.add(new Seats.fromJson(v)); });
    }
    if (json['levels'] != null) {
      levels = new List<Levels>();
      json['levels'].forEach((v) { levels.add(new Levels.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['depart_time'] = this.departTime;
    data['arrival_time'] = this.arrivalTime;
    data['status'] = this.status;
    data['base_id'] = this.baseId;
    data['destination_id'] = this.destinationId;
    data['train_id'] = this.trainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.baseStation != null) {
      data['base_station'] = this.baseStation.toJson();
    }
    if (this.destinationStation != null) {
      data['destination_station'] = this.destinationStation.toJson();
    }
    if (this.stations != null) {
      data['stations'] = this.stations.map((v) => v.toJson()).toList();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseStation {
  int id;
  String name;
  String createdAt;
  Null updatedAt;

  BaseStation({this.id, this.name, this.createdAt, this.updatedAt});

  BaseStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Seats {
  int id;
  String status;
  int carId;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Seats({this.id, this.status, this.carId, this.createdAt, this.updatedAt, this.pivot});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    carId = json['car_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['car_id'] = this.carId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int seatableId;
  int seatId;
  String seatableType;

  Pivot({this.seatableId, this.seatId, this.seatableType});

  Pivot.fromJson(Map<String, dynamic> json) {
    seatableId = json['seatable_id'];
    seatId = json['seat_id'];
    seatableType = json['seatable_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatable_id'] = this.seatableId;
    data['seat_id'] = this.seatId;
    data['seatable_type'] = this.seatableType;
    return data;
  }
}

class Levels {
  int id;
  Null createdAt;
  Null updatedAt;
  Pivot pivot;

  Levels({this.id, this.createdAt, this.updatedAt, this.pivot});

  Levels.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  if (this.pivot != null) {
  data['pivot'] = this.pivot.toJson();
  }
  return data;
  }
}
