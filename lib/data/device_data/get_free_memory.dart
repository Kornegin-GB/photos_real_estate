import 'package:storage_space/storage_space.dart';

class GetFreeMemory {
  Future<double> getAmountFreeMemory() async {
    StorageSpace space = await getStorageSpace(
      lowOnSpaceThreshold: 2 * 1024 * 1024,
      fractionDigits: 2,
    );
    return double.parse(space.freeSize.split(" ")[0]);
  }
}
