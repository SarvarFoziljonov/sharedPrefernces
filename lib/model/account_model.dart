
class Account {
  String name;
  String email;
  String phone;
  String password;
  String confirm;
  Account ({this.name, this.email, this.password, this.confirm, this.phone});
  Account.from({this.name, this.email, this.phone, this.confirm, this.password});
  Account.fromJason(Map <String, dynamic> json)
      : name = json["name"],
        email = json["email"],
        phone = json["phone"],
        password = json["password"],
        confirm = json["confirm"];

  Map<String, dynamic> toJson () => {
    "name" : name,
    "email" : email,
    "phone" : phone,
    'password' : password,
    "confirm" : confirm,

  };

}