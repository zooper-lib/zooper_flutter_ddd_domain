import 'event_request.dart';

/// An event handler which can be injected
abstract class EventHandler {
  void fire(EventRequest event);

  void on<T extends EventRequest>(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  });
}
