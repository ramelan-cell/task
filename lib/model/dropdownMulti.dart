class DropDownMultiList {
  final String id;
  final String name;

  DropDownMultiList({
    required this.id,
    required this.name,
  });

  factory DropDownMultiList.fromJson(Map<String, dynamic> json) {
    return DropDownMultiList(
      id: json['id'],
      name: json['name'],
    );
  }
}
