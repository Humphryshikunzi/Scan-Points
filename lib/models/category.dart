class Category {
  final int categoryId;
  final String name;

  Category({required this.categoryId, required this.name});
}

final trainCategory = Category(
  categoryId: 0,
  name: 'ALL',
);

final busCategory = Category(
  categoryId: 1,
  name: 'AVAILABLE',
);

final planeCategory = Category(
  categoryId: 2,
  name: 'FULL',
);

final categories = [
  trainCategory,
  busCategory,
];
