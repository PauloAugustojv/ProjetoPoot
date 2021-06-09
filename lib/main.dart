import 'package:flutter/material.dart';
import 'package:projeto_poot/pages/login.page.dart';
import 'package:projeto_poot/routes/app_routes.dart';
import 'package:projeto_poot/views/user_form.dart';
import 'package:projeto_poot/views/user_list.dart';
import 'package:provider/provider.dart';
import 'provider/users.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) => Users(),   
       )
     ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData( 
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          
          routes: {
            AppRoutes.HOME:(_) => LoginPage(),
            AppRoutes.USER_FORM:  (_) => UserForm()
            
          },
          debugShowCheckedModeBanner: false,  
        ),
       );
      }
     }
    
    


