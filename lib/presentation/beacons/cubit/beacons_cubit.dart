import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_beacon/flutter_beacon.dart';
import 'package:permission_handler/permission_handler.dart';

part 'beacons_state.dart';

class BeaconsCubit extends Cubit<BeaconsState> {
  BeaconsCubit() : super(const BeaconsInitial());
  void beaconsInit() async {
    try {
      await Permission.location.request();
      await Permission.bluetooth.request();
      await Permission.bluetoothScan.request();
      await Permission.bluetoothConnect.request();
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
          null,
        ),
      );
    } catch (e) {
      emit(
        BeaconsError(
          state.beaconsList,
          null,
          message: e.toString(),
        ),
      );
    }
  }

  void beaconsClose() {
    flutterBeacon.close;
    emit(
      BeaconsActive(
        state.beaconsList,
        null,
      ),
    );
  }

  void beaconsRanging(String beaconUID) async {
    try {
      flutterBeacon.close;
      flutterBeacon.ranging([
        Region(
          identifier: beaconUID,
        ),
      ]).listen((RangingResult result) {
        emit(
          BeaconsLoading(
            state.beaconsList,
            null,
          ),
        );

        for (Beacon element in result.beacons) {
          if (beaconUID.toUpperCase() == element.proximityUUID.toUpperCase()) {
            emit(
              BeaconsLoaded(
                state.beaconsList,
                element,
              ),
            );
          }
        }
      });
    } catch (e) {
      emit(
        BeaconsError(
          state.beaconsList,
          state.rangingList,
          message: e.toString(),
        ),
      );
    }
  }
}
