import 'package:flutter/material.dart';
import 'package:flutter_application_1/welcome.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "\$22/Per Night",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Book",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 25)],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/st annes.jpg"),
                        fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                            
                          ),
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        child: InkWell(
                          splashColor: Colors.pink,
                          focusColor: Colors.pink,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 20,
                            
                          ),
                          onTap: () {

                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "St Anne Hotel",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                      child: Text(
                        "Air BnB",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade700,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.yellow.shade700,
                ),
              ],
            ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text("Description",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                 ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: Text("St Anne Hotel offers ultimate comfort and luxury. This 4-storied hotel is a beautiful combination of traditional grandeur and modern facilities. The 255 exclusive guest rooms are furnished with a range of modern amenities such as television and internet access. International direct-dial phone and safe are also available in any of these rooms. Wake-up call facility is also available in these rooms. ",
                 style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                 ),
                 ),
               )
             ],
           )
          ],
        ),
      ),
    );
  }
}
