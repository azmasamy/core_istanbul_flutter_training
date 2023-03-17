// ignore_for_file: constant_identifier_names

enum SpaceType {
  MEETING_ROOM,
  SEMINAR_ROOM,
  BRAINSTORMING_AREA,
  STAGE,
  MAIN_HALL
}

class Space {
  final String name;
  final String capacity;
  final List<String> photos;
  final SpaceType spacetype;
  final List instruments;
  final bool isAvailable;

  Space({
    required this.name,
    required this.capacity,
    required this.instruments,
    required this.photos,
    required this.spacetype,
    required this.isAvailable,
  });
}
