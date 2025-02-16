import 'package:equatable/equatable.dart';

class SubDistrict extends Equatable {
  final String id;
  final String name;
  final String districtId;

  SubDistrict({
    required this.id,
    required this.name,
    required this.districtId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        districtId,
      ];
}
