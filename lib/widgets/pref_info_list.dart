import '../exports.dart';

class PreferenceListView extends StatelessWidget {
  final Map groupedItems;

  const PreferenceListView({Key? key, required this.groupedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: groupedItems.length,
      itemBuilder: (BuildContext context, int index) {
        String category = groupedItems.keys.elementAt(index);
        List itemsInCategory = groupedItems[category]!;

        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              Provider.of<ThemeProvider>(context, listen: true)
                                  .getAccentColor())),
                  const SizedBox(height: 6),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: itemsInCategory.length,
                    itemBuilder: (BuildContext context, int index) {
                      PrefTile item = itemsInCategory[index];
                      return category != 'Options'
                          ? InfoTile(
                              title: item.title,
                              subtitle: item.subtitle ?? '',
                            )
                          : PreferenceTile(
                              title: item.title,
                              icon: item.icon ?? Icons.error,
                              tap: item.onTap,
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              subtitle,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            )),
        const SizedBox(height: 2)
      ],
    );
  }
}

class PreferenceTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? tap;

  const PreferenceTile({
    Key? key,
    required this.title,
    required this.icon,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: tap,
      visualDensity: const VisualDensity(vertical: -4),
    );
  }
}
