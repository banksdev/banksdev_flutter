import 'package:banksdev_flutter/bloc/authentication_bloc.dart';
import 'package:banksdev_flutter/events/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text("Logout"),
          onPressed: () {
            _authenticationBloc.dispatch(LoggedOut());
          },
        )),
      ),
    );
  }
}

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         actions: <Widget>[
//           MaterialButton(
//             onPressed: () => print("hello"),
//             child: Text("Hello click"),
//           ),
//         ],
//       ),
//       body: Center(
//         child: RepoList(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               title: Text("god"), icon: Icon(Icons.access_alarm)),
//           BottomNavigationBarItem(
//               title: Text("no"), icon: Icon(Icons.access_alarm))
//         ],
//         onTap: (int i) => print("hellow bottom"),
//       ),
//     );
//   }
// }
