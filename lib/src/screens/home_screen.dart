part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((user == null) ? 'Home' : user!.name!),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final response = await UserService.profile();
            setState(() {
              response.fold((l) => null, (r) => user = r);
            });
          },
          child: Text('Klik'),
        ),
      ),
    );
  }
}
