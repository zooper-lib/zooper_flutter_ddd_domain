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

The UseCases come with an async and an sync version of the `call()` function. Just implement your own class and extend the appropriate UseCase.
The `call()` function returns an `Result` object, which is a generic class. If you want to return something from that UseCase, you can define it when extending it:

``` dart
class TestUseCase extends AsyncUseCase<bool, Params> {
  @override
  Future<Result<bool>> call(Params params) async ...
}
```

Or if you don't want to return anything, just use `void`:

``` dart
class TestUseCase extends AsyncUseCase<void, void> {
  @override
  Future<Result> call(void params) async {
    return Result.success();
  }
```

The `AsyncUseCase` and `SyncUseCase` classes are just helpers to use the `UseCase` as it is meant to be, but you can also just extend from `UseCase` directly

## Events

### Mediator

The Mediator is used to send events through your app. This is very useful if you work with patterns like MVVM, where the ViewModels don't know about each other, but should react on changes, for example.

In order to use the `Mediator`, you have to provide an implementation of `EventHandler`. A good starting point is using [event_bus](https://pub.dev/packages/event_bus) package.

> **NOTE**
>
> We recommend using an dependency injection package to register the `Mediator` and `EventHandler` as it simplifies your code a lot

### Subscriber

The `Subscriber` is the equivalent to the `Mediator`, but it only subscribes to a specific event. This class should not be used from another one, else it is best to register an implementation via dependency injection as singleton and react on the event. If you want to use a `Subscriber` inside a class, you better should use the `EventHandler`.

### EventHandler

This is the brain of the whole event system. You must provide an implementation in order to use any of the event classes. The `EventHandler` is also meant to be used from within another class, for example from your `ViewModel`.

Example:

``` dart
class TestViewModel 
{
  TestViewModel(EventHandler eventHandler)
  {
    eventHandler.on<TestEvent>((event) {
      // Do something with your event here
    });

    eventHandler.fire(TestEvent());
  }
}
```