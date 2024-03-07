part of 'beacons_cubit.dart';

sealed class BeaconsState extends Equatable {
  const BeaconsState();

  @override
  List<Object> get props => [];
}

final class BeaconsInitial extends BeaconsState {}

final class BeaconsLoading extends BeaconsState {}

final class BeaconsLoaded extends BeaconsState {}

final class BeaconsError extends BeaconsState {
  final String message;

  const BeaconsError({required this.message});

  @override
  List<Object> get props => [message];
}
