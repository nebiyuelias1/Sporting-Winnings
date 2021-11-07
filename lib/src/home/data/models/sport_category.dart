import 'package:json_annotation/json_annotation.dart';

enum SportCategory {
  @JsonValue('soccer')
  soccer,
  @JsonValue('tennis')
  tennis,
  @JsonValue('basketball')
  basketball,
  @JsonValue('icehockey')
  hockey
}
