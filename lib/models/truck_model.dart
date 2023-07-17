enum TruckSize {
  wheeler6,
  wheeler10,
  wheeler22,
}

class TruckModel {
  final String id;
  final String truckNumber;
  final String driverName;
  final String companyName;
  final TruckSize truckSize;
  final String contactNumber;

  TruckModel(
    this.id,
    this.truckNumber,
    this.driverName,
    this.companyName,
    this.truckSize,
    this.contactNumber,
  );
}
