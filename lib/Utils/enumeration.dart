abstract class EnumCreate<T> {
  final T _value;

  const EnumCreate(this._value);

  T get value => _value;
}
