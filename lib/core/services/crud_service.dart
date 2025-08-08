import 'package:supabase_flutter/supabase_flutter.dart';
class SupabaseCrudService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> insert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final response = await _client.from(table).insert(data);
    _handleError(response);
  }

  Future<List<dynamic>> getAll({
    required String table,
  }) async {
    final response = await _client.from(table).select();
    _handleError(response);
    return response;
  }

  Future<Map<String, dynamic>?> getById({
    required String table,
    required String column,
    required dynamic id,
  }) async {
    final response = await _client.from(table).select().eq(column, id).maybeSingle();
    _handleError(response);
    return response;
  }

  Future<void> update({
    required String table,
    required Map<String, dynamic> data,
    required String column,
    required dynamic id,
  }) async {
    final response = await _client.from(table).update(data).eq(column, id);
    _handleError(response);
  }

  Future<void> delete({
    required String table,
    required String column,
    required dynamic id,
  }) async {
    final response = await _client.from(table).delete().eq(column, id);
    _handleError(response);
  }

  void _handleError(dynamic response) {
    if (response is PostgrestException) {
      throw Exception('Supabase Error: ${response.message}');
    }
  }
}
