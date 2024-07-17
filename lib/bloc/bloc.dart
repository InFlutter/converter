import 'package:cconverter/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../servises/services.dart';
import 'event.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyService currencyService;

  CurrencyBloc({required this.currencyService}) : super(CurrencyInitial()) {
    on<FetchCurrencies>((event, emit) async {
      emit(CurrencyLoading());
      try {
        final currencies = await currencyService.fetchCurrencies();
        emit(CurrencyLoaded(currencies: currencies));
      } catch (e) {
        emit(CurrencyError(message: e.toString()));
      }
    });
  }
}