import '../failure/failure.dart';

class Result<T> {
  final T? _data;
  final Failure? _failure;

  const Result.success(this._data) : _failure = null;
  const Result.failure(this._failure) : _data = null;

  bool get isSuccess => _data != null;
  T get data => _data!;
  Failure get error => _failure!;

  void when({
    required void Function(T) onSuccess,
    void Function(Failure)? onFailure,
  }) {
    if (_data != null) {
      onSuccess(data);
    } else {
      onFailure?.call(error);
    }
  }
}
