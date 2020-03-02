import 'dart:async';

typedef FutureOr<T> BusSubscription<T>(dynamic event);

class Bus {
  dispatch(dynamic event) {
    _subscriptions.forEach((f) async => await f(event));
  }

  List<BusSubscription> _subscriptions = [];

  on(BusSubscription subscription) {
    _subscriptions.add(subscription);
  }

  forget(BusSubscription subscription) {
    _subscriptions.remove(subscription);
  }
}
