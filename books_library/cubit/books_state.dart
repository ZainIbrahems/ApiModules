import 'package:flutter/material.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}

class LoadingDataState extends BooksState {}

class DataLoadedSuccessState extends BooksState {}

class ErrorLoadingDataState extends BooksState {}
