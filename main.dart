import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
String diisplaytext="No Text Data";
List<String> tasklist=[];
TextEditingController textEditingController=TextEditingController();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(title: Text("Todo List App"),
      backgroundColor: const Color.fromARGB(255, 65, 162, 241),),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: 
              Container(
            padding:EdgeInsets.all(10) ,
            child:TextField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder(),
          label: Text("enter the Task")),)
,),),
   MaterialButton(
  color: Colors.white,
  height: 50,
  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
  onPressed: (){
    setState(() {
          diisplaytext=textEditingController.text;
          tasklist.add(textEditingController.text);
          textEditingController.clear();
  
    });
  },child: Text("Add"),),

            ],
          ),
         
         Flexible(
           child: ListView.builder(
              itemCount: tasklist.length,
             itemBuilder: (context, index) {
               return  Row(children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(tasklist[index]),
               
              ),
            ),
            
            MaterialButton(
              child: Icon(Icons.delete,color: Colors.redAccent,),
              onPressed: (){
                setState(() {
                   tasklist.removeAt(index);

                });
              },)
           ],);
             },
           ),
         ),

          
  
        ],
      ),

    ),
      
    );
  }
}

