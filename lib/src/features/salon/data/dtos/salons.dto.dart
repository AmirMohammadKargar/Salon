class SalonsDto {
  final int page;
  final String? search;
  SalonsDto({required this.page, this.search});

  Map<String, dynamic> toJson() {
    var parmas = <String, dynamic>{};
    if (search != null && search != '') {
      parmas['search'] = search;
    }
    parmas['page'] = page;
    parmas['limit'] = 20;
    return parmas;
  }
}
