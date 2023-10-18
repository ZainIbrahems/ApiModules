part of 'pmc_cubit.dart';

@immutable
abstract class PMCState {}

class PMCInitialState extends PMCState {}

class LoadingDataFieldsState extends PMCState {}

class DataFieldsLoadedSuccessState extends PMCState {}

class ErrorLoadingDataFieldsState extends PMCState {}

class LoadingStudyDataState extends PMCState {}

class StudyDataLoadedSuccessState extends PMCState {}

class ErrorLoadingStudyDataState extends PMCState {}
