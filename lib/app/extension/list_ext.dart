extension ListExtension<E> on List<E> {
  E? firstElement(bool test(E element)) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}