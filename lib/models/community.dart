

import 'package:trible/models/service.dart';

class Community{
  final String name;
  final String creator;
  final List<Service> services;

  Community({ required this.name, required this.creator, required this.services});
}