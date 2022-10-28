import 'package:zooper_flutter_ddd_domain/zooper_flutter_ddd_domain.dart';

/// The abstract [UseCase] has to be implemented by all usecases.
/// It is the handler for the domain logic.
/// [TResponse] Is the type to be returned by the [UseCase].
/// [TRequest] Is the object passed to the usecase containing all the needed parameters
/// for the [UseCase]
///
/// The [UseCase] represents a business-level process. It should be written purely
/// in `Dart` and `MUST NOT` include any `Flutter` code whatsoever. The [UseCase] is a part
/// of the `Domain` module of the application in the `Clean Architecture`.
abstract class UseCase<TResponse, TRequest> {
  Future<Result<TResponse>> call(TRequest params);
}

abstract class SyncUseCase<TResponse, TRequest> {
  Result<TResponse> call(TRequest params);
}
