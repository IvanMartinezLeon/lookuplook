import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
            ),
            Region(
              identifier: '50765CB7-D9EA-4E21-99A4-FA879613A492',
            )
          ],
          const [],
          const [],
        ),
      );
    } catch (e) {
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

  void beaconsRanging(String beaconUID) async {
    try {
      flutterBeacon.ranging([
        Region(
          identifier: '50765CB7-D9EA-4E21-99A4-FA879613A492',
        ),
      ]).listen((RangingResult result) {
        emit(
          BeaconsLoading(
            state.beaconsList,
            [],
            state.monitoringList,
          ),
        );

        for (Beacon element in result.beacons) {
          if (beaconUID == element.proximityUUID) {
            emit(
              BeaconsLoaded(
                state.beaconsList,
                [element],
                state.monitoringList,
              ),
            );
          }
        }
        print(result.region.toString());
        print(result.beacons.toString());
      });
    } catch (e) {
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
    } catch (e) {
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
