import 'package:flutter/material.dart';

@immutable
abstract class OpenIState {}

class OpenIInitial extends OpenIState {}

class OpenILoadingDataState extends OpenIState {}

class OpenIDataLoadedSuccessState extends OpenIState {}

class OpenIErrorLoadingDataState extends OpenIState {}
