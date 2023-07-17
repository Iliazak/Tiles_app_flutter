// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/model/model.dart';
import '../widgets/text/app_text.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  final Data? data;
  final titleController;
  final descriptionController;

  const UpdateScreen(
      {super.key,
      required this.index,
      this.data,
      this.titleController,
      this.descriptionController});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late final Box dataBox;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  _updateData() {
    Data newData = Data(
      title: titleController.text,
      description: descriptionController.text,
    );
    dataBox.putAt(widget.index, newData);
  }

  @override
  void initState() {
    super.initState();

    dataBox = Hive.box('data_box');
    titleController = TextEditingController(text: widget.titleController);
    descriptionController =
        TextEditingController(text: widget.descriptionController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Редактирование заметки',
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Редактируйте оглавление заметки',
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Редактируйте описание заметки',
                labelText: 'Description',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _updateData();
              Navigator.pushNamed(context, '/drawer_screen');
            },
            child: const Text('Сохранить изменения'),
          ),
        ],
      ),
    );
  }
}
