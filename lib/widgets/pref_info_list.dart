import '../exports.dart';

class PreferenceListView extends StatelessWidget {
  final Map groupedItems;

  const PreferenceListView({Key? key, required this.groupedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = ThemeUtils.getColorScheme(context).primary;
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: groupedItems.length,
      itemBuilder: (BuildContext context, int index) {
        String category = groupedItems.keys.elementAt(index);
        List itemsInCategory = groupedItems[category]!;

        return Padding(
          padding: const EdgeInsets.all(5),
          child: FilledCard(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
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
        const SizedBox(height: 3),
        Text(
          title,
          style: ThemeUtils.getTheme(context).textTheme.labelLarge,
          textAlign: TextAlign.start,
        ),
        Text(
          subtitle,
          style: ThemeUtils.getTheme(context).textTheme.bodyLarge,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 4)
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
