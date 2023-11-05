import 'package:college_project/view/diet_screen/dietselect.dart';
import 'package:flutter/material.dart';

class FoodAllergy extends StatefulWidget {
  const FoodAllergy({super.key});

  @override
  State<FoodAllergy> createState() => _FoodAllergyState();
}

class _FoodAllergyState extends State<FoodAllergy> {
  List<Map> allergy = [
    {"logo": "assets/images/allergyitems/milk.png", "name": "milk"},
    {"logo": "assets/images/allergyitems/fish.png", "name": "fish"},
    {"logo": "assets/images/allergyitems/tree_nut.png", "name": "Tree Nuts"},
    {"logo": "assets/images/allergyitems/peanut.png", "name": "Peanuts"},
    {"logo": "assets/images/allergyitems/chicken.png", "name": "Chicken"},
    {
      "logo": "assets/images/allergyitems/shelfish.png",
      "name": "Crustacean shelfish"
    },
    {"logo": "assets/images/allergyitems/wheat.png", "name": "wheat"},
    {"logo": "assets/images/allergyitems/egg.png", "name": "eggs"},
    {"logo": "assets/images/allergyitems/soy.png", "name": "soy"},
    {"logo": "assets/images/allergyitems/gluten.png", "name": "Gluten"},
    {"logo": "assets/images/allergyitems/lactose.png", "name": "Lactose"},
    {"logo": "assets/images/allergyitems/other.png", "name": "Other"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Food Allergies",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Text("Select ingredients you are allergic to",
                style: TextStyle(fontSize: 15)),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.white,
                width: double.infinity,

                // circular avatar(allergy selection)
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: allergy.length,
                  itemBuilder: (context, index) =>

                      // image
                      Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(children: [
                      Positioned(
                          top: 5,
                          left: 10,
                          right: 10,
                          child: CircleAvatar(
                            radius: 38,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image(
                                image: AssetImage(allergy[index]["logo"]),
                              ),
                            ),
                          )),

                      // selected indicator
                      Positioned(
                          right: 13,
                          top: 12,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 8,
                            ),
                          )),

                      // Name
                      Positioned(
                        top: 60,
                        left: 19,
                        right: 19,
                        child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(blurRadius: 2)],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: Center(
                                  child: Text(
                                allergy[index]["name"],
                                style: TextStyle(fontSize: 13),
                              )),
                            )),
                      )
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: InkWell(
          onTap: () => showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Write your other allergies",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Write here....")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dietselect())),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(20)),
                              height: 60,
                              child: Center(
                                  child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dietselect()));
                            },
                            child: Text(
                              "No, Thanks",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                );
              }),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(20)),
            height: 60,
            child: Center(
                child: Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}
