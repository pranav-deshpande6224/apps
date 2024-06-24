import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}

class UserNotifier extends StateNotifier<User>
{
  // we need to create the constructor i.e super.state
  UserNotifier(super.state);
  void updateName(String n){
    
  }
  
}
