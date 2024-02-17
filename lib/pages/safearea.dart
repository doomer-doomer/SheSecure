import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pickle/pickle.dart';


class safearea extends StatefulWidget {
  const safearea({super.key});

  @override
  State<safearea> createState() => _safeareaState();
}

class _safeareaState extends State<safearea> {

Future<void> loadModel() async {
  Directory appDir = await getApplicationDocumentsDirectory();
  String modelPath = '${appDir.path}/model.pkl';
  ByteData data = await rootBundle.load('assets/model.pkl');
  List<int> bytes = data.buffer.asUint8List();
  await File(modelPath).writeAsBytes(bytes);

  // Load the model using pickle
  var modelFile = File(modelPath);
  var modelData = modelFile.readAsBytesSync();
  var model = Pickle.load(modelData);
  
  // Use the model for inference
  // Example:
  // var prediction = model.call(<input_data>);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}