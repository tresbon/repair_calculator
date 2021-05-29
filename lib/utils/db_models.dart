class Purchase {
  final int id;
  final String type;
  final int quantity;
  final String comment;

  Purchase({this.id, this.type, this.quantity, this.comment});

  Map<String, dynamic> toMap() {
    return {
      "id": id == 0 ? null : id,
      "type": type,
      "quantity": quantity,
      "comment": comment
    };
  }
}
