
import 'package:freezed_annotation/freezed_annotation.dart'; 
part 'supabase_result.freezed.dart';

@freezed
class SupabaseResult<T> with _$SupabaseResult<T> {
  const factory SupabaseResult.success(T data) = Success<T>;
  const factory SupabaseResult.error(String message) = Error<T>;
}
