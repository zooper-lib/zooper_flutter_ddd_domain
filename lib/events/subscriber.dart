import 'event_request.dart';
import 'event_handler.dart';

/// An event subscriber
abstract class Subscriber<TEvent extends EventRequest> {
  final EventHandler _eventHandler;

  Subscriber(
    this._eventHandler,
  ) {
    _eventHandler.on<TEvent>(subscribe);
  }

  Future<void> subscribe(TEvent event);
}
