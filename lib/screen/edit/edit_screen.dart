import 'package:flutter/material.dart';
import 'package:quotes_app/model/qoutes_model.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    QoutesModel m1 = ModalRoute.of(context)!.settings.arguments as QoutesModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit quotes"),
      ),
      body: Column(
        children: [Center(
          child: Text('${m1.name}'),
        )],
      ),
    );
  }
}
