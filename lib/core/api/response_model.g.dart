// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseModel<T> _$ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _ResponseModel<T>(
  data: fromJsonT(json['data']),
  message: json['message'] as String?,
  meta: json['meta'] == null
      ? null
      : Pagination.fromJson(json['meta'] as Map<String, dynamic>),
  code: (json['code'] as num?)?.toInt(),
);

Map<String, dynamic> _$ResponseModelToJson<T>(
  _ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'message': instance.message,
  'meta': instance.meta,
  'code': instance.code,
};

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  page: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  totalPages: (json['last_page'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.page,
      'per_page': instance.perPage,
      'last_page': instance.totalPages,
      'total': instance.total,
    };
