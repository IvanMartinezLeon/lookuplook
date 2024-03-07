import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:permission_handler/permission_handler.dart';

part 'beacons_state.dart';

class BeaconsCubit extends Cubit<BeaconsState> {
  BeaconsCubit() : super(const BeaconsInitial());
  void beaconsInit() async {
    try {
      PermissionStatus locationPermission = await Permission.location.request();
      PermissionStatus blePermission = await Permission.bluetooth.request();
      PermissionStatus bleScan = await Permission.bluetoothScan.request();
      PermissionStatus bleConnect = await Permission.bluetoothConnect.request();
      await flutterBeacon.initializeScanning;
      await flutterBeacon.initializeAndCheckScanning;
      emit(
        BeaconsActive(
          [
            Region(
              identifier: '2f234454-cf6d-4a0f-adf2-f4911ba9ffa6',
            )
          ],
          const [],
          const [],
        ),
      );
    } on PlatformException catch (e) {
      emit(
        BeaconsError(
          state.beaconsList,
          const [],
          const [],
          message: e.toString(),
        ),
      );
    }
  }

  void beaconsRanging() async {
    try {
      List<RangingResult> resultRangeList = [];

      print('hohoohohoho');

      var _streamRanging = flutterBeacon
          .ranging(state.beaconsList)
          .listen((RangingResult result) {
        print('hohoohohoho');

        resultRangeList.add(result);
        emit(
          BeaconsLoaded(
            state.beaconsList,
            resultRangeList.toSet().toList(),
            state.monitoringList,
          ),
        );
      });
    } on PlatformException catch (e) {
      emit(
        BeaconsError(
          state.beaconsList,
          state.rangingList,
          state.monitoringList,
          message: e.toString(),
        ),
      );
    }
  }

  void beaconsMonitoring() async {
    try {
      List<MonitoringResult> resultMonitoringList = [];
      flutterBeacon
          .monitoring(state.beaconsList)
          .listen((MonitoringResult result) {
        resultMonitoringList.add(result);

        emit(
          BeaconsLoaded(
            state.beaconsList,
            state.rangingList,
            resultMonitoringList.toSet().toList(),
          ),
        );
      });
    } on PlatformException catch (e) {
      emit(
        BeaconsError(
          state.beaconsList,
          state.rangingList,
          state.monitoringList,
          message: e.toString(),
        ),
      );
    }
  }
}
