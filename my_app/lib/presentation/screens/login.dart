// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:my_app/presentation/screens/home.dart';
//
//
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   Duration get loginTime => const Duration(milliseconds: 2250);
//
//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }
//
//   Future<String?> _signupUser(SignupData data) {
//     debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }
//
//   Future<String> _recoverPassword(String name) {
//     debugPrint('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return ""; //todo find something better to return
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'SHOP ONLINE',
//       // logo: AssetImage('assets/images/ecorp-lightblue.png'),
//       onLogin: _authUser,
//       onSignup: _signupUser,
//
//       loginProviders: <LoginProvider>[
//         LoginProvider(
//           icon: FontAwesomeIcons.google,
//           label: 'Google',
//           callback: () async {
//             debugPrint('start google sign in');
//             await Future.delayed(loginTime);
//             debugPrint('stop google sign in');
//             return null;
//           },
//         ),
//         LoginProvider(
//           icon: FontAwesomeIcons.facebookF,
//           label: 'Facebook',
//           callback: () async {
//             debugPrint('start facebook sign in');
//             await Future.delayed(loginTime);
//             debugPrint('stop facebook sign in');
//             return null;
//           },
//         ),
//         LoginProvider(
//           icon: FontAwesomeIcons.linkedinIn,
//           callback: () async {
//             debugPrint('start linkdin sign in');
//             await Future.delayed(loginTime);
//             debugPrint('stop linkdin sign in');
//             return null;
//           },
//         ),
//         LoginProvider(
//           icon: FontAwesomeIcons.githubAlt,
//           callback: () async {
//             debugPrint('start github sign in');
//             await Future.delayed(loginTime);
//             debugPrint('stop github sign in');
//             return null;
//           },
//         ),
//       ],
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => const HomePage(),
//         ));
//       },
//       onRecoverPassword: _recoverPassword,
//     );
//   }
// }