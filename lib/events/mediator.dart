import 'event_handler.dart';
import 'event_request.dart';

/// The [Mediator] is a dispather for [EventRequest]s.
///
/// In order to use it, you need to provide an implementation of [EventHandler]
abstract class Mediator {
  Future<void> dispatch<TEvent extends EventRequest>(TEvent eventToDispatch);
}
