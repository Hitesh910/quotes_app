import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quotes_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isColor = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitDialog();
      },
      child: Scaffold(
        backgroundColor: (isColor == true) ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: (isColor == true) ? Colors.black : Colors.white,
          title: Text(
            "QoutesApp",
            style: TextStyle(
                color: (isColor == true) ? Colors.white : Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Random r1 = Random();
                  int i = r1.nextInt(happy.length);

                  Text("${happy[i].quotes}");
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [Text("${happy[i].quotes}")],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.sunny)),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Are sure Exit"),
                            Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: const Text("Yes")),
                                ElevatedButton(
                                    onPressed: () {}, child: const Text("no")),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text("Click")),
            IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    isColor = !isColor;
                  });
                },
                icon: const Icon(Icons.color_lens))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.all(15),
                        // color: Colors.rxd,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.red,
                            image: DecorationImage(
                                image:
                                    NetworkImage('${category[index].image}'))),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: category.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Tile(index);
                },
              ),
            ),
          ],
        ),

        // Column(
        //   children: [
        // `SizedBox(
        //   height: 150,
        // child:
        // ListView.builder(
        //             scrollDirection: Axis.horizontal,
        //             itemCount: category.length,
        //             itemBuilder: (context, index) {
        //               return SizedBox(
        //                 height: 150,
        //                 width: 200,
        //                 child: Container(
        //                   height: 100,
        //                   // width: 100,
        //                   margin: EdgeInsets.all(5),
        //                   alignment: Alignment.center,
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           image: NetworkImage('${category[index].image}'),
        //                           fit: BoxFit.cover)
        //                   ),
        //                   child: Container(
        //                       decoration: BoxDecoration(
        //                           color: Colors.white.withOpacity(0.4)
        //                       ),
        //                       child: Text('${category[index].name}')),
        //                 ),
        //               );
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.red,
        // );
        //   },
        // ),
        //),`
      ),
    );
  }

  Widget Tile(int index) {
    return InkWell(
      onTap: () {
        List mainList = [happy, sucess, sad, struggle];
        Navigator.pushNamed(context, 'quotes', arguments: mainList[index]);
      },
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage('${category[index].image}'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
          child: Text(
            '${category[index].name}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  void exitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              const Text("Are sure exit"),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text("Yes")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("No"))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
