import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitDialog();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("QoutesApp",style: TextStyle(color: Colors.white),),
          actions: [
            ElevatedButton(
                onPressed: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return AlertDialog(
                  //       title: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text("Are sure Exit"),
                  //           Row(
                  //             children: [
                  //               ElevatedButton(
                  //                   onPressed: () {
                  //                     exit();
                  //                   },
                  //                   child: Text("Yes")),
                  //               ElevatedButton(
                  //                   onPressed: () {}, child: Text("no")),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                },
                child: Text("Click"))
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
                        margin: EdgeInsets.all(15),
                        // color: Colors.red,
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage('${category[index].image}'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.6)),
                      child: Text('${category[index].name}',style: TextStyle(fontSize: 18),),
                    ),
                  );
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

  void exitDialog() {
    showDialog(
      context: context,
      builder:(context) {
       return AlertDialog(
          title: Column(
            children: [
              Text("Are sure exit"),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text("Yes")),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("No"))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
