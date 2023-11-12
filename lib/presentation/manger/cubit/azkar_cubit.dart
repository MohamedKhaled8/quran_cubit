import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/data/models/section_model.dart';
import 'package:quran/data/models/section_detail_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());

  loadSections(BuildContext context) async {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      List<SectionModel> sections = [];
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      emit(AzkarLoaded(sections));
    }).catchError((error) {
      emit(AzkarError("Error loading sections: $error"));
    });
  }

  loadSectionDetail(BuildContext context, int id) async {
    try {
      List<SectionDetailModel> sectionDetails = [];
      DefaultAssetBundle.of(context)
          .loadString("assets/json/section_details_db.json")
          .then((data) {
        var response = json.decode(data);
        response.forEach((section) {
          SectionDetailModel _sectionDetail =
              SectionDetailModel.fromJson(section);

          if (_sectionDetail.sectionId == id) {
            sectionDetails.add(_sectionDetail);
          }
        });
        emit(AzkarSectionDetailLoaded(sectionDetails));
      }).catchError((error) {
        emit(AzkarError("Error loading section details: $error"));
      });
    } catch (error) {
      emit(AzkarError("Error loading section details: $error"));
    }
  }
}
