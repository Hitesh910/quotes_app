import 'package:flutter/material.dart';
import 'package:quotes_app/model/qoutes_model.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  List<QoutesModel> m1 = [];

  Widget build(BuildContext context) {
    // l1 = ModalRoute.of(context)!.settings.arguments as List<QoutesModel>;
    m1 = ModalRoute.of(context)!.settings.arguments as List<QoutesModel>;
    return Scaffold(
        appBar: AppBar(
          title: Text("Quotes"),
        ),
        body: ListView.builder(
          itemCount: m1.length,
          itemBuilder: (context, index) {
            return Quotes(index);
          },
        )
        // ListView(
        //   child: Center(
        //     child: Text('${l1[index].name}'),
        //   ),
        // ),
        );
  }

  Widget Quotes(int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'edit',arguments: m1[index]);
      },
      child: Container(
        height: 150,
        width: 400,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${m1[index].quotes}',
                style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 18),
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '- ${m1[index].name}',
                style: TextStyle(overflow: TextOverflow.fade),
              )
            ],
          ),
        ),
      ),
    );
  }
}
