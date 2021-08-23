import 'package:amplify_flutter/amplify.dart';
import 'package:aws_crud_auth/models/ItemInfo.dart';
import 'package:aws_crud_auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: idController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Id',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: priceController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Price',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
            text: 'Register',
            onTap: () async {
              final myItem = ItemInfo(
                id: idController.text,
                Name: nameController.text,
                Price: double.parse(priceController.text),
              );
              try {
                await Amplify.DataStore.save(myItem);
              } catch (e) {
                print(e);
              }
            }),
      ],
    );
  }
}
