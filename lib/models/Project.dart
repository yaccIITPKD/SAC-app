class Project {
  int? id;
  String title;
  String status;
  int totalMembers;
  int currentMembers;
  String clubName;
  List<String> techStack;
  String shortDescription;
  String longDescription;
  String logo;
  String date;
  int year;

  Project(
      {this.id,
      required this.title,
      required this.status,
      required this.totalMembers,
      required this.currentMembers,
      required this.clubName,
      required this.techStack,
      required this.shortDescription,
      required this.logo,
      required this.date,
        required this.year,
      required this.longDescription});
}
