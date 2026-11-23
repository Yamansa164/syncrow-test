import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResponseModel<T> with _$ResponseModel<T> {
  const factory ResponseModel({
    required T data,
    required String? message,
    required Pagination? meta,
    required int? code,
  }) = _ResponseModel<T>;

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ResponseModelFromJson(json, fromJsonT);
}

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(name: 'current_page') required int? page,
    @JsonKey(name: 'per_page') required int? perPage,
    @JsonKey(name: 'last_page') required int? totalPages,
    required int? total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

extension PaginationMeta on Pagination? {
  /// Whether a page follows the one this meta describes — the answer every
  /// paged list needs from `current_page` / `last_page`.
  ///
  /// An endpoint that sends no meta is treated as a single page, so a list
  /// never keeps asking for a page 2 that will never come.
  bool get hasMorePages {
    final meta = this;
    if (meta == null) return false;
    return (meta.page ?? 0) < (meta.totalPages ?? 0);
  }
}
