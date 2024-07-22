import 'package:flutter/material.dart';

//Stteper
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Scaffold & Appbar",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Scaffold & Appbar"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentStep = 0;
  bool _complete= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
      ),body: _complete
      ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 100),
          SizedBox(height: 20,),
          Text('All Steps Completed!',
              style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  _complete = false;
                  _currentStep = 0;
                });
              },
              child: const Text(
                "Restart",
              ),
          ),
        ],
      ),
    )
        :
        Stepper(
          currentStep: _currentStep,
          onStepTapped: (step){
            setState(() {
              _currentStep = step;
            });
          },
          onStepContinue: (){
            if(_currentStep < 2){
              setState(() {
                _currentStep+=1;
              });
            }else{
              setState(() {
                _complete = true;
              });
            }
          },
          onStepCancel: (){
            if(_currentStep > 0){
              setState(() {
                _currentStep -=1;
              });
            }
          },
          steps: [
            Step(
                title: Text("Step 1")
                , content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This is the content of step 1"),
                TextField(
                  decoration: InputDecoration(labelText: "Input 1"),
                )
              ],
            ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0
                ? StepState.complete
                  :StepState.indexed
            ),
            Step(
                title: Text("Step 2")
                , content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This is the content of step 2"),
                TextField(
                  decoration: InputDecoration(labelText: "Input 2"),
                )
              ],
            ),
                isActive: _currentStep >= 1,
                state: _currentStep > 1
                    ? StepState.complete
                    :StepState.indexed
            ),
            Step(
                title: Text("Step 3")
                , content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This is the content of step 3"),
                TextField(
                  decoration: InputDecoration(labelText: "Input 3"),
                )
              ],
            ),
                isActive: _currentStep >= 2,
                state: _currentStep > 2
                    ? StepState.complete
                    :StepState.indexed
            )
          ],
        )

    );
  }
}
