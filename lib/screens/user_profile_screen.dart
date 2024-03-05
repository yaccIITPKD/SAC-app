import '../exports.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  static String id = "UserProfileScreen";

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String name = 'unknown';
  String email = 'unknow@email.com';

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future<void> getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name') ?? '';
      email = prefs.getString('user_email') ?? '';
    });
  }

  final List<String> clubHeadOptions = [
    'Club Members',
    'Members Requests',
    'Make Announcments',
    'Data Changes',
    'Edit Personel Info',
    'App Preferences'
  ];

  final List<String> memberOptions = [
    'Joined Club',
    'Pending Requests',
    'Open Announcments',
    'Mess Menu',
    'Bus Timings',
    'Edit Info',
    'App Preferences'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ProfileTile(
          userEmail: email,
          userName: name,
          width: 400,
        ),
        details(
            name: name,
            email: email,
            phoneNumber: '',
            id: '',
            department: '',
            semester: '',
            dob: '',
            gender: '',
            academicYear: ''),
        _buildSectionHeader('Options'),
        _options(context, memberOptions),
        ListTile(
          title: Text('Log Out'),
          onTap: () async {
            await GoogleSignInApi.logout();

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        )
      ]),
    );
  }

  Widget _options(BuildContext context, List<String> options) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(options[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Need to implement'),
              duration: Duration(milliseconds: 200),
            ));
          },
        );
      },
    );
  }

  Widget details(
      {required String name,
      required String email,
      required String phoneNumber,
      required String id,
      required String department,
      required String semester,
      required String dob,
      required String gender,
      required String academicYear}) {
    return Column(
      children: [
        _buildSectionHeader('Personal Info'),
        _buildDetailRow('Name', name),
        _buildDetailRow('Roll No.', id),
        _buildDetailRow('email', email),
        _buildDetailRow('phone No.', phoneNumber),
        _buildSectionHeader('College Info'),
        _buildDetailRow('department', department),
        _buildDetailRow('semester', semester),
        _buildDetailRow('Academic Year', academicYear),
        _buildSectionHeader('About'),
        _buildDetailRow('D.O.B', dob),
        _buildDetailRow('Gender', gender)
      ],
    );
  }

  Widget _buildSectionHeader(String headerText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        headerText,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String detail) {
    return ListTile(
      title: Text(title),
      subtitle: Text(detail),
    );
  }
}
