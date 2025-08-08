import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/network_service.dart';

class NetworkCubit extends Cubit<ConnectionType> {
  final NetworkService _networkService;

  NetworkCubit(this._networkService) : super(ConnectionType.unknown) {
    _init();
  }

  void _init() async {
    final current = await _networkService.getConnectionType();
    emit(current);

    _networkService.onConnectionChange.listen((type) {
      emit(type);
    });
  }
}
