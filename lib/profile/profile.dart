import 'package:flutter/material.dart';

import 'src/content.dart';

class ProfilePage extends MaterialPage {
  ProfilePage(ProfileRepo profileRepo) : super(child: ProfileContent());
}

abstract class ProfileRepo {
  Future<Profile> getById(String id);
}

class Profile {}
