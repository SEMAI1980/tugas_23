import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController=new TextEditingController();
  TextEditingController skillController=new TextEditingController();
  TextEditingController alamatController=new TextEditingController();

  List<Map<String,dynamic>>persons=[
    {
      "name":"Mohammad Rangga",
      "skill":"Flutter"
    },
    {
      "name":"Alex",
      "skill":"Laravel"
    },
    {
      "name": "Ardian",
      "skill": "Devops"
    }
  ];

  void _showDialogAdd(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Add Person"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text("Name")
                  ),
                ),
                SizedBox(height: 3,),
                TextFormField(
                  controller: skillController,
                  decoration: InputDecoration(
                      label: Text("Skill")
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed:(){
                    String name=nameController.text;
                    String skill=skillController.text;

                    persons.add({
                      "name":name,
                      "skill":skill
                    });
                    nameController.text="";
                    skillController.text="";
                    setState(() {

                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("Add")),
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text("Cancel"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Person"),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: _showDialogAdd,
        child:const Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: persons.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                trailing: InkWell(
                  onTap: (){
                    setState(() {
                      persons.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete),
                ),
                title: Text(persons[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(persons[index]["skill"]),
              );
            }
        ) ,
      ),
    );
  }
}

