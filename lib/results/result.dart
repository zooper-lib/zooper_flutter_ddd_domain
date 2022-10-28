import 'package:zooper_flutter_ddd_domain/zooper_flutter_ddd_domain.dart';

class Result<TData> {
  final TData? data;
  final List<Failure>? failures;
  bool get isSuccess => failures?.isEmpty ?? true;
  bool get hasFailure => failures?.isNotEmpty ?? false;

  Result._(this.data, this.failures);

  factory Result.data(TData data) {
    return Result._(data, null);
  }

  factory Result.success() {
    return Result._(null, null);
  }

  factory Result.failure(Failure failure) {
    return Result._(null, [failure]);
  }

  factory Result.failures(List<Failure> failures) {
    return Result._(null, failures);
  }

  Future onSuccess(Function func) async {
    if (isSuccess) {
      await func.call();
    }
  }

  Future onFailure(Function func) async {
    if (hasFailure) {
      await func.call();
    }
  }
}
