class Product {
  final int id;
  final String title;
  final String description;
  final double discountPercentage;
  final double price;
  final String thumbnail;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.discountPercentage,
    required this.price,
    required this.thumbnail,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? discountPercentage,
    double? price,
    String? thumbnail,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, discountPercentage: $discountPercentage, price: $price, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.discountPercentage == discountPercentage &&
        other.price == price &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        discountPercentage.hashCode ^
        price.hashCode ^
        thumbnail.hashCode;
  }
}
