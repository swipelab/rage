class MxUnsigned {
  final int age;

  MxUnsigned({this.age});

  static MxUnsigned fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxUnsigned(
          age: json['age'],
        );
}
