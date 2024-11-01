import 'package:collection/collection.dart';

enum Sector {
  PrivateTutor,
  Babysitter,
  Chef,
  Plumber,
  Electrician,
  Driver,
  CarServices,
  Housekeeper,
}

enum City {
  Riyadh,
  Jeddah,
  Khobar,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Sector):
      return Sector.values.deserialize(value) as T?;
    case (City):
      return City.values.deserialize(value) as T?;
    default:
      return null;
  }
}
