import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:aws_crud_auth/screens/item_info_screen.dart';
import 'package:aws_crud_auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Flutter Amplify',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Register',
              onTap: () async {
                await Amplify.Auth.signUp(
                  username: nameController.text,
                  password: passwordController.text,
                  options: CognitoSignUpOptions(
                    userAttributes: {"email": emailController.text},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Registration completed"),
                  ),
                );
              },
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("Don't Have an account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: confirmationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Sign Up',
                ),
              ),
            ),
            CustomButton(
              text: 'Confirm Sign Up and log in',
              onTap: () async {
                SignUpResult res = await Amplify.Auth.confirmSignUp(
                    username: nameController.text,
                    confirmationCode: confirmationController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Confirmation complete"),
                  ),
                );
                if(res.isSignUpComplete){
                  _login();
                }
              },
            ),
          ],
        ),
      ),

    );

  }
  void _login() async {
    SignInResult res = await Amplify.Auth.signIn(
        username: nameController.text,
    password: passwordController.text,
    );
    if(res.isSignedIn){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemInfoScreen()),
      );
    }
  }
}
