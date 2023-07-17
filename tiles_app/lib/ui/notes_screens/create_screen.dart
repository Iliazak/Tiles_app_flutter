import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiles_app/ui/widgets/text/app_text.dart';

import '../../data/model/model.dart';

//TODO: Сделать валидацию TextField'a
class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late final Box dataBox;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box('data_box');
  }

  _createData() {
    Data newData = Data(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    dataBox.add(newData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Создание новой заметки',
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Озоглаьте Заметку',
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите подробное описание заметки',
                labelText: 'Description',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _createData();
              Navigator.pushNamed(context, '/drawer_screen');
            },
            child: const Text('Создать заметку'),
          )
        ],
      ),
    );
  }
}
