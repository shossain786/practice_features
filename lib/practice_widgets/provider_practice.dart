// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_features/provider/user_provider.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  MyProvider({super.key});

  TextEditingController textEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Provider Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your text here...',
                  labelText: 'Text',
                  border: OutlineInputBorder(),
                ),
                controller: textEditingController,
              ),
              const SizedBox(height: 5),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your number here...',
                  labelText: 'Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: ageEditingController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              Text('Name: ${userProvider.user.name}'),
              Text('Age: ${userProvider.user.age}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  debugPrint(
                    'Submit button pressed age: ${ageEditingController.text}',
                  );
                  userProvider.updateUser(
                    textEditingController.text,
                    int.parse(ageEditingController.text),
                  );
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Text(
                'Name: ${textEditingController.text}',
              ),
              Text(
                'Age: ${ageEditingController.text}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
