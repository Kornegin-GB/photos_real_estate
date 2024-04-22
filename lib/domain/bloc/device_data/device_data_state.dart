part of 'device_data_bloc.dart';

sealed class DeviceDataState {}

final class DeviceDataInitial extends DeviceDataState {}

final class DeviceDataLoading extends DeviceDataState {}

final class DeviceDataLoaded extends DeviceDataState {
  double deviceTotalMemory;

  DeviceDataLoaded({required this.deviceTotalMemory});
}

final class DeviceDataException extends DeviceDataState {
  late Object exception;

  DeviceDataException({required this.exception});
}
