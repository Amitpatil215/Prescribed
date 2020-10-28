class DegreeField {
  static const _degreeField = <Map<String, dynamic>>[
    {
      'degree': "Gynecologist",
      'field': [
        "DNB-Gynecology",
        "MS-Obstetrics & Gynecolgy",
        "DGO",
        "MD-GYNECOLGY",
        "MS-GYNECOLOGY"
      ],
    },
  ];

  Future<List<String>> degreeList(String value) async {
    print(value);
    await Future.delayed(Duration(seconds: value.length == 4 ? 10 : 1));
    return _degreeField.map((e) {
      print(e['degree']);
      return e['degree'];
    }).toList();
  }
}
