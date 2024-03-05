import '../exports.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 10),
            const Icon(Icons.message),
            const SizedBox(width: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
