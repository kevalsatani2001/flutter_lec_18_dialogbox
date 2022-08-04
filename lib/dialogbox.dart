import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dia_Log extends StatefulWidget {
  const Dia_Log({Key? key}) : super(key: key);

  @override
  State<Dia_Log> createState() => _Dia_LogState();
}

class _Dia_LogState extends State<Dia_Log> {
  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //top: true,
        //child: Container(
        //child: Text("ABCD"),
        //),
        child: Column(
          children: [
            Center(
              child: TextButton(
                  onPressed: () async {
                    var v = await showDialog(
                        context: context,
                        barrierDismissible: false,
                        // barrierColor: Colors.orange,
                        builder: (context) => const MyAlert());
                    //print(await v);
                    setState(() {
                      isHide = v;
                    });
                  },
                  child: const Text("open dialog")),
            ),
            Visibility(
              visible: !isHide,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "${isHide.toString().toUpperCase()}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyAlert extends StatefulWidget {
  const MyAlert({Key? key}) : super(key: key);

  @override
  State<MyAlert> createState() => _MyAlertState();
}

class _MyAlertState extends State<MyAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Alert"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you sure you want to close it?"),
          //Icon(Icons.delete),
          Container(height: 2, color: Colors.red),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            //print("I am print here");
            Navigator.pop(context, true);
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            //print("I am print here");
            Navigator.pop(context, false);
          },
          child: const Text("No"),
        )
      ],
    );
  }
}
