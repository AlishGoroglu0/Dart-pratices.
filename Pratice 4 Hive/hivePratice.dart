import 'package:hive/hive.dart';

class User {
  final String name;
  final int age;
  final String password;

  User({required this.name, required this.age, required this.password});
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.read(),
      age: reader.read(),
      password: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, User object) {
    writer.write(object.name);
    writer.write(object.age);
    writer.write(object.password);
  }
}

void main(List<String> args) async {
  Hive.init("lib/db");
  var register = Hive.registerAdapter(UserAdapter());
  var box = await Hive.openBox("userDB");

  User newUser = new User(name: "Alish", age: 26, password: "123");

  box.put("New_user", newUser);

  User? getUser = box.get("New_user");

  print(getUser?.name);

  await Hive.close();
}
