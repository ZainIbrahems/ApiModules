import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mena/core/network/dio_helper.dart';
import 'package:mena/modules/openi/models/articles_body.dart';
import 'package:mena/modules/openi/models/articles_response.dart';
import 'package:mena/modules/openi/openi_result_screen.dart';
import '../../../core/functions/main_funcs.dart';
import 'openi_state.dart';

class OpenICubit extends Cubit<OpenIState> {
  ///https://openi.nlm.nih.gov/services#searchAPIUsingGET
  Map<String, String> articles = {
    '': '',
    'Abstract ': 'ab',
    'Book Review': 'bk',
    'Brief Report': 'bf',
    'Case Report': 'cr',
    'Data Paper': 'dp',
    'Discussion': 'di',
    'Editorial': 'ed',
    'In Brief': 'ib',
    'Introduction': 'in',
    'Letter': 'lt',
    'Meeting Report': 'mr',
    'Methods Article': 'ma',
    'News': 'ne',
    'Obituary': 'ob',
    'Product Review': 'pr',
    'Oration': 'or',
    'Reply': 're',
    'Research Article': 'ra',
    'Review Article': 'rw',
    'Systematic Review': 'sr',
    'Radiology Report': 'rr',
    'Orthopedic Slide': 'os',
    'Historical Slide': 'hs',
    'Others': 'ot'
  };

  Map<String, String> imageType = {
    '': '',
    'Exclude Graphics': 'xg',
    'Exclude Multipanel': 'xm',
    'X-ray': 'x',
    'Ultrasound': 'u',
    'Photographs': 'ph',
    'PET': 'p',
    'Microscopy': 'mc',
    'MRI': 'm',
    'Graphics': 'g',
    'CT Scan': 'c',
  };

  Map<String, String> specialists = {
    '': '',
    'Behavioral Sciences': 'b',
    'Biochemistry': 'bc',
    'Cancer': 'c',
    'Cardiology': 'ca',
    'Critical Care': 'cc',
    'Dentistry': 'd',
    'Dermatology': 'de',
    'Drug Therapy': 'dt',
    'Emergency Medicine': 'e',
    'Endocrinology': 'en',
    'Family Practice': 'f',
    'Environmental Health': 'eh',
    'Gastroenterology': 'g',
    'Genetics': 'ge',
    'Geriatrics': 'gr',
    'Gynecology and Obstetrics': 'gy',
    'Hematology': 'h',
    'Immunology': 'i',
    'Infectious Diseases': 'id',
    'Internal Medicine': 'im',
    'Nephrology': 'ne',
    'Neurology': 'n',
    'Nursing': 'nu',
    'Ophthalmology': 'o',
    'Orthopedics': 'or',
    'Otolaryngology': 'ot',
    'Pediatrics': 'p',
    'Psychiatry': 'py',
    'Pulmonary Diseases': 'pd',
    'Rheumatology': 'r',
    'Surgery': 's',
    'Toxicology': 't',
    'Urology': 'u',
    'Vascular Diseases': 'v',
    'Virology': 'vi',
  };

  Map<String, String> collections = {
    '': '',
    'PubMed Central': 'pmc',
    'Indiana U. Chest X-rays': 'cxr',
    'USC Orthopedic Surgical Anatomy': 'usc',
    'mages from the History of Medicine (NLM)': 'hmd',
    'MedPix': 'mpx',
  };

  SearchArticlesBody body = SearchArticlesBody(
    queryString: '',
    max: '100',
    // min: '1',
    articles: '',
    collections: '',
    imageType: '',
    specialists: '',
  );

  Map<String, dynamic> errors = {};

  OpenICubit() : super(OpenIInitial()) {}

  static OpenICubit get(context) => BlocProvider.of(context);

  ArticlesResponse? res;

  Future<void> getArticles(BuildContext context) async {
    errors = body.validate();
    print(errors);
    if (errors.isEmpty) {
      emit(OpenILoadingDataState());
      await MainDioHelper.getData(
        url: "https://openi.nlm.nih.gov/api/search",
        query: body.toMap(),
      ).then((value) {
        res = ArticlesResponse.fromJson(value.data);
        print(value.statusCode);
        print(value.data);
        navigateToWithoutNavBar(
          context,
          OpenIResult(
            list: res!.list!,
          ),
          'routeName',
        );
        emit(OpenIDataLoadedSuccessState());
      });
    } else {
      emit(OpenIErrorLoadingDataState());
    }
  }
}
