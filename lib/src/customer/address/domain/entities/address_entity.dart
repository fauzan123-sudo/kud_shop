class AddressEntity {
  final int id;
  final String recipientName;
  final String phone;
  final String address;
  final bool isDefault;

  const AddressEntity({
    required this.id,
    required this.recipientName,
    required this.phone,
    required this.address,
    required this.isDefault,
  });

  AddressEntity copyWith({
    int? id,
    String? recipientName,
    String? phone,
    String? address,
    bool? isDefault,
  }) {
    return AddressEntity(
      id: id ?? this.id,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddressEntity &&
        other.id == id &&
        other.recipientName == recipientName &&
        other.phone == phone &&
        other.address == address &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode => Object.hash(id, recipientName, phone, address, isDefault);
}
