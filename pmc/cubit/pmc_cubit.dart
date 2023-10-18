import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mena/core/functions/main_funcs.dart';
import 'package:mena/core/network/dio_helper.dart';
import 'package:mena/core/network/network_constants.dart';

import 'package:meta/meta.dart';

import '../models/pmc_details_response.dart';
import '../models/pmc_search_response.dart';
import '../models/pmc_summary_response.dart';

part 'pmc_state.dart';

class PMCCubit extends Cubit<PMCState> {
  PMCCubit() : super(PMCInitialState());

  static PMCCubit get(context) => BlocProvider.of(context);

  PMCSummaryResponse? pmcSummaryRes;

  PMCDetailsResponse? currentStudy;

  String expression = "";

  Future<void> getPMCIds() async {
    emit(LoadingDataFieldsState());

    logg('getting pmc data');
    await MainDioHelper.getData(url: eUtilitiesBaseUrl + eSearch, query: {
      'term': "(open access[Filter]) AND $expression",
      'db': 'pmc',
      'format': 'json',
      'retmax': '100'
    }).then((value) async {
      logg('clinical trials data got');
      logg(value.toString());
      PMCSearchResponse res = PMCSearchResponse.fromJson(value.data);
      await getPMCIdsSummary(res.esearchresult!.idlist);

      emit(DataFieldsLoadedSuccessState());
    }).catchError((error) {
      logg('an error occurred');
      logg(error.toString());
      emit(ErrorLoadingDataFieldsState());
    });
  }

  Future<void> getPMCIdsSummary(List<String>? idList) async {
    // emit(LoadingDataFieldsState());

    logg('getting pmc summary data');
    await MainDioHelper.getData(
            url: eUtilitiesBaseUrl + eSummary,
            query: {'db': 'pmc', 'format': 'json', 'id': idList!.join(",")})
        .then((value) async {
      logg('pmc data got');
      logg(value.toString());
      pmcSummaryRes = PMCSummaryResponse.fromJson(value.data);
      // emit(DataFieldsLoadedSuccessState());
    }).catchError((error) {
      logg('an error occurred');
      logg(error.toString());
      // emit(ErrorLoadingDataFieldsState());
    });
  }

  void setExpression(String s) {
    expression = s;
  }

  Future<void> getStudyDetails(String id) async {
    emit(LoadingStudyDataState());
    logg('getting pmc details data');
    await MainDioHelper.getData(url: researchBaseUrl, query: {
      'verb': 'GetRecord',
      'identifier': "oai:pubmedcentral.nih.gov:$id",
      'metadataPrefix': 'pmc'
    }).then((value) async {
      logg('pmc details data got');
      logg(value.toString());
      currentStudy = PMCDetailsResponse.fromXml(value.data);
      emit(StudyDataLoadedSuccessState());
    }).catchError((error) {
      logg('an error occurred');
      logg(error.toString());
      emit(ErrorLoadingStudyDataState());
    });
  }
}
