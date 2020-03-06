class MxUnsigned {
  final int age;

  MxUnsigned({this.age});

  static MxUnsigned fromJson(Map<String, dynamic> json) => MxUnsigned(
    age: json['age'],
  );
}

