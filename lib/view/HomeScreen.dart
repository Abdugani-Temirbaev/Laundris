import 'package:flutter/material.dart';
import 'package:laundris/network/api_response.dart';
import 'package:laundris/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthViewModel _authViewModel = AuthViewModel();

  @override
  void initState() {
    _authViewModel.fetchCheckToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Multipay')), backgroundColor: Theme.of(context).primaryColor),
      body: ChangeNotifierProvider<AuthViewModel>(
        create: (context) => _authViewModel,
        child: Consumer<AuthViewModel>(builder: (context, _authViewModel, _) {
          switch (_authViewModel.checkTokenResponse.status) {
            case Status.loading:
              print("show loader");
              return const Text('Loading');
            case Status.error:
              print("show error");
              return Text('Error ${_authViewModel.checkTokenResponse.message ?? "NULL ERROR"}');
            case Status.completed:
              print("show success");
              return const Text('Success');
            default:
          }
          return Container();
        }),
      ),
    );
  }
}
