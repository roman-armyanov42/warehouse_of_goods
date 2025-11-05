sealed class ProductFailure {
  final String message;
  const ProductFailure(this.message);

  factory ProductFailure.unknown({String? message}) = _Unknown;
  factory ProductFailure.db({String? message}) = _DbError;
}

class _Unknown extends ProductFailure {
  const _Unknown({String? message}) : super(message ?? 'Неизвестная ошибка');
}

class _DbError extends ProductFailure {
  const _DbError({String? message})
    : super(message ?? 'Ошибка получения данных из БД');
}
