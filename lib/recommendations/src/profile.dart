import 'contact.dart';

class Profile {
  final String name;
  final Contact creator;

  Profile(this.creator, this.name);
}

abstract class ProfileFactory {
  Profile create(Contact creator, String name);
}
