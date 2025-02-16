import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String id;
  final String name;
  final String provinceId;

  City({required this.id, required this.name, required this.provinceId});

  @override
  List<Object?> get props => [id, name, provinceId];
}
