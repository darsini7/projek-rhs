import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  Color emailErrorColor = Colors.red;
  Color passwordErrorColor = Colors.red;

  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(Icons.email),
              errorText: emailErrorColor == Colors.red
                  ? "Alamat Email tidak valid."
                  : null,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passC,
            autocorrect: false,
            obscureText: isHidden,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  if (isHidden == true) {
                    isHidden = false;
                  } else {
                    isHidden = true;
                  }
                  setState(() {});
                },
                icon: Icon(Icons.remove_red_eye_sharp),
              ),

              errorText: passwordErrorColor == Colors.red
                  ? "Password tidak valid."
                  : null,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              final email = emailC.text;
              final password = passC.text;

              // Validasi email
              if (!emailRegex.hasMatch(email)) {
                setState(() {
                  emailErrorColor = Colors.red;
                });
              } else {
                setState(() {
                  emailErrorColor = Colors.black; 
                });
              }

              if (password.isEmpty) {
                setState(() {
                  passwordErrorColor = Colors.red;
                });
              } else {
                setState(() {
                  passwordErrorColor = Colors.black; 
                });
              }

              if (emailErrorColor == Colors.black && passwordErrorColor == Colors.black) {
                print("LOGIN DENGAN : EMAIL ($email) & PASS ($password)");
              }
            },
            child: Text("LOGIN"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
