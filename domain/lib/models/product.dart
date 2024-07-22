class Product {
  final int id;
  final String title;
  final String description;
  final double discountPercentage;
  final double price;
  final String thumbnail;
  final bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.discountPercentage,
      required this.price,
      required this.thumbnail,
      this.isFavorite = false});

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? discountPercentage,
    double? price,
    String? thumbnail,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          discountPercentage == other.discountPercentage &&
          price == other.price &&
          thumbnail == other.thumbnail &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      discountPercentage.hashCode ^
      price.hashCode ^
      thumbnail.hashCode ^
      isFavorite.hashCode;

  @override
  String toString() {
    return 'Product{id: $id, title: $title, description: $description, discountPercentage: $discountPercentage, price: $price, thumbnail: $thumbnail, isFavorite: $isFavorite}';
  }
}
