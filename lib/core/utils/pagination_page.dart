class Page<T> {
  List<T> items;
  String? lastKey;

  Page({required this.items, this.lastKey});
}