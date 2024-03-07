part of 'beacons_cubit.dart';

sealed class BeaconsState extends Equatable {
  final List<Region> beaconsList;
  final List<Beacon> rangingList;
  final List<MonitoringResult> monitoringList;
  const BeaconsState(this.beaconsList, this.rangingList, this.monitoringList);

  @override
  List<Object> get props => [beaconsList];
}

final class BeaconsInitial extends BeaconsState {
  const BeaconsInitial() : super(const [], const [], const []);
}

final class BeaconsActive extends BeaconsState {
  const BeaconsActive(
      super.beaconsList, super.rangingList, super.monitoringList);
}

final class BeaconsLoading extends BeaconsState {
  const BeaconsLoading(
      super.beaconsList, super.rangingList, super.monitoringList);
}

final class BeaconsLoaded extends BeaconsState {
  const BeaconsLoaded(
      super.beaconsList, super.rangingList, super.monitoringList);
}

final class BeaconsError extends BeaconsState {
  final String message;

  const BeaconsError(super.beaconsList, super.rangingList, super.monitoringList,
      {required this.message});

  @override
  List<Object> get props => [beaconsList, message];
}
