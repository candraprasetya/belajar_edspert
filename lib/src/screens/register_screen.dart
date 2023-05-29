part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: _buildFormData().p16(),
    );
  }

  Widget _buildFormData() {
    return VStack([
      VxTextField(
        controller: name,
        hint: "Enter your Name",
        labelText: "Name",
        contentPaddingLeft: 16,
      ),
      VxTextField(
        controller: email,
        hint: "Enter your Email",
        labelText: "Email",
        contentPaddingLeft: 16,
      ).py8(),
      VxTextField(
        controller: password,
        hint: "Enter your Password",
        isPassword: true,
        labelText: "Password",
        contentPaddingLeft: 16,
      ),
      24.heightBox,
      ElevatedButton(
        onPressed: () {},
        child: "Register".text.make(),
      ).wFull(context),
    ]);
  }
}
