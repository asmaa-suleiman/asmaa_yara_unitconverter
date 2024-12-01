import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

List<String> lengthMeasures = ["m to km", 'km to m', 'mile to km'];
List<String> weightMeasures = ["g to kg", 'kg to g', 'pound to kg'];
List<String> tempMeasures = ["c to f", 'f to c'];
double userInput = 0;
double lengthResult = 0;
double weightResult = 0;
double tempResult = 0;
String conversion = "";
String weightCon = "";
String tempCon = "";

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 249, 249),
        appBar: AppBar(
          title: const Center(
            child: Text(
              "UNIT CONVERTER",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 210, 137, 137),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextField(
                    onChanged: (value) {
                      userInput = double.parse(value);
                    },
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 239, 239, 239),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter the value')),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                //firstrow
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('convert length'),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownMenu(
                    onSelected: (value) {
                      if (value != null) {
                        String x = value;
                        setState(() {
                          conversion = x;
                        });
                      }
                    },
                    dropdownMenuEntries: lengthMeasures
                        .map<DropdownMenuEntry<String>>((String m) {
                      return DropdownMenuEntry(value: m, label: m);
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: convertLength, child: Text("Convert")),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("result of length conversion: $lengthResult")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                //second row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('convert weight'),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownMenu(
                    onSelected: (value) {
                      if (value != null) {
                        String x = value;
                        setState(() {
                          weightCon = x;
                        });
                      }
                    },
                    dropdownMenuEntries: weightMeasures
                        .map<DropdownMenuEntry<String>>((String m) {
                      return DropdownMenuEntry(value: m, label: m);
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: convertWeight, child: Text("Convert")),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("result of length conversion: $weightResult")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                //third
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('convert temperature'),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownMenu(
                    onSelected: (value) {
                      if (value != null) {
                        String x = value;
                        setState(() {
                          tempCon = x;
                        });
                      }
                    },
                    dropdownMenuEntries:
                        tempMeasures.map<DropdownMenuEntry<String>>((String m) {
                      return DropdownMenuEntry(value: m, label: m);
                    }).toList(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: convertTemp, child: Text("Convert")),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("result of length conversion: $tempResult")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(onPressed: convertLength, child: Text("Convert")),
              const SizedBox(
                height: 20,
              ),
              //Text("result is $result"),
              //Text("userinput is $userInput"),
              //Text("conversion is $conversion")
            ],
          ),
        ),
      ),
    );
  }

  void convertLength() {
    switch (conversion) {
      case "m to km":
        setState(() {
          lengthResult = userInput / 1000;
        });
        break;
      case "km to m":
        setState(() {
          lengthResult = userInput * 1000;
        });
        break;
      case "mile to km":
        setState(() {
          lengthResult = userInput * 1.60934;
        });
        break;
      default:
      // Code to execute if expression doesn't match any case
    }
  }

  void convertWeight() {
    switch (weightCon) {
      case "g to kg":
        setState(() {
          weightResult = userInput / 1000;
        });
        break;
      case "kg to g":
        setState(() {
          weightResult = userInput * 1000;
        });
        break;
      case "pound to kg":
        setState(() {
          weightResult = userInput * 0.453592;
        });
        break;
      default:
      // Code to execute if expression doesn't match any case
    }
  }

  void convertTemp() {
    switch (tempCon) {
      case "f to c":
        setState(() {
          tempResult = (userInput - 32) / 1.8;
        });
        break;
      case "c to f":
        setState(() {
          tempResult = (userInput * 1.8) + 32;
        });
        break;

      default:
      // Code to execute if expression doesn't match any case
    }
  }
}
