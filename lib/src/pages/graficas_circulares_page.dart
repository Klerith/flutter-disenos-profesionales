import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:disenos/src/theme/theme.dart';

import 'package:disenos/src/widgets/radial_progress.dart';


class GraficasCircularesPage extends StatefulWidget {
  
  
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if ( porcentaje > 100 ) {
              porcentaje = 0;
            }
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue ),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.red )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.pink ),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.purple )
            ],
          )

        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress( 
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: appTheme.textTheme.body1.color,
        grosorPrimario: 10,
        grosorSecundario: 4,
      ),
      // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0) ),
    );
  }
}