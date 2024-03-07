import '../presentation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwController = TextEditingController();

  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    width: constraints.maxWidth,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 150.0,
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight - 300,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 24.0,
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black45),
                              hintText: "email",
                              fillColor: Colors.black12,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: passwController,
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black45),
                              hintText: "password",
                              fillColor: Colors.black12,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.0),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        minimumSize: Size(constraints.maxWidth, 50),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text('LOGIN'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
