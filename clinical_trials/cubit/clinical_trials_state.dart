part of 'clinical_trials_cubit.dart';

@immutable
abstract class ClinicalTrialsState {}

class ClinicalTrialsInitialState extends ClinicalTrialsState {}

class LoadingDataFieldsState extends ClinicalTrialsState {}

class DataFieldsLoadedSuccessState extends ClinicalTrialsState {}

class ErrorLoadingDataFieldsState extends ClinicalTrialsState {}

class LoadingStudyDataState extends ClinicalTrialsState {}

class StudyDataLoadedSuccessState extends ClinicalTrialsState {}

class ErrorLoadingStudyDataState extends ClinicalTrialsState {}
