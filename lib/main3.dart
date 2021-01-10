import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rellenitos_delivery/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rellenitos_delivery/src/web_view_example.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('AuthApp - Google - Apple'), actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.doorOpen),
              onPressed: () {
                GoogleSignInService.signOut();
                SystemNavigator.pop();
              })
        ]),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      Text(' Sign in with Google',
                          style: TextStyle(color: Colors.white, fontSize: 17))
                    ],
                  ),
                  onPressed: () async {
                    final GoogleSignInAccount account =
                        await GoogleSignInService.signInWithGoogle();

                    if (account != null) {
                      final googleKey = await account.authentication;

                      print('======== ID TOKEN FINAAAALLL ========');
                      print(account);
                      print(googleKey.idToken);

                      //Navigator.pushReplacementNamed(context, 'WebViewExample');
                      Navigator.pushReplacementNamed(context, 'listado');
                    } else {
                      print('======== USUARIO NO AUTENTICADO======');
                    }

                    //
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
