enum TruckSize {
  wheeler6,
  wheeler10,
  wheeler22,
}

class TruckModel {
  final int id;
  final String truckNumber;
  final String driverName;
  final String companyName;
  final TruckSize truckSize;
  final String contactNumber;

  TruckModel({
    required this.id,
    required this.truckNumber,
    required this.driverName,
    required this.companyName,
    required this.truckSize,
    required this.contactNumber,
  });
}
