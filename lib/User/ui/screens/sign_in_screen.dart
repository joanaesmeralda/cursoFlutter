import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';

class SingInScreen extends StatefulWidget{
  @override
  State createState(){
    return _SingInScreen();
  }
}

class _SingInScreen extends State<SingInScreen>{
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of(context);
    return signGoogleUI();
  }

  Widget handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
          return signGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }


  Widget signGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bienvenido \n Este es el inicio",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: (){
                    userBloc.signIn().then((FirebaseUser user) => print("El usuario es: ${user.displayName}"));

                  },
                width: 300.0,
                heigth: 50.0,
               ),
            ],
          ),
        ],
      ),
    );
  }
}

