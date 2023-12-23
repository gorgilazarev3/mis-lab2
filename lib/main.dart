import 'package:flutter/material.dart';
import 'package:mis_lab2/clothes_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '201042',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Vtora laboratoriska vezba'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ClothesItem newClothesItem = ClothesItem.empty();
  List<ClothesItem> clothesItems = [];
  final newClothesItemController = TextEditingController();
  final newImageUrlController = TextEditingController();
  final newClothesColorController = TextEditingController();

  void addClothesItemDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(content: Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Column(
        children: [
        Expanded(
          child: TextFormField(
            controller: newClothesItemController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете го типот на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue)
              ),),
        ),
        Expanded(
          child: TextFormField(
            controller: newClothesColorController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете ја бојата на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue)
              ),),
        ),
        Expanded(
          child: TextFormField(
            controller: newImageUrlController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете URL од сликата на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue)
              ),),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            clothesItems.add(ClothesItem(newImageUrlController.text, newClothesColorController.text, newClothesItemController.text));
            Navigator.pop(context);
            newImageUrlController.text = "";
            newClothesColorController.text = "";
            newClothesItemController.text = "";
          });
        }, child: Text('Додади', style: TextStyle(color: Colors.lightBlue),))
        ],
      )

      ,
    )),);
  }

    void editClothesItemDialog(int index) {
      newClothesColorController.text = clothesItems[index].color ?? "";
      newClothesItemController.text = clothesItems[index].item ?? "";
      newImageUrlController.text = clothesItems[index].image ?? "";
    showDialog(context: context, builder: (context) => AlertDialog(content: Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Column(
        children: [
        Expanded(
          child: TextFormField(
            controller: newClothesItemController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете го типот на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue),
                labelText: clothesItems[index].item ?? "",
                labelStyle: TextStyle(color: Colors.lightBlue) 
              ),),
        ),
        Expanded(
          child: TextFormField(
            controller: newClothesColorController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете ја бојата на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue),
                labelText: clothesItems[index].color ?? "",
                labelStyle: TextStyle(color: Colors.lightBlue)
              ),),
        ),
        Expanded(
          child: TextFormField(
            controller: newImageUrlController,
            style: TextStyle(color: Colors.lightBlue),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Внесете URL од сликата на облеката',
                hintStyle: TextStyle(color: Colors.lightBlue),
                labelText: clothesItems[index].image ?? "",
                labelStyle: TextStyle(color: Colors.lightBlue),    
              ),),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            clothesItems[index].color = newClothesColorController.value.text;
            clothesItems[index].item = newClothesItemController.value.text;
            clothesItems[index].image = newImageUrlController.value.text;
            Navigator.pop(context);
            newImageUrlController.text = "";
            newClothesColorController.text = "";
            newClothesItemController.text = "";
          });
        }, child: Text('Зачувај промени', style: TextStyle(color: Colors.lightBlue),))
        ],
      )

      ,
    )),);
  }

  void removeClothesItem(int index) {
    
    this.setState(() {
      this.clothesItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.teal[900],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('201042 - Лабораториска вежба 2', style: TextStyle(color: Colors.white),),
      ),
      body: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(color: Colors.white10),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    ListView.separated(itemCount: this.clothesItems.length, scrollDirection: Axis.vertical, shrinkWrap: true,  separatorBuilder: (context, index) {
                                    return const Divider(
                                      thickness: 3.0,
                                      height: 3.0,
                                    );
                                  }, itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.cyan[100],
                      child: Column(
                        children: [
                            Row(children: [
                              Expanded(child: Image.network(clothesItems[index].image ?? "", alignment: Alignment.center, width: 100, height: 100,)),
                              Expanded(child: Padding(padding: const EdgeInsets.all(10), child: Text(this.clothesItems[index].item != null && clothesItems[index].item!.isNotEmpty ? clothesItems[index].color! + " " + (clothesItems[index].item ?? "") : "", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),))),
                              Column(
                                children: [
                                  TextButton(onPressed: () => removeClothesItem(index) , 
                                  child: 
                                    Row(
                                    children: [
                                      Icon(Icons.remove_circle, color: Colors.red,),
                                      Text("Избриши", style:TextStyle(color: Colors.red))
                                      ],)
                                      ,
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),),
                                  TextButton(onPressed: () => editClothesItemDialog(index) , 
                                  child: 
                                    Row(
                                    children: [
                                      Icon(Icons.edit_attributes, color: Colors.red,),
                                      Text("Измени", style:TextStyle(color: Colors.red))
                                      ],)
                                      ,
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),),
                                ],
                              ),
                                  
                            ],),

                        ],
                      ),
                    );
                      
                  }),
                  
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        child: FloatingActionButton.extended(
          onPressed: addClothesItemDialog,
          label: const Text("Додади ново парче облека",style: TextStyle(color: Colors.red),),
          backgroundColor: Colors.green,
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
