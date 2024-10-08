class Meta {
  final int? total;
  final int? to;
  final int? currentPage;
  final int? lastPage;

  Meta({
    required this.total,
    required this.to,
    required this.currentPage,
    required this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastPage: json['last_page'],
      total: json['total'],
      currentPage: json['current_page'],
      to: json['to'],
    );
  }
}
