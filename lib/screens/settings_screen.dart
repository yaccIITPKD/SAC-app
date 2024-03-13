import 'package:sac_app/widgets/sac_logo_text.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SACLogoText(width: 250),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              _signIn(context);
            },
            icon: Image.asset(
              googleImagePath,
              height: 20,
            ),
            label: const Text(googleSignIn),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    List<PrefTile> options = _getDetails();
    options.addAll(_getClubHeadPreferences());
    Map groupedItems = groupBy(options, (option) => option.category);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ProfileTile(
            userEmail: email,
            userName: name,
          ),
          const SizedBox(height: 20),
          PreferenceListView(groupedItems: groupedItems),
        ],
      ),
    );
  }

  List<PrefTile> _getClubHeadPreferences() {
    return [
      PrefTile(
        title: 'Club Members',
        category: settingOptions,
        icon: Icons.group_outlined,
      ),
      PrefTile(
        title: 'Static Data Change',
        category: settingOptions,
        icon: Icons.dashboard_customize_outlined,
      ),
      PrefTile(
        title: 'Member Requests',
        category: settingOptions,
        icon: Icons.group_add_outlined,
      ),
      PrefTile(
        title: 'Make Announcments',
        category: settingOptions,
        icon: Icons.volume_up_outlined,
      ),
      PrefTile(
        title: 'Settings',
        category: settingOptions,
        icon: Icons.settings_outlined,
      ),
      PrefTile(
          title: 'Log Out',
          category: settingOptions,
          icon: Icons.logout_outlined,
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            await GoogleSignInApi.logout();

            setState(() {
              isLoggedIn = false;
            });
          }),
    ];
  }

  List<PrefTile> _getMemberPreferences() {
    return [
      PrefTile(
        title: 'My Clubs',
        category: settingOptions,
        icon: Icons.local_library_outlined,
      ),
      PrefTile(
        title: 'Join Clubs',
        category: settingOptions,
        icon: Icons.add,
      ),
      PrefTile(
        title: 'Club Request Status',
        category: settingOptions,
        icon: Icons.group_add_outlined,
      ),
      PrefTile(
        title: 'Check Announcments',
        category: settingOptions,
        icon: Icons.volume_up_outlined,
      ),
      PrefTile(
        title: 'Settings',
        category: settingOptions,
        icon: Icons.settings_outlined,
      ),
      PrefTile(
          title: 'Log Out',
          category: settingOptions,
          icon: Icons.logout_outlined,
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            await GoogleSignInApi.logout();

            setState(() {
              isLoggedIn = false;
            });
          }),
    ];
  }

  List<PrefTile> _getDetails() {
    return [
      PrefTile(
        title: userName,
        category: personalInfo,
        subtitle: 'Unknown User',
      ),
      PrefTile(
        title: userRollId,
        category: personalInfo,
        subtitle: '000000000',
      ),
      PrefTile(
          title: userMail,
          category: personalInfo,
          subtitle: 'unknowm@email.com'),
      PrefTile(
          title: userPhone,
          category: personalInfo,
          subtitle: '+91 xxxxx xxxxx'),
      // Not Important Personel Info
      // Ui Purpose
      PrefTile(
        title: userDOb,
        category: personalInfo,
        subtitle: 'xx-xx-xxxx',
      ),
      //College Info of User
      //Can be used for autofil of Club Joining Forum
      PrefTile(
        title: userRollId,
        category: collegeInfo,
        subtitle: '000000000',
      ),
      PrefTile(
          title: userDepartment,
          category: collegeInfo,
          subtitle: 'Computer Science of Engneering'),
      PrefTile(
        title: userBatch,
        category: collegeInfo,
        subtitle: 'B2022',
      ),
    ];
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
}

// Util class To Fetch UserInfo from HTTP request(backend)
/*class Profile {
  final String userId;
  Profile({required this.userId});
  
  // Not yet connected to backend
  List<PrefTile> getDetails(){
    return [
      PrefTile(
        title: userName, 
        category: personalInfo, 
        detail: 'Unknown User'),
      PrefTile(
        title: userRollId, 
        category: personalInfo, 
        detail: '000000000'),
      PrefTile(
        title: userMail, 
        category: personalInfo, 
        detail: 'unknowm@email.com'),
      // Not Important Personel Info
      // Ui Purpose
      PrefTile(
        title: userDOb, 
        category: personalInfo, 
        detail: 'xx-xx-xxxx'),
      PrefTile(
        title: userGender, 
        category: personalInfo, 
        detail: 'Male'),
      //College Info of User
      //Can be used for autofil of Club Joining Forum
      PrefTile(
        title: userRollId, 
        category: collegeInfo, 
        detail: '000000000'),
      PrefTile(
        title: userDepartment, 
        category: collegeInfo, 
        detail: 'Computer Science of Engneering'),
      PrefTile(
        title: userBatch, 
        category: collegeInfo, 
        detail: 'B2022'),
      ];
  }

} */
