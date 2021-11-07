import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';

part 'query.g.dart';

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Query extends Equatable {
  @JsonKey(ignore: false)
  final SportCategory sport;

  @JsonKey(ignore: false, name: 'p', toJson: _pageToJson)
  final int page;

  const Query({required this.sport, this.page = 0});

  Map<String, dynamic> toJson() => _$QueryToJson(this);

  static String _pageToJson(int page) {
    return page.toString();
  }

  @override
  List<Object?> get props => [sport, page];
}
