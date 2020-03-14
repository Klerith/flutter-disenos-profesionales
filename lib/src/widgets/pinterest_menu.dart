import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ 
    @required this.onPressed, 
    @required this.icon 
  });
}



class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  
  final Color backgroundColor;
  final Color activeColor; // black
  final Color inactiveColor;

  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor     = Colors.black,
    this.inactiveColor   = Colors.blueGrey,
    @required this.items
  });


  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: (){ print('Icon pie_chart'); } ), 
  //   PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search'); } ), 
  //   PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications'); } ), 
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); } ), 
  // ];


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration( milliseconds: 250 ),
        opacity: ( mostrar ) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {

            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor     = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor   = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems( items ),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;

  _PinterestMenuBackground({ @required this.child });

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all( Radius.circular(100) ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}


class _MenuItems extends StatelessWidget {
  
  final List<PinterestButton> menuItems;

  _MenuItems( this.menuItems );
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate( menuItems.length, (i) => _PinterestMenuButton( i, menuItems[i] ) )
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton( this.index, this.item );

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false ).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon( 
          item.icon,
          size: ( itemSeleccionado == index ) ? 35 : 25,
          color: ( itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}



class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;

  Color backgroundColor = Colors.white;
  Color activeColor     = Colors.black;
  Color inactiveColor   = Colors.blueGrey;


  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado( int index ) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

}