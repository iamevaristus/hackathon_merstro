import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:merstro/lib.dart';

class MChecker extends StatefulWidget {
  const MChecker({super.key});

  @override
  State<MChecker> createState() => _MCheckerState();
}

class _MCheckerState extends State<MChecker> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: MAuth().authChanges(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const WLInkDrop();
        } else if(snapshot.hasData){
          return const MHome();
        } else{
          return const MOnboardScreen();
        }
      }
      );
  }
}