import 'package:flutter/material.dart';
import 'package:quotes_app/model/qoutes_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Color isColor = Colors.black;
  bool colorOn = false;
  List imageList = [
    // "assest/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    // "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg"
  ];
  String? path = "assets/images/img2.jpg";
  bool imageOn = false;
  List fontList = [
    "Super",
    "Dancing",
    "playfair",
    "Jacquard",
  ];
  String? font = 'Dancing';
  bool fontOn = false;

  @override
  Widget build(BuildContext context) {
    QoutesModel m1 = ModalRoute.of(context)!.settings.arguments as QoutesModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit quotes"),
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.all(10),
            // padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '${path}',
                  fit: BoxFit.cover,
                  height: 400,
                  width: 400,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${m1.quotes}',
                      style: TextStyle(
                          fontSize: 22, fontFamily: font, color: isColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '- ${m1.name}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isColor,
                      fontFamily: font),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Text('${m1.name}'),
          // Text('${m1.quotes}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(
                  Icons.text_fields,
                  size: 32,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    fontOn = !fontOn;
                    colorOn = false;
                    imageOn = false;
                  });
                },
                icon: const Icon(
                  Icons.text_format,
                  size: 28,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    colorOn = !colorOn;
                    imageOn = false;
                    fontOn = false;
                  });
                },
                icon: const Icon(
                  Icons.color_lens,
                  size: 28,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    imageOn = !imageOn;
                    colorOn = false;
                    fontOn = false;
                  });
                },
                icon: const Icon(
                  Icons.image,
                  size: 28,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.save,
                  size: 28,
                ),
              ),
            ],
          ),
          Visibility(
            visible: colorOn,
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: Colors.primaries.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isColor = Colors.primaries[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.primaries[index],
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: imageOn,
            child: Expanded(
                child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      path = imageList[index];
                    });
                  },
                  child: Image.asset(
                    imageList[index],
                  ),
                );
              },
            )),
          ),
          Visibility(
            visible: fontOn,
            child: Expanded(
                child: ListView.builder(itemCount: fontList.length,itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(onTap: () {
                        setState(() {
                          font = fontList[index];
                        });
                      },child: Text(fontList[index],style: const TextStyle(fontSize: 25),)),
                      const Divider()
                    ],
                  );
                },)
            //     GridView.builder(
            //   gridDelegate:
            //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //   itemCount: fontList.length,
            //   itemBuilder: (context, index) {
            //     return Text(fontList[index]);
            //   },
            // ))
            ),
          )
        ],
      ),
    );
  }
}
