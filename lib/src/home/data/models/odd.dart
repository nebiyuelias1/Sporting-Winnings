import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'odd.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Odd extends Equatable {
  @JsonKey(name: 'home_od', fromJson: _oddFromJson)
  final double? homeOdd;

  @JsonKey(name: 'draw_od', fromJson: _oddFromJson)
  final double? drawOdd;

  @JsonKey(name: 'away_od', fromJson: _oddFromJson)
  final double? awayOdd;

  const Odd(
      {required this.homeOdd, required this.drawOdd, required this.awayOdd});

  factory Odd.fromJson(Map<String, dynamic> json) => _$OddFromJson(json);

  @override
  List<Object?> get props => [homeOdd, drawOdd, awayOdd];

  static double? _oddFromJson(String? value) {
    if (value != null) {
      return double.parse(value);
    }
  }
}
