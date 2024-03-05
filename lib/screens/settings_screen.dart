import '../exports.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String name = 'unknown';
  String email = 'unknown@email.com';
  bool isLoggedIn = false;

  final List<String> clubHeadOptions = [
    'Club Members',
    'Members Requests',
    'Make Announcements',
    'Data Changes',
    'Edit Personal Info',
    'App Preferences'
  ];

  final List<String> memberOptions = [
    'Joined Club',
    'Pending Requests',
    'Open Announcements',
    'Mess Menu',
    'Bus Timings',
    'Edit Info',
    'App Preferences'
  ];

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      name = prefs.getString('user_name') ?? '';
      email = prefs.getString('user_email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? _buildUserProfile() : _buildUserLogin();
  }

  Widget _buildUserLogin() {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {
          _signIn(context);
        },
        icon: Image.asset(
          googleImagePath,
          height: 20,
        ),
        label: const Text(googleSignIn),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Not able to login')));
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('user_name', user.displayName ?? '');
      await prefs.setString('user_email', user.email);
      setState(() {
        isLoggedIn = true;
        name = user.displayName ?? '';
        email = user.email;
      });
    }
  }

  Widget _buildUserProfile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileTile(
            userEmail: email,
            userName: name,
            width: 400,
          ),
          _buildDetails(),
          _buildSectionHeader('Options'),
          _buildOptions(context, memberOptions),
          ListTile(
            title: Text('Log Out'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false);
              await GoogleSignInApi.logout();

              setState(() {
                isLoggedIn = false;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      children: [
        _buildSectionHeader('Personal Info'),
        _buildDetailRow('Name', name),
        _buildDetailRow('Roll No.', ''),
        _buildDetailRow('Email', email),
        _buildDetailRow('Phone No.', ''),
        _buildSectionHeader('College Info'),
        _buildDetailRow('Department', ''),
        _buildDetailRow('Semester', ''),
        _buildDetailRow('Academic Year', ''),
        _buildSectionHeader('About'),
        _buildDetailRow('D.O.B', ''),
        _buildDetailRow('Gender', ''),
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

  Widget _buildOptions(BuildContext context, List<String> options) {
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
}
