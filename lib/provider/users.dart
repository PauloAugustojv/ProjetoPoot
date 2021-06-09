import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_poot/data/dummy_users.dart';
import 'package:projeto_poot/models/user.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

    List <User> get all{
      return [..._items.values];
    }

int get count {
  return _items.length;
}

User byIndex(int i){
  return _items.values.elementAt(i);
}

void put(User user){
  if(user == null){
    return;
  }

  if(user.id != null && 
     user.id.trim().isNotEmpty &&
    _items.containsKey(user.id)){
    _items.update(
    user.id, 
      (_) => User(
      id: user.id,
      nome: user.nome,
      raca: user.raca,
      sexo: user.sexo,
      cor: user.cor,  
      avatarUrl: user.avatarUrl,
    ),
    );
  }else{
    final id = Random().nextDouble().toString();
  _items.putIfAbsent(
    id,
    ()=>User(
     id:  id,
     nome: user.nome,
    raca: user.raca,
    sexo: user.sexo,
    cor: user.cor,
    avatarUrl: user.avatarUrl,

   ),
  );

  }        
notifyListeners();
}

void remove(User user){
  if(user != null && user.id != null){
    _items.remove(user.id);
    notifyListeners();
  }
}
}