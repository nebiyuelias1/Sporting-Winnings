import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Team extends Equatable {
  final String name;

  const Team({required this.name});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  @override
  List<Object?> get props => [name];
}
