import 'package:catalog_app/utils/key_constant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var checkSize = false;
  final _formKey = GlobalKey<FormState>();

  void checkLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        checkSize = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await context.vxNav.push(Uri.parse(homePage));
     // Navigator.pushNamed(context, homePage);
      setState(() {
        checkSize = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/ic_login.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome User"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter UserName", labelText: "UserName"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (userName) {
                          if (userName!.isEmpty) {
                            return "Please Enter UserName";
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Please Enter Password";
                          } else if (password.length < 6) {
                            return "Password Length shouldn't be less then 6.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Material(
                        borderRadius: BorderRadius.circular(checkSize ? 50 : 8),
                        child: InkWell(
                          onTap: () => checkLogin(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 40,
                            width: checkSize ? 50 : 150,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                            child: checkSize
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
