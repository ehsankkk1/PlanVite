import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final items =[
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:ReorderableListView(
          children: List.generate(5, (index){
            return ListTile(
              title: Text('item$index'),
              key: ValueKey('item$index'),
            );
          }),
          onReorder: (int oldindex,newindex){
            setState(() {
              _updateMyItem(oldindex,newindex);
            });
          },
        ) ,
      ),
    );
  }
  void _updateMyItem(int oldsindex,int newindex){

    final String item = items.removeAt(oldsindex);
    items.insert(newindex, item);
  }

}
