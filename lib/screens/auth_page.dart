import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wally/services/auth.dart';
import 'package:wally/utils/dimensions.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;
  Dimensions myDim;
  @override
  Widget build(BuildContext context) {
    myDim = Dimensions(context);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_bg.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black45,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: myDim.height * 0.15),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  scale: 3.5,
                ),
                SizedBox(height: myDim.height * 0.05),
                Text(
                  'Wally',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Fresh walls for your phone \n at one place ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.grey.shade400),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: myDim.height * 0.1),
                  height: myDim.height * 0.065,
                  child: _isLoading
                      ? Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue.shade900),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) => Colors.blue.shade900),
                          ),
                          onPressed:_signInWithGoogle,
                          child: Row(
                            children: [
                              SizedBox(
                                width: myDim.width * 0.07,
                              ),
                              Container(
                                width: 23.0,
                                height: 23.0,
                                child: Image.asset(
                                  'assets/images/google-logo.png',
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  'Sign in with Google',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          )),
                )
              ],
            ),
          ),
        ),
      ],
    )));
  }

    Future<void> _signInWithGoogle() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      print('Login Error: ' + e.code);
      setState(() {
        _isLoading = false;
      });
      //if (e.code != 'ERROR_ABORTED_BY_USER') showErrorDialog(e);
    }
  }
}
