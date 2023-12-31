import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DiscoverCareers extends StatefulWidget {
  const DiscoverCareers({super.key});

  @override
  State<DiscoverCareers> createState() => _DiscoverCareersState();
}

class _DiscoverCareersState extends State<DiscoverCareers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.cardColor),
        backgroundColor: Colors.transparent,
      ),  
      body:  SafeArea(
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              Container(
                child: Text(
                  "Discover Careers",
                  style: TextStyle(fontSize: 30, fontFamily: 'FontMain'),
                ),
              ),


                SizedBox(height: 20,),

                Container(
                  child: Text(
                    "Check out all the existing careers awaiting for you",
                    style: TextStyle(fontSize: 16, fontFamily: 'FontMain'),
                  ),
                ),
                SizedBox(height: 40,),


              Expanded(
                child: SizedBox(
                  height: 800,
                  child: GridView.count(
                    crossAxisCount: 2,
                    // padding: EdgeInsets.all(10),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/engineer')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/Civil-Engineer-Real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                              ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Engineering\n 8 options",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/graphics')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/graphics-designer-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Graphics\n 6 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/medicine')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/doctor-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Medicine\n 7 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/management')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/management-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.center,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Management\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/graduate')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/sales-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Graduate\n 6 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/finance')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/finance-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Finance\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/education')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/teacher-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Education\n 4 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/journalism')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/journalist-real-min.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Journalism\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/civil')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/police-real.png"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Civil Services\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/humanities')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/language-real.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Humanities\n 8 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/marketing')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/digital-marketing.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Marketing\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/aviation')
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage("assets/images/pilot.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      textAlign:TextAlign.end,
                                      "Aviation\n 5 options",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 225, 225, 225)),
                                )),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )

              ],
            ),
          ),
        )
      );  
    
  }
}


