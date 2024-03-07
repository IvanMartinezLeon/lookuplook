import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';

part 'beacons_state.dart';

class BeaconsCubit extends Cubit<BeaconsState> {
  BeaconsCubit() : super(BeaconsInitial());
  void beaconsInit() async {
    try {
      await flutterBeacon.initializeScanning;
      await flutterBeacon.initializeAndCheckScanning;
    } on PlatformException catch (e) {
      emit(BeaconsError(message: e.toString()));
    }
  }
}
