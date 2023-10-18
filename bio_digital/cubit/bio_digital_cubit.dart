import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/functions/main_funcs.dart';
import '../../../core/network/dio_helper.dart';
import '../models/bio_digital_response.dart';
import 'bio_digital_state.dart';

class BioDigitalCubit extends Cubit<BioDigitalState> {
  BioDigitalResponse? res;

  BioDigitalCubit() : super(BioDigitalInitial()) {
    getMyHumans();
  }

  static BioDigitalCubit get(context) => BlocProvider.of(context);

  Future<void> getMyHumans() async {
    emit(BioDigitalLoadingDataState());
    await MainDioHelper.getData(
            url:
                "https://apis.biodigital.com/services/v2/content/collections/myhuman",
            query: {},
            tokenn: "xMUxUZcd5y3wU5dlgeG2SrAvO4wB9HqmqO5UrXin")
        .then((value) {
      res = BioDigitalResponse.fromJson(jsonDecode(value.data));
      emit(BioDigitalDataLoadedSuccessState());
    }).catchError((value){
      logg('an error occurred');
      logg(value.toString());
      emit(BioDigitalErrorLoadingDataState());

    });
  }
}
