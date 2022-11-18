import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:merstro/lib.dart';

class AuthProvider extends ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MAuth authenticate = MAuth();

  setLoading() {
    _isLoading =true;
    notifyListeners();
  }

  setNotLoading() {
    _isLoading =false;
    notifyListeners();
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];