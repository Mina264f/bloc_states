
import 'package:flutter/material.dart';
import 'package:validform/custom_form_field.dart';
import 'package:validform/umdf_screen.dart';

import 'hive_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  bool value=false;
  var formKey = GlobalKey<FormState>();
  List<bool> list=[false,false,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('You have pushed the button this many times:'),
                CustomFormField(
                  child: TextFormField(
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    controller: controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                  ),
                  validator: (_) {
                    if (controller.text.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                ),

                CustomFormField(
                  validator: (_) {
                    if (value == false) {
                      return 'Please accept terms and conditions';
                    }
                    return null;
                  },
                  child: Checkbox(value: value, onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  }),
                ),

                CustomFormField(
                  child: Switch(
                    value: list[0],
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                  ),
                ),

                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const UmdfScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
