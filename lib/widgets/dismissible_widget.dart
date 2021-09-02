import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
final T item;
final Widget child;
final DismissDirectionCallback onDismissed;
const DismissibleWidget({required this.item, required this.child, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: ObjectKey(item),
      child:child ,
      background:buildSwipeAction() ,
    );
  }

 Widget buildSwipeAction() {
    return Container(
      color: Colors.red,
      child: Center(child: Text("Deleting",style: TextStyle(color: Colors.white,fontSize: 20),)),
    );
 }
}
