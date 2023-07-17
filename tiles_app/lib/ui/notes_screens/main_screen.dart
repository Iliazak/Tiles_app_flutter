import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tiles_app/ui/notes_screens/edit_screen.dart';
import 'package:tiles_app/ui/widgets/text/app_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final Box dataBox;

  @override
  void initState() {
    super.initState();
    dataBox = Hive.box('data_box');
  }

  _deleteData(int index) {
    dataBox.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppText(
          text: 'Экран заметок',
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_screen');
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: dataBox.listenable(),
        builder: (context, value, child) {
          if (value.isEmpty) {
            return const Center(
              child: AppText(
                text: 'У вас еще нет заметок',
              ),
            );
          } else {
            return ListView.builder(
              itemCount: dataBox.length,
              itemBuilder: (context, index) {
                var box = value;
                var getData = box.getAt(index);

                return ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateScreen(
                            index: index,
                            data: getData,
                            titleController: getData.title,
                            descriptionController: getData.description,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  title: Text(getData.title),
                  subtitle: Text(getData.description),
                  trailing: IconButton(
                    onPressed: () {
                      _deleteData(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          }
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                child: Text('Ilia Zak'),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.perm_contact_calendar_sharp),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Images"),
              leading: const Icon(Icons.image_sharp),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {},
                    child: const Text('Выход'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {},
                    child: const Text('Регистрация'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
