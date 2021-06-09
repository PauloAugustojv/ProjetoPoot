



import 'package:flutter/material.dart';
import 'package:projeto_poot/models/user.dart';
import 'package:projeto_poot/provider/users.dart';
import 'package:provider/provider.dart';

class  UserForm extends StatelessWidget {
  

  final _form = GlobalKey<FormState>();
final Map<String, String> _formData = {};

void _loadFormData(User user){
  if(user != null){
  _formData['id'] = user.id;
  _formData['nome'] = user.nome;
  _formData['raca'] = user.raca;
  _formData['sexo'] = user.sexo;
  _formData['cor'] = user.cor;
  _formData['avatarUrl'] = user.avatarUrl;
  }
}
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourmulário do Pet'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {
             final isValid = _form.currentState.validate(); 
             if(isValid){ 
              _form.currentState.save();  
              Provider.of<Users>(context,listen: false).put(User(
                id: _formData['id'],
                nome: _formData['nome'],
                raca: _formData['raca'],
                sexo: _formData['sexo'],
                cor: _formData['cor'],
                avatarUrl: _formData['avatarUrl']
              ),
              );

              Navigator.of(context).pop();
             }    
            },
          ),
        ],
      ),
      body: Padding(
        padding:EdgeInsets.all(15),
        child: Form(
          key: _form,
         child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: _formData['nome'],
              decoration: InputDecoration(labelText: 'Nome'),
              validator:  (value){
                if(value==null || value.trim().isEmpty){
                   return 'Ocorreu um erro. Digite o nome do seu Pet';
                }
                if(value.trim().length<3){
                   return 'Nome muito pequeno. No mínimo 3 letras.';
                }
                return null;

              },

              onSaved: (value) => _formData['nome'] = value,

            ),
            TextFormField(
              initialValue: _formData['raca'],
              decoration: InputDecoration(labelText: 'Raça'),
               validator:  (value){
                if(value==null || value.trim().isEmpty){
                   return 'Ocorreu um erro. Digite o raça do seu Pet';
                }
                if(value.trim().length<3){
                   return 'Nome muito grande.';
                }
                return null;

              },
               onSaved: (value) => _formData['raca']   = value,
            ),
            TextFormField(
              initialValue: _formData['sexo'],
              decoration: InputDecoration(labelText: 'Sexo'),
               validator:  (value){
                if(value==null || value.trim().isEmpty){
                   return 'Ocorreu um erro. Digite o sexo do seu Pet';
                }
                if(value.trim().length<3){
                   return 'Digite o sexo do seu Pet, macho ou femea.';
                }
                return null;

              },
               onSaved: (value) => _formData['sexo'] = value,
              ),
            TextFormField(    
              initialValue: _formData['cor'],
              decoration: InputDecoration(labelText: 'Cor'), 
              validator:  (value){
                if(value==null || value.trim().isEmpty){
                   return 'Ocorreu um erro. Digite a cor do seu Pet';
                }
                if(value.trim().length<3){
                   return 'Digite uma cor válida';
                }
                return null;
  
              }, 
               onSaved: (value) => _formData['cor'] = value,
              ),
            TextFormField(
              initialValue: _formData['avatarUrl'],
              decoration: InputDecoration(labelText: 'URL do Avatar'), 
              validator:  (value){
                if(value==null || value.trim().isEmpty){
                   return 'Ocorreu um erro. Cole o Link da foto do seu Pet';
                }
                if(value.trim().length<3){
                   return 'Cole o Link da foto do seu Pet.';
                }
                return null;

              }, 
               onSaved: (value) => _formData['avatarUrl'] = value,
             ),
           ],
         ),
       ),
     ), 
   );
  }
 }