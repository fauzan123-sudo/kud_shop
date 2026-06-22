abstract class CustomerProductEvent {
  const CustomerProductEvent();
}

class CustomerProductLoad extends CustomerProductEvent {
  const CustomerProductLoad();
}

class CustomerProductSearchChanged extends CustomerProductEvent {
  final String query;
  const CustomerProductSearchChanged(this.query);
}

/// categoryId null artinya "Semua" (tidak ada filter kategori)
class CustomerProductCategoryChanged extends CustomerProductEvent {
  final int? categoryId;
  const CustomerProductCategoryChanged(this.categoryId);
}