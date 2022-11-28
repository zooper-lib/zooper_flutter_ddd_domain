import 'package:zooper_flutter_ddd_domain/zooper_flutter_ddd_domain.dart';

class BasicMediator extends Mediator {
  final EventHandler _eventHandler;

  BasicMediator(this._eventHandler);

  @override
  Future<void> dispatch<TEvent extends EventRequest>(TEvent eventToDispatch) async {
    _eventHandler.fire(eventToDispatch);
  }
}
