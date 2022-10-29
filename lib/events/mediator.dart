import 'event_handler.dart';
import 'event_request.dart';

/// The [Mediator] is a dispather for [EventRequest]s.
///
/// In order to use it, you need to provide an implementation of [EventHandler]
class Mediator {
  final EventHandler _eventHandler;

  Mediator(this._eventHandler);

  Future<void> dispatch<TEvent extends EventRequest>(TEvent eventToDispatch) async {
    _eventHandler.fire(eventToDispatch);
  }
}
