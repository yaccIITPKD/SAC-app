import '../exports.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});

  static String id = "ProjectScreen";

  Project? project = currentProject;

  @override
  Widget build(BuildContext context) {
    return (project != null)
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 10),
                            ],
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30))),
                        alignment: Alignment.center,
                        child: Image(image: AssetImage(project!.logo)),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(bottom: 5, left: 10),
                        child: Text(
                          project!.title,
                          style: TextStyle(
                              fontSize: 40,
                              shadows: const [
                                Shadow(
                                    color: Colors.black, offset: Offset(1, 2))
                              ],
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              letterSpacing: -2,
                              color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: ListView(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 80,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    project!.date,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        height: 1),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    project!.year.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'Created on',
                                    style: TextStyle(height: 1.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${project!.currentMembers}/${project!.totalMembers}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        height: 2),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'Members',
                                    style: TextStyle(height: 1.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    project!.status,
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        height: 2),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'Status',
                                    style: TextStyle(height: 1.5),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        width: MediaQuery.of(context).size.width,
                        constraints: const BoxConstraints(
                          maxHeight: 200,
                        ),
                        child: SingleChildScrollView(
                          clipBehavior: Clip.antiAlias,
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 2),
                              ),
                              Text(project!.longDescription),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Members',
                              style: TextStyle(fontSize: 20),
                            ),
                            Card(
                              elevation: 0,
                              color: Colors.white,
                              shadowColor: Colors.blueGrey,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 440,
                                child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) => Card(
                                    child: Container(
                                      height: 60,
                                      child: const ListTile(
                                        title: Text('Alonot'),
                                        leading: Icon(Icons.account_box),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            width: 0,
            height: 0,
          );
  }
}
