import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/API-Calls-Provider/data_class.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProviderDemo(),
      debugShowCheckedModeBanner: false,
      title: 'API Calls - Provider',
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class ProviderDemo extends StatefulWidget {
  const ProviderDemo({super.key});

  @override
  State<ProviderDemo> createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading
            ? Center(
                child: SpinKitThreeBounce(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        postModel.post?.title ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Text(postModel.post?.body ?? "")
                  ],
                ),
              ),
      ),
    );
  }
}
