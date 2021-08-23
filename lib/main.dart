import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore/amplify_datastore_stream_controller.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:aws_crud_auth/models/ModelProvider.dart';
import 'package:aws_crud_auth/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  runApp(MyApp());
}

Future<void> configureAmplify() async {
  Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyDataStore(modelProvider: ModelProvider.instance)
  ]);

  try {
    Amplify.configure(amplifyconfig);
  } catch (e) {
    print("Amplify is already configured");
  }
}

class MyApp extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Amplify Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
