import 'package:amplify_flutter/amplify.dart';
import 'package:aws_crud_auth/models/ItemInfo.dart';
import 'package:aws_crud_auth/widgets/add_item.dart';
import 'package:flutter/material.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({Key? key}) : super(key: key);

  @override
  _ItemInfoState createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => create(),
            child: Text('Create'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ),

          // READ ALL
          ElevatedButton(
            onPressed: () => readAll(),
            child: Text('Read All'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
          ElevatedButton(
            onPressed: () => readById(),
            child: Text('Read by Id'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ),

          ElevatedButton(
            onPressed: () => update(),
            child: Text('Update'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
          ElevatedButton(
            onPressed: () => delete(),
            child: Text('Delete'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
  void create() async {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: AddItem(),
          );
        }
    );


  }

  void readAll() async {
    try {
      final myItems = await Amplify.DataStore.query(ItemInfo.classType);

      print(myItems.toString());
    } catch (e) {
      print(e);
    }
  }


  void readById(){

  }

  void update(){

  }

  void delete(){

  }
}
