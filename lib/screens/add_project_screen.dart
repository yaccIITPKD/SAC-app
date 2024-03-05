import '../exports.dart';

class NewProjectScreen extends StatefulWidget {
  static String id = "NewProjectScreen";
  const NewProjectScreen({super.key});

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create a new Project',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: RichText(
                  text: const TextSpan(
                      text: 'Title',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ]),
                )),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    label: RichText(
                  text: const TextSpan(
                      text: 'Number of Members',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ]),
                )),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: RichText(
                  text: const TextSpan(
                      text: 'Description',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ]),
                )),
              ),
              TextFormField(
                validator: (value) {
                  return null;
                },
                decoration: const InputDecoration(label: Text('Mentor')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Form data submit.. The clubName is taken from your profile ')));
                      }
                    },
                    child: Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
