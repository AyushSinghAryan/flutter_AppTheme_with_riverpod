import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_dart/pratic/personList.dart';

class TestPerson extends StatefulWidget {
  const TestPerson({super.key});

  @override
  State<TestPerson> createState() => _TestPersonState();
}

class _TestPersonState extends State<TestPerson> {
  List<PersonDetails> list = [];

  TextEditingController personName = TextEditingController();
  TextEditingController personAge = TextEditingController();
  TextEditingController personGender = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  void addPersonDetails() {
    String name = personName.text;
    String age = personAge.text;
    String gender = personGender.text;

    PersonDetails newperson =
        PersonDetails(personName: name, personAge: age, personGender: gender);
    print(name);
    print(newperson.personName);
    print(newperson.personGender);

    list.add(newperson);
    setState(() {});
  }

  void formValidator() {
    if (form.currentState!.validate()) {
      addPersonDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: personName,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: personAge,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: personGender,
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  child: Text("press"),
                  onPressed: () {
                    addPersonDetails();
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final details = list[index];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                    title: Text(details.personName),
                    leading: const Icon(Icons.person),
                    trailing: Text(details.personAge),
                    subtitle: Text(details.personGender)),
              );
            },
          ))
        ],
      ),
    );
  }
}
