// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;



// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _inputController = TextEditingController();
//   String _prediction = '';

//   void _getPrediction() async {
    
//     String inputString = _inputController.text;

//     if (inputString.isEmpty) {
      
//       setState(() {
//         _prediction = 'Input is empty';
//       });
//       return;
//     }
    
//     final response = await http.get(Uri.parse('https://model-server-mxrg.onrender.com/$inputString'));
//     print(response);
//     print("Helloooo:$response.body");
//     if (response.statusCode == 200) {
//       setState(() {
//         print(response);
//         _prediction = response.body;
//       });
//     } else {
//       setState(() {
//         _prediction = 'Error: ${response.statusCode}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ML Prediction App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _inputController,
//               decoration: InputDecoration(labelText: 'Enter 0s and 1s'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _getPrediction,
//               child: Text('Get Prediction'),
//             ),
//             SizedBox(height: 16.0),
//             Text('Prediction: $_prediction'),
//           ],
//         ),
//      ),
// );
// }
// }