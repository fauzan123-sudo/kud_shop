abstract class AddressEvent {
  const AddressEvent();
}

class AddressLoad extends AddressEvent {
  const AddressLoad();
}

class AddressCreate extends AddressEvent {
  final String recipientName;
  final String phone;
  final String address;
  final bool isDefault;

  const AddressCreate({
    required this.recipientName,
    required this.phone,
    required this.address,
    this.isDefault = false,
  });
}

class AddressUpdate extends AddressEvent {
  final int id;
  final String recipientName;
  final String phone;
  final String address;

  const AddressUpdate({
    required this.id,
    required this.recipientName,
    required this.phone,
    required this.address,
  });
}

class AddressDelete extends AddressEvent {
  final int id;
  const AddressDelete({required this.id});
}

class AddressSetDefault extends AddressEvent {
  final int id;
  const AddressSetDefault({required this.id});
}