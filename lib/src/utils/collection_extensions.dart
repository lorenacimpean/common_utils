extension IterableExtensions<T> on Iterable<T>? {
  /// Returns `true` if the collection is not null and not empty.
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  /// Returns `true` if the collection is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
