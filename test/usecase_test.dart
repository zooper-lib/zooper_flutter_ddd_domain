import 'package:flutter_test/flutter_test.dart';
import 'package:zooper_flutter_ddd_domain/zooper_flutter_ddd_domain.dart';

void main() async {
  test('Compare string UseCase - Equal', () async {
    var useCase = CompareStringsUseCase();

    var result = await useCase(CompareStringsUseCaseParams('ABC', 'ABC'));
    expect(result.isSuccess, true);
    expect(result.data, true);
  });

  test('Compare string UseCase - Not Equal', () async {
    var useCase = CompareStringsUseCase();

    var result = await useCase(CompareStringsUseCaseParams('cde', 'ABC'));
    expect(result.isSuccess, true);
    expect(result.data, false);
  });

  test('Compare string UseCase - Failure', () async {
    var useCase = CompareStringsUseCase();

    var result = await useCase(CompareStringsUseCaseParams(null, 'ABC'));
    expect(result.hasFailure, true);
    expect(result.failures!.first.runtimeType, NullFailure);
  });
}

class CompareStringsUseCase extends UseCase<bool, CompareStringsUseCaseParams> {
  @override
  Future<Result<bool>> call(CompareStringsUseCaseParams params) async {
    if (params.firstString == null || params.secondString == null) {
      return Result.failure(NullFailure('Parameter must not be null'));
    }

    var equals = params.firstString == params.secondString;
    return Result.data(equals);
  }
}

class CompareStringsUseCaseParams {
  final String? firstString;
  final String? secondString;

  CompareStringsUseCaseParams(this.firstString, this.secondString);
}

class NullFailure extends Failure {
  NullFailure(super.message);
}
