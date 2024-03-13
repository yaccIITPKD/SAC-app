import '../exports.dart';

class OngoingProjectScreen extends StatefulWidget {
  const OngoingProjectScreen({super.key});

  static String id = "Ongoing Project";

  @override
  State<OngoingProjectScreen> createState() => _OngoingProjectScreenState();
}

class _OngoingProjectScreenState extends State<OngoingProjectScreen> {
  TextEditingController searchController = TextEditingController();

  List<Project?> onScreenProjects = projects;

  bool buttonPressed = false;
  bool isLoading = false;

  final List<String> listitems = ["All", "Ongoing", "Onhold", "Completed"];
  String selectval = "All";

  void orderProjectsIn(String orderBy) {
    setState(() {
      debugPrint("Helo");
      switch (orderBy) {
        case "All":
          onScreenProjects = projects;
          break;
        default:
          onScreenProjects = [];
          for (Project project in projects) {
            if (project.status == orderBy) {
              onScreenProjects.add(project);
            }
          }
      }
    });
  }

  void searchedFor(String searchString) {
    if (searchString.isEmpty) {
      orderProjectsIn(selectval);
    } else {
      setState(() {
        searchString = searchString.toLowerCase();
        onScreenProjects = [];
        for (Project project in projects) {
          if (project.title.toLowerCase().contains(searchString)) {
            onScreenProjects.add(project);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        key: const Key("OngoingProjects"),
        child: Scaffold(
            body: // Top Search Bar,
                // A Button : Start A Project / Looking For a team
                //        List View For the projectCard
                Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(children: [
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  trailing: [
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          searchController.text = "";
                        });
                        searchedFor("");
                      },
                    )
                  ],
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 10)),
                  leading: Icon(Icons.search),
                  elevation: MaterialStateProperty.all<double>(2),
                  controller: searchController,
                  onSubmitted: (String val) {
                    searchedFor(val);
                  },
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: (BorderSide(color: Colors.grey))),
              ),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            elevation: 0),
                        //Elevated Button Background
                        onPressed: () {},
                        //make onPressed callback empty
                        child: DropdownButton(
                          //Dropdown font color
                          icon: Icon(Icons.sort),
                          //dropdown indicator icon

                          underline: Container(),
                          //make underline empty
                          value: selectval,
                          onChanged: (value) {
                            setState(() {
                              selectval = value.toString();
                              orderProjectsIn(selectval);
                            });
                          },
                          items: listitems.map((itemone) {
                            return DropdownMenuItem(
                                value: itemone, child: Text(itemone));
                          }).toList(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, NewProjectScreen.id);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                side: BorderSide(
                                  color: Colors.grey,
                                ))),
                        icon: const SizedBox(
                          width: 110,
                          child: Row(
                            children: [Icon(Icons.add), Text('New Project')],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            !isLoading
                ? Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: onScreenProjects.length,
                      itemBuilder: (context, index) =>
                          ProjectCard(project: onScreenProjects[index]),
                    ),
                  )
                : const CircularProgressIndicator(),
          ]),
        )
            // Floating Action Button to show the pending requests(only for admins)
            ));
  }
}
