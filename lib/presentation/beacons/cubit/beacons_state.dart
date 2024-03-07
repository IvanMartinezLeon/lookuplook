part of 'beacons_cubit.dart';

sealed class BeaconsState extends Equatable {
  final List<Region> beaconsList;
  final Beacon? rangingList;
  const BeaconsState(this.beaconsList, this.rangingList);

  @override
  List<Object> get props => [beaconsList];
}

final class BeaconsInitial extends BeaconsState {
  const BeaconsInitial() : super(const [], null);
}

final class BeaconsActive extends BeaconsState {
  const BeaconsActive(super.beaconsList, super.rangingList);
}

final class BeaconsLoading extends BeaconsState {
  const BeaconsLoading(super.beaconsList, super.rangingList);
}

final class BeaconsLoaded extends BeaconsState {
  const BeaconsLoaded(super.beaconsList, super.rangingList);
}

final class BeaconsError extends BeaconsState {
  final String message;

  const BeaconsError(super.beaconsList, super.rangingList,
      {required this.message});

  @override
  List<Object> get props => [beaconsList, message];
}
