import 'package:flutter/material.dart';
import 'package:ostad_assignment_no10/itemFunction.dart';


class itemEdit extends StatefulWidget {
  const itemEdit({Key? key, required this.itemFunction, required this.onItemUpdate}) : super(key: key);

  final ItemFunction itemFunction;
  final Function(String,String) onItemUpdate;

  @override
  State<itemEdit> createState() => _itemEditState();
}

class _itemEditState extends State<itemEdit> {

  late final TextEditingController _updateTitleETcontroller = TextEditingController(text: widget.itemFunction.title);
  late final TextEditingController _updateDesETcontroller = TextEditingController(text: widget.itemFunction.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink,
                      width: 2
                  )
              ),
              hintText: "Update Title",

            ),
            controller: _updateTitleETcontroller,

          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.pink,
                      width: 2
                  )
              ),
              hintText: "Update Description",

            ),
            controller: _updateDesETcontroller,

          ),
        ),
        Center(
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  widget.onItemUpdate(_updateTitleETcontroller.text.trim(), _updateDesETcontroller.text.trim());
                  Navigator.pop(context);
                });
              },
              child: Text("Update")
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}