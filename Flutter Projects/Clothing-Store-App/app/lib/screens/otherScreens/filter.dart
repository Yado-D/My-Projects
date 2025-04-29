import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/adminSide/tool.dart';

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  String gender = '';
  List<Button> genders = [
    Button(name: 'All', id: '', isClicked: false),
    Button(name: 'Men', id: 'male', isClicked: false),
    Button(name: 'Women', id: 'female', isClicked: false)
  ];
  List<Button> brand = [
    Button(name: 'Adidas', isClicked: false),
    Button(name: 'Puma', isClicked: false),
    Button(name: 'CR7', isClicked: false),
    Button(name: 'Nike', isClicked: false),
    Button(name: 'Yeezy', isClicked: false),
    Button(name: 'Supreme', isClicked: false),
  ];
  List<Button> colors = [
    Button(name: 'White', isClicked: false),
    Button(name: 'Black', isClicked: false),
    Button(name: 'Grey', isClicked: false),
    Button(name: 'Yellow', isClicked: false),
    Button(name: 'Red', isClicked: false),
    Button(name: 'Green', isClicked: false),
  ];

  String color = '';
  double current_slidder = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeUI.darker,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ThemeUI.darker,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: ThemeUI.texto,
            ),
          ),
          title: SingleChildScrollView(
            child: Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  color: ThemeUI.texto,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeUI.texto,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: genders.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: genders[index].isClicked
                                    ? Colors.blue
                                    : ThemeUI.light,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    gender = genders[index].name;
                                    genders[index].clicked();
                                  });
                                },
                                child: Text(
                                  genders[index].name,
                                  style: TextStyle(
                                    color: ThemeUI.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            )
                          ],
                        );
                      },
                    )),
                Text(
                  'Brand',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeUI.texto,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                        brand.length,
                        (index) => Container(
                              decoration: BoxDecoration(
                                color: brand[index].isClicked
                                    ? Colors.blue
                                    : ThemeUI.light,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    brand[index].clicked();
                                  });
                                },
                                child: Text(
                                  brand[index].name,
                                  style: TextStyle(
                                    color: ThemeUI.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Price Range',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeUI.texto,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${current_slidder}',
                      style: TextStyle(
                        color: ThemeUI.texto,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '\$ 543',
                      style: TextStyle(
                        color: ThemeUI.texto,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: current_slidder,
                  max: 500,
                  //divisions: 5,
                  label: current_slidder.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      current_slidder = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeUI.texto,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                        colors.length,
                        (index) => Container(
                              decoration: BoxDecoration(
                                color: colors[index].isClicked
                                    ? Colors.blue
                                    : ThemeUI.light,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    colors[index].clicked();
                                    color = colors[index].name;
                                  });
                                },
                                child: Text(
                                  colors[index].name,
                                  style: TextStyle(
                                    color: ThemeUI.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ))),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Color.fromARGB(255, 239, 207, 207),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Another options',
                          style: TextStyle(
                            color: Color(0xffB81736),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: MaterialButton(
                    height: 70,
                    minWidth: 400,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/search',
                          arguments: {'gender': gender, 'color': color});
                    },
                    color: ThemeUI.primary,
                    child: Text(
                      'Apply Filter',
                      style: TextStyle(
                        fontSize: 15,
                        color: ThemeUI.darker,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Button {
  String name;
  bool isClicked;
  var id;

  Button({required this.name, required this.isClicked, this.id});

  void clicked() {
    isClicked = !isClicked;
  }
}
