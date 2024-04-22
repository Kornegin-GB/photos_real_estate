import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_real_estate/data/device_data/get_free_memory.dart';

part 'device_data_event.dart';
part 'device_data_state.dart';

class DeviceDataBloc extends Bloc<DeviceDataEvent, DeviceDataState> {
  DeviceDataBloc(this._amountFreeMemory) : super(DeviceDataInitial()) {
    on<LoadDeviceData>(_loadDeviceData);
  }

  final GetFreeMemory _amountFreeMemory;

  Future<void> _loadDeviceData(
    LoadDeviceData event,
    Emitter<DeviceDataState> emit,
  ) async {
    emit(DeviceDataLoading());
    final deviceTotalMemory = await _amountFreeMemory.getAmountFreeMemory();
    emit(DeviceDataLoaded(deviceTotalMemory: deviceTotalMemory));
  }
}
