// model

class UserDonor {
  final int? id;
  final String Name;
  final String Bloodgroup;
  final String City;
  final String Area;
  final String Number;

  const UserDonor({
    this.id,
    required this.Name,
    required this.Bloodgroup,
    required this.City,
    required this.Area,
    required this.Number,
  });
  tojason() {
    return {
      'Name': Name,
      'Number': Number,
      'Blood Group': Bloodgroup,
      'City': City,
      'Area': Area,
    };
  }
}
