import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:gov_flutter_copy_app/requests/backend_response.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data/paycheck_interactor.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_relatory.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_id.dart';

part 'paycheck_information_event.dart';
part 'paycheck_information_state.dart';

class PaycheckInformationBloc extends Bloc<PaycheckInformationEvent, PaycheckInformationState> {

  final PaycheckRecordInteractor _paycheckInteractor = PaycheckRecordInteractor();

  bool visibleData = true;

  PaycheckRecord? _paycheckRecord;

  PaycheckInformationBloc({bool loadRightAway=false}) :
        super(PaycheckInformationInitial()) {

    on<UpdatePaycheckInformationEvent>(_onUpdate);

    on<LoadPaycheckInformationEvent>(
            (event, emit) async {
      await _loadInformation(emit);
    });

    on<ChangePaycheckVisibilityEvent>((event, emit){
      visibleData = !visibleData;
      emit(PaycheckInformationLoaded(paycheckRecord: _paycheckRecord!));
    });

    if(loadRightAway) {
      add(LoadPaycheckInformationEvent());
    }

  }

  _onUpdate(event, emit) {
    _loadInformation(emit, causeUpdate: true);
  }

  Future<void> _loadInformation(Emitter<PaycheckInformationState> emit, {
    bool causeUpdate=false,
  }) async {

    if(!causeUpdate && _paycheckRecord != null) {
      emit(PaycheckInformationLoaded(paycheckRecord: _paycheckRecord!));
      return;
    }

    emit(PaycheckInformationLoading());
    BackendResponse response = await _paycheckInteractor.fetchData(UserId(id: "1"));

    if(response.positiveStatus != true) {
      emit(PaycheckInformationError(message: response.message));
      return;
    }

    debugPrint("to value: ${response.data.toString()}");

    _emitInformationLoaded(response, emit);
  }



  void _emitInformationLoaded(BackendResponse<dynamic> response, Emitter<PaycheckInformationState> emit) {

    PaycheckRecord value = response.data;

    _paycheckRecord = value;
    emit(PaycheckInformationLoaded(paycheckRecord: value));
  }



  List<PaycheckInformation> getPaychecksInformationByType(PaycheckInformationType type) {

    if(type == PaycheckInformationType.liquid) {
      double liquidValue =
      getPaychecksInformationByType(PaycheckInformationType.brute).getSum() -
      getPaychecksInformationByType(PaycheckInformationType.discount).getSum();

      return [PaycheckInformation(name: "LÍQUIDO", value: liquidValue, type: PaycheckInformationType.liquid)];
    }

    return _paycheckRecord!.paychecks.ofType(type);

  }


  /*
  int stateCalls = 0;
  @override
  void emit(PaycheckInformationState state) {
    stateCalls++;
    super.emit(state);
  }*/

}
