import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_identity_kyc/flutter_identity_kyc.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

class MKYC extends StatefulWidget {
  static Route route(
    String email, String firstName, String lastName, String userRef
  ) => MaterialPageRoute(builder: (context) => MKYC(
    email: email, firstName: firstName, lastName: lastName, userRef: userRef
  ));

  final String email;
  final String firstName;
  final String lastName;
  final String? userRef;
  const MKYC({super.key, required this.email, required this.firstName, required this.lastName, this.userRef});

  @override
  State<MKYC> createState() => _MKYCState();
}

class _MKYCState extends State<MKYC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Theme.of(context).primaryColor
          )
        ),
        centerTitle: true,
        title: Image.asset(
          MImages.logo,
          height: 30,
          color: MColors.primary,
          alignment: AlignmentDirectional.center,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: FlutterIdentityKyc(
            merchantKey: ipApiID,
            email: widget.email,
            firstName: widget.firstName,
            lastName: widget.lastName,
            userRef: widget.userRef,
            isTest: true,
            onCancel: (response) => {debugShow(response)},
            onVerified: (response) => {debugShow(response)},
            onError: (error) => debugShow(error)
          )
        ),
      )
    );
  }
}