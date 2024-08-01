import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  const Chartbar({super.key , required this.fill});
  final double fill ; 

  @override
  Widget build(BuildContext context) {

      final bool isDarkMode = MediaQuery.of(context).platformBrightness== Brightness.dark;

    return Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 4),
    child:FractionallySizedBox(heightFactor: fill,child: DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.vertical(
        top: Radius.circular(10), 
      ),
      color:
             isDarkMode?
             Theme.of(context).colorScheme.secondary
             :Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ),
      ),)

    ),);
  }
}