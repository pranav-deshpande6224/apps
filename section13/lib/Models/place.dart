import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String placeTitle;
  final String id;
  Place({required this.placeTitle}) : id = uuid.v4();
}

// Added 