import 'package:flutter/material.dart';

class Dietselect extends StatelessWidget {
   Dietselect({super.key});

  List<Map> diet=[
 
  {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"Non vegiterian"
  },
    {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"Vegan"
  },
  {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"Vegiterian"
  },
    {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"Kosher"
  },
  {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"Halal"
  },
    {
    "logo":"assets/images/allergyitems/fish.png",
    "name":"other"
  },
  
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Prefrences",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
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
             Text("Please Select your dietry choice",style: TextStyle(fontSize: 15)),
             Expanded(
               child: Container(
                height: 100,
                color: Colors.white,
                width: double.infinity,

                // circular avatar(diet selection)
                 child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: diet.length,itemBuilder: (context, index) =>

                  // image
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children:[
                        Positioned(
                          top: 5,left: 10,right: 10,
                          child: CircleAvatar(radius: 38,backgroundColor: Colors.amber,
                          )),

                          // selected indicator
                        Positioned(
                          right: 13,
                          top: 12,
                          child: CircleAvatar(radius: 10,)
                          ),

                          // Name
                          Positioned(
                            top: 60,left: 19,right: 19,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                  blurRadius: 2
                                )],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                                ),
                              child:Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: Center(child: Text(diet[index]["name"],style: TextStyle(fontSize: 13),)),
                              )),
                          )
                      ] ),
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20)
              ),
            height: 60,
            child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 25),)),
          ),
        ),
      ),
    );
  }
}
  