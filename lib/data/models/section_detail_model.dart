import 'package:equatable/equatable.dart';

class SectionDetailModel extends Equatable {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;

  SectionDetailModel(
    this.sectionId,
    this.count,
    this.description,
    this.content,
    this.reference,
  );

  SectionDetailModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    count = json["count"];
    description = json["description"];
    reference = json["reference"];
    content = json["content"];
  }

  @override
  List<Object?> get props =>
      [sectionId, count, description, content, reference];
}
