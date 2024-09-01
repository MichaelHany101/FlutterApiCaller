import 'package:flutter/material.dart';
import 'apiCaller.dart';
import 'package:api_caller/Service/Service.dart';
import 'package:api_caller/Model/UserModel.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //MARK: - Variables and Map
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool showPassword = true;

  List<UserModel> users = [];

  getUsers() {
    GetUserService().getService().then((value) {
      setState(() {
        users = value!;
      });
    });
  }

  //MARK: - Init State
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  //MARK: - UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //MARK: - Title
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Login Screen",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //MARK: - Login Text
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //MARK: - Email Form
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                onFieldSubmitted: (value) {
                  print(value);
                },
              ),

              SizedBox(
                height: 10,
              ),

              //MARK: - Password Form
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: showPassword,
                decoration: InputDecoration(
                  labelText: "User Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  ),
                ),
                onFieldSubmitted: (value) {
                  print(value);
                },
              ),

              SizedBox(
                height: 20,
              ),

              //MARK: - Login Button
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);

                    for (int i = 0; i < users.length; i++) {
                      if (emailController.text == users[i].email &&
                          passwordController.text == users[i].username) {
                        print("Login Successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => apiCaller(user: users[i])),
                        );
                      }
                      else {
                        print("Login Failed");
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
