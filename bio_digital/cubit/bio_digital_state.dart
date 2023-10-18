import 'package:flutter/material.dart';

@immutable
abstract class BioDigitalState {}

class BioDigitalInitial extends BioDigitalState {}

class BioDigitalLoadingDataState extends BioDigitalState {}

class BioDigitalDataLoadedSuccessState extends BioDigitalState {}

class BioDigitalErrorLoadingDataState extends BioDigitalState {}
