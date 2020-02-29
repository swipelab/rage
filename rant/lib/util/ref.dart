import 'package:flutter/widgets.dart';
import 'package:scoped/scoped.dart';

class Ref<T> with Fluid {
  Ref([this._value]);

  T _value;

  T get value => _value;

  bool get hasValue => _value != null;

  set value(T value) {
    _value = value;
    this.notify();
  }
}

typedef Widget ValueBuilderFn<T>(BuildContext context, T value);

extension Binders on BuildContext {
  ref<T>(Ref<T> ref, ValueBuilderFn<T> builder) =>
      Bond<Ref<T>>(fluid: ref, builder: (context, s) => builder(context, s.value));
}
