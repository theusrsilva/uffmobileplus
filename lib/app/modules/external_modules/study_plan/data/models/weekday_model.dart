import 'package:hive/hive.dart';

part 'weekday_model.g.dart';

@HiveType(typeId: 19)
enum WeekDay {
  @HiveField(0)
  monday ("segunda"),
  @HiveField(1)
  tuesday ("terca"),
  @HiveField(2)
  wednesday ("quarta"),
  @HiveField(3)
  thursday ("quinta"),
  @HiveField(4)
  friday ("sexta"),
  @HiveField(5)
  saturday ("sabado");

  final String description;
  const WeekDay(this.description);
}

String dataToString(WeekDay day) {
  switch (day) {
    case WeekDay.monday:
      return "Segunda";

    case WeekDay.tuesday:
      return "Terça";

    case WeekDay.wednesday:
      return "Quarta";

    case WeekDay.thursday:
      return "Quinta";

    case WeekDay.friday:
      return "Sexta";

    case WeekDay.saturday:
      return "Sábado";
  }
}
