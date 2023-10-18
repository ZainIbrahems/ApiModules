import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/network/dio_helper.dart';
import 'package:mena/core/network/network_constants.dart';

import 'package:meta/meta.dart';

import '../models/clinical_trials_fields_study.dart';
import '../models/clinical_trials_response.dart';

part 'clinical_trials_state.dart';

class ClinicalTrialsCubit extends Cubit<ClinicalTrialsState> {
  ClinicalTrialsCubit() : super(ClinicalTrialsInitialState());

  static ClinicalTrialsCubit get(context) => BlocProvider.of(context);

  CTFieldsStudyRes? ctFieldsStudyRes;

  FullStudiesResponse? currentStudy;

  String expression = "";

  Future<void> getSearchResult() async {
    emit(LoadingDataFieldsState());

    logg('getting clinical trials data');
    await MainDioHelper.getData(
        url: clinicalTrials + clinicalTrialsFieldStudies,
        query: {
          'expr': expression,
          'fmt': 'json',
          'fields':
              'NCTId,BriefTitle,Condition,BriefSummary,StartDate,LeadSponsorName,CollaboratorName,Phase,OverallStatus,LeadSponsorClass',
          'min_rnk': 1,
          'max_rnk': 999,
        }).then((value) async {
      logg('clinical trials data got');
      logg(value.toString());
      ctFieldsStudyRes = CTFieldsStudyRes.fromJson(jsonDecode(value.data));

      emit(DataFieldsLoadedSuccessState());
    }).catchError((error) {
      logg('an error occurred');
      logg(error.toString());
      emit(ErrorLoadingDataFieldsState());
    });
  }

  void setExpression(String s) {
    expression = s;
  }

  Future<void> getStudyDetails(String id) async {
    emit(LoadingStudyDataState());
    logg('getting study details data');
    await MainDioHelper.getData(
        url: clinicalTrials + clinicalTrialsFullStudies,
        query: {
          'expr': id,
          'fmt': 'json',
          'min_rnk': 1,
          'max_rnk': 1,
        }).then((value) async {
      logg('clinical study details data got');
      logg(value.toString());
      currentStudy = FullStudiesResponse.fromJson(jsonDecode(value.data)["FullStudiesResponse"]);

      emit(StudyDataLoadedSuccessState());
    }).catchError((error) {
      logg('an error occurred');
      logg(error.toString());
      emit(ErrorLoadingStudyDataState());
    });
  }
}
