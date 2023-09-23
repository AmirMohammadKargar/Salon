class PaginationEntity<T> {
  List<T> data;
  int lastPage;
  PaginationEntity({required this.data, required this.lastPage});
}
