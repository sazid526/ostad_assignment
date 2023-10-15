import 'package:flutter/material.dart';
import 'package:ostad_assignment_no10/itemEdit.dart';
import 'package:ostad_assignment_no10/itemFunction.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ItemFunction> itemList = [];
  final TextEditingController _addTitleETcontroller = TextEditingController();
  final TextEditingController _addDesETcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.search_rounded)
        ],
      ),
      body: Column(
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
                hintText: "Add Title",

              ),
              controller: _addTitleETcontroller,
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
                hintText: "Add Description",

              ),
              controller: _addDesETcontroller,

            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    itemList.add(
                        ItemFunction(title: _addTitleETcontroller.text.trim(), subtitle: _addDesETcontroller.text.trim())
                    );
                    _addTitleETcontroller.clear();
                    _addDesETcontroller.clear();
                  });
                },
                child: Text("Add")
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index){
                  final ItemFunction itemFunction = itemList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text(itemFunction.title),
                    subtitle: Text(itemFunction.subtitle),
                    trailing: Icon(Icons.arrow_forward),
                    onLongPress: (){
                      showDialog(
                          context: (context),
                          builder: (context){
                            return AlertDialog(
                              title: Text("Alert"),
                              content: Row(
                                children: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context){
                                              return itemEdit(
                                                  itemFunction: itemFunction,
                                                  onItemUpdate: (String updateTitle, String updateDes){
                                                    editItem(index, updateTitle, updateDes);
                                                  }
                                              );
                                            }
                                        );

                                      },
                                      child: Text("Edit")
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        deleteItem(index);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Delete")
                                  ),

                                ],
                              ),
                            );
                          }
                      );
                    },
                    tileColor: Colors.grey,
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  void editItem(index,String updateTitle,String updateDes){
    itemList[index].title = updateTitle;
    itemList[index].subtitle = updateDes;
    setState(() {

    });
  }

  void deleteItem(index){
    itemList.removeAt(index);
    setState(() {

    });
  }

}