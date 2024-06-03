class AccountModel {
  final int id;
  final String title;
  final String img;
  final num openingBalance;

  AccountModel({
    required this.id,
    required this.title,
    required this.img,
    required this.openingBalance,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      openingBalance: json['openingBalance'],
    );
  }
}


  //   return switch (json) {
  //     {
  //     'id': int id,
  //     'title': String title,
  //     'img': String img,
  //     'openingBalance': num openingBalance,
  //     } =>
  //         AccountModel(
  //           img: img,
  //           title: title,
  //           openingBalance: openingBalance,
  //           id: id,
  //         ),
  //     _ => throw const FormatException('Format not supported.'),
  //   };