import 'package:equatable/equatable.dart';

class SectionModel extends Equatable {
  int? id;
  String? name;
  SectionModel(this.id, this.name);

  SectionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
  @override
  List<Object?> get props => [id, name];
}
