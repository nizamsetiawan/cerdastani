import 'package:equatable/equatable.dart';

class Province extends Equatable {
  final String id;
  final String name;

  const Province({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}