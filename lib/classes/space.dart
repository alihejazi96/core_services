enum Spacetype {
  meetingRoom,
  seminarRoom,
  brainstormingArea,
  stage,
  mainHall

}

class Space {
  final String name;
  final String capacity;
  final List<String> photos;
  final Enum spacetype;
  final List instruments;

  Space(
          {
            required this.name,
            required this.capacity,
            required this.instruments,
            required this.photos,
            required this.spacetype
          }
       );
}
