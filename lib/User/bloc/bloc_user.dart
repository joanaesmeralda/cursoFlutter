import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';


class UserBloc implements Bloc{
  final _auth_repository = AuthRepository();

  //FLUJO DE DATOS - STREAMS

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //CASOS DE USO
  //1. Iniciar sesión con google
  Future<FirebaseUser> signIn(){
    return _auth_repository.singInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}