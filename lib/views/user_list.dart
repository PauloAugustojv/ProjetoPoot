import 'package:flutter/material.dart';
import 'package:projeto_poot/components/user_tile.dart';
//import 'package:projeto_poot/data/dummy_users.dart';
import 'package:projeto_poot/models/user.dart';
import 'package:projeto_poot/provider/users.dart';
import 'package:projeto_poot/routes/app_routes.dart';
import 'package:provider/provider.dart';

class  UserList extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
     final Users users =  Provider.of(context);
    return Scaffold(
      
      appBar: AppBar( 
        title: Text('Cadastramento Poot',
        style: TextStyle(color: Colors.white), 
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,

        actions: <Widget>[
          IconButton( 
            icon:Icon(Icons.add, color:Colors.white, size: 30,),
            onPressed: (){
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM, 
                
                );
              
            },
 
          ),
   
        ],

      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx,i) => UserTile(users.byIndex(i)),
      ),
      
    );
  }
}