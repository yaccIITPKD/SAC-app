import '../exports.dart';

class ProjectCard extends StatelessWidget {
  final Project? project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return (project != null)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 7, color: Colors.grey, spreadRadius: -1)
              ]),
              width: double.maxFinite,
              height: project!.techStack.isNotEmpty ? 200 : 180,
              child: Card(
                elevation: 0,
                color: Colors.white,
                shadowColor: Colors.grey.shade500,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: project!.techStack.isNotEmpty ? 2 : 3,
                        child: GestureDetector(
                          onTap: () {
                            currentProject = project!;
                            Navigator.pushNamed(context, ProjectScreen.id);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade500))),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      height: 50,
                                      // color: Colors.red,
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image: AssetImage(project!.logo),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            project!.clubName,
                                            style:
                                                const TextStyle(fontSize: 11),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            project!.title,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 5,
                                            width: 70,
                                            // padding: const EdgeInsets.symmetric(
                                            //     horizontal: 4, vertical: 0),
                                            decoration: BoxDecoration(
                                                color: statusColor[
                                                    project!.status],
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                project!.status,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: (project!.currentMembers <
                                                  project!.totalMembers)
                                              ? () {
                                                  // Just a SnackBar message for now
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Your request has been sent to the respective club Head.')));
                                                }
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              backgroundColor: Colors.white,
                                              shadowColor: Colors.grey),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.add),
                                              Text('JOIN')
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                              "Members : ${project!.currentMembers}/${project!.totalMembers}"))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            project!.techStack.isNotEmpty
                                ? Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: ListView.builder(
                                        itemCount: project!.techStack.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        side: BorderSide(
                                                          color: Colors.grey,
                                                        )),
                                              ),
                                              onPressed: () async {
                                                var techStack = project!
                                                    .techStack[index]
                                                    .toLowerCase();
                                                Uri? url = null;
                                                for (String tStack
                                                    in urlToTechStack.keys) {
                                                  if (tStack
                                                      .contains(techStack)) {
                                                    url =
                                                        urlToTechStack[tStack];
                                                    break;
                                                  }
                                                }
                                                if (url != null) {
                                                  if (await canLaunchUrl(url)) {
                                                    if (!await launchUrl(url,
                                                        mode: LaunchMode
                                                            .externalApplication)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              "Failed to launch the url"),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }
                                              },
                                              child: Center(
                                                  child: Text(project!
                                                      .techStack[index]))),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            Expanded(
                              flex: 4,
                              child: GestureDetector(
                                onTap: () {
                                  currentProject = project!;
                                  Navigator.pushNamed(
                                      context, ProjectScreen.id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: Text(
                                    project!.shortDescription,
                                    style: const TextStyle(fontSize: 10),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const Placeholder();
  }
}
