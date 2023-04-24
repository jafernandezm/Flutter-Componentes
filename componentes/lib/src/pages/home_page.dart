import 'package:flutter/material.dart';

import '../providers/menu_provider.dart';
import '../utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }


  Widget _lista() {

    //print(menuProvider.opciones);
    //menuProvider.cargarData().then((opciones){print('_lista');print(opciones);});
    return FutureBuilder(
        future: menuProvider.cargarData(),
        //initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //print('builder');
          //print(snapshot.data);
          return ListView(
            children: _listaItems( snapshot.data ),
          );
        },
    );

    //return ListView(
    //  children: _listaItems(),
    //);
  }

  List<Widget> _listaItems(List<dynamic> data) {
    final List<Widget> opciones =[];
    data.forEach( (element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),//pasamos el nombre del icono
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){},
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }

}


