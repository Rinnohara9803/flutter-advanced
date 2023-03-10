import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isNetworkAvailable;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;
  NetworkInfoImpl(this._dataConnectionChecker);
  @override
  Future<bool> get isNetworkAvailable => _dataConnectionChecker.hasConnection;
}
