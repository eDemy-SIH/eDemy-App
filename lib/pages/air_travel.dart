import 'package:sih_app/widgets/next_buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AirTravel extends StatefulWidget {
  const AirTravel({super.key});

  @override
  State<AirTravel> createState() => _AirTravelState();
}

class _AirTravelState extends State<AirTravel> {

  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: const BoxDecoration(

        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.canvasColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.cardColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/plane-banner.jpg"),
                        fit: BoxFit.cover
                      ),
                    ),

                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 30,left: 20),
                    child: Text(
                      "Air Travel",
                      style: TextStyle(
                        fontSize: 28
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: Text(
                      "Select the amount of hours spent monthly on air travel",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 50),
                  child: Row(
                    children:[  
                      
                      Text("Enter Total Hours",style: TextStyle(fontSize: 18),) ,     
                      SizedBox(width: 40,),           
                      Flexible(
                        child: SizedBox(
                          width: 100,
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:  Color.fromRGBO(231, 216, 233, 1),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                  width: 4.0,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: context.cardColor,
                                  width: 4.0,
                                ),
                              ),
                              hintText: 'hours',
                            ),    
                            controller: controller
                          ),
                        ),
                      ),
                          
                    ]              
                  ),
                ),
                 
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, '/electricBill')
                          },
                          child: NextButton(text: "Next")
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}