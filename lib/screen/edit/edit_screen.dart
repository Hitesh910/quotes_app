import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/model/qoutes_model.dart';
import 'package:quotes_app/utils/global.dart';

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
  double slide = 2;
  Alignment isalign = Alignment.center;

  // TextDirection isDirect = TextDirection.ltr;
  FontWeight isWeight = FontWeight.normal;
  FontStyle isStyle = FontStyle.normal;
  TextDecoration isUnder = TextDecoration.none;
  TextAlign isDirect = TextAlign.left;
  bool isText = false;
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    QoutesModel m1 = ModalRoute.of(context)!.settings.arguments as QoutesModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit quotes"),
        actions: [
          // Icon(icon)
          // IconButton(onPressed: () {
          //   Random r1 = Random();
          //   int i = r1.nextInt(happy.length);
          // }, icon: Icon(Icons.sunny))
        ],
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: globalKey,
            child: Container(
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
                      child: Align(
                        alignment: isalign,
                        child: SelectableText(
                          '${m1.quotes}'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10 * slide,
                            fontFamily: font,
                            color: isColor,
                            fontWeight: isWeight,
                            decoration: isUnder,
                            fontStyle: isStyle,
                          ),
                          // textDirection: isDirect,
                          textAlign: isDirect,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('- ${m1.name}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isColor,
                              fontFamily: font)),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Text('${m1.name}'),
          // Text('${m1.quotes}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    isText = !isText;
                    fontOn = false;
                    colorOn = false;
                    imageOn = false;
                  });
                },
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
                    isText = false;
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
                    isText = false;
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
                    isText = false;
                  });
                },
                icon: const Icon(
                  Icons.image,
                  size: 28,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    save();
                  });
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
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
                child: ListView.builder(
              itemCount: fontList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            font = fontList[index];
                          });
                        },
                        child: Text(
                          fontList[index],
                          style: const TextStyle(fontSize: 25),
                        )),
                    const Divider()
                  ],
                );
              },
            )
                //     GridView.builder(
                //   gridDelegate:
                //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                //   itemCount: fontList.length,
                //   itemBuilder: (context, index) {
                //     return Text(fontList[index]);
                //   },
                // ))
                ),
          ),
          const SizedBox(
            height: 25,
          ),
          Visibility(
            visible: isText,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          if (isWeight == FontWeight.normal) {
                            isWeight = FontWeight.bold;
                          } else {
                            isWeight = FontWeight.normal;
                          }
                        });
                      },
                      icon: const Icon(Icons.format_bold),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(Icons.text_fields),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          if (isUnder == TextDecoration.none) {
                            isUnder = TextDecoration.underline;
                          } else {
                            isUnder = TextDecoration.none;
                          }
                        });
                      },
                      icon: const Icon(Icons.format_underline),
                    ),
                    IconButton.filledTonal(
                        onPressed: () {
                          setState(
                            () {
                              if (isStyle == FontStyle.normal) {
                                isStyle = FontStyle.italic;
                              } else {
                                isStyle = FontStyle.normal;
                              }
                            },
                          );
                        },
                        icon: const Icon(Icons.format_italic))
                  ],
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          isDirect = TextAlign.left;
                        });
                      },
                      icon: const Icon(Icons.format_align_left),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          isDirect = TextAlign.center;
                        });
                      },
                      icon: const Icon(Icons.format_align_center_outlined),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {
                        setState(() {
                          isDirect = TextAlign.right;
                        });
                      },
                      icon: const Icon(Icons.format_align_right),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Size :",
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(
                        child: Slider(
                          value: slide,
                          onChanged: (double s) {
                            setState(() {
                              slide = s;
                            });
                          },
                          inactiveColor: Colors.blue,
                          divisions: 10,
                          min: 1,
                          max: 10,
                        ),
                      )
                    ],
                  ),
                ),
                // ElevatedButton(onPressed: () {
                //
                // }, child: )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<Object?> save() async {
    {
      RenderRepaintBoundary boundary =
          globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var bs64 = byteData?.buffer.asUint8List();
      // var bs64 = base64Decode(pngBytes as String);

      String? path =
          "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}";

      if (Platform.isAndroid) {
        await File("/storage/emulated/0/Download/$path.png").writeAsBytes(bs64!);
        return "/storage/emulated/0/Download/$path.png";
      } else {
        Directory? dir = await getDownloadsDirectory();
        await File("${dir!.path}.png").writeAsBytes(bs64!);
        return "${dir!.path}.png";
      }
      return bs64;
    }
  }
}
