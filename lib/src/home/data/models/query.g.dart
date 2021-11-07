// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'sport': _$SportCategoryEnumMap[instance.sport],
      'p': Query._pageToJson(instance.page),
    };

const _$SportCategoryEnumMap = {
  SportCategory.soccer: 'soccer',
  SportCategory.tennis: 'tennis',
  SportCategory.basketball: 'basketball',
  SportCategory.hockey: 'icehockey',
};
