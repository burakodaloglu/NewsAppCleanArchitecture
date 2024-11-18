import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class Success<T> extends DataState<T> {
  const Success(T data) : super(data: data);
}

class Error<T> extends DataState<T> {
  const Error(DioError error) : super(error: error);
}
