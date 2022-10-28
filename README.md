# Zooper Flutter DDD Domain

This project aims to provide helper classes which should help you implementing the Domain Driven Design into your flutter application.
Reference this package from your Domain project.

# Installation

Add this line into your `pubspec.yaml`:

``` yaml
zooper_flutter_ddd_domain: <version>
```

And in your class:

``` dart
import 'package:zooper_flutter_ddd_domain/zooper_flutter_ddd_domain.dart';
```

# Usage

## UseCases

The UseCases come with an async and an sync version of the 'call()' function. Just implement your own class and extend the appropriate UseCase.
The 'call()' function returns an 'Result' object, which is a generic class. If you want to return something from that UseCase, you can define it when extending it:

``` dart
class TestUseCase extends UseCase<bool, Params> {
  @override
  Future<Result<bool>> call(Params params) async ...
}
```

Or if you don't want to return anything, just use 'void':

``` dart
class TestUseCase extends UseCase<void, void> {
  @override
  Future<Result> call(void params) async {
    return Result.success();
  }
```