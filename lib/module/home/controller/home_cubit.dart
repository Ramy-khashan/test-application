import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_application/core/utils/storage_key.dart';

import '../../../core/utils/functions/random_nuber.dart';
import '../../../core/utils/functions/shared_preferance_utils.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Color color = Colors.white;
  int savedColorValue = 0;
  Timer? timer;
  bool playAuto = false;

  
  getSavedColor() {
    savedColorValue = int.parse(
        PreferenceUtils.getString(StorageKey.savedColor, "-1").toString());
    if (savedColorValue == -1) {
      color = Colors.white;
    } else {
      color = Colors.primaries[savedColorValue];
    }

    emit(SavedColorState());
  }

  getRandomColor() {
    emit(StartProcessState());
    int colorIndex = getRanomNumber();
    savedColorValue = colorIndex % Colors.primaries.length;
    color = Colors.primaries[colorIndex % Colors.primaries.length];
    PreferenceUtils.setString(
        StorageKey.savedColor, savedColorValue.toString());
    emit(EndProcessState());
  }

  autoWorking() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      getRandomColor();
    });
  }

  changeColorAuto() {
    playAuto = !playAuto;
    playAuto == false ? timer!.cancel() : autoWorking();
    emit(ChangeColorAuto());
  }

  @override
  Future<void> close() {
    timer!.cancel();
    return super.close();
  }
}
