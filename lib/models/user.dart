import 'package:flutter/material.dart';

class  User {
    final   String id;
    final   String nome;
    final   String raca;
    final   String sexo;
    final   String cor;
    final   String avatarUrl;


  const User({
    this.id,
    @required this.nome,
    @required this.raca,
    @required this.sexo,  
    @required this.cor,
    @required this.avatarUrl,

  });
}