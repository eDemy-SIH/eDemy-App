import 'package:flutter/material.dart';
import 'package:sih_app/widgets/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final _controller=PageController();
  bool isLastPage=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        padding: EdgeInsets.only(bottom: 70),
        child: PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() => isLastPage = index==2);
          },
          children: const [
            Onboarding(
              title: "Career Counciling",
              subtitle: "Here in eDemy, we provides best career counseling using artificial intelligence and machne learning to provide youngsters with best possible career choices",
              imagestring: "assets/images/student1.png",
            ),
            Onboarding(
              title: "Discover Unique Careers",
              subtitle: "Here in eDemy, we provides best career counseling using artificial intelligence and machne learning to provide youngsters with best possible career choices",
              imagestring: "assets/images/student1.png",
            ),
            Onboarding(
              title: "Aptitude Testing",
              subtitle: "Here in eDemy, we provides best career counseling using artificial intelligence and machne learning to provide youngsters with best possible career choices",
              imagestring: "assets/images/student1.png",
            ),
          ],
        ),
      ),

      bottomSheet: isLastPage?
      TextButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/basicInfo')
        }, 
        child: Text(
          "Get Started",
          style: TextStyle(fontSize: 24),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),
          foregroundColor: context.canvasColor,
          backgroundColor: context.cardColor,
          minimumSize: const Size.fromHeight(70)
        ),

      ):
      
      Container(
        decoration: BoxDecoration(
          color: context.canvasColor,
          borderRadius: BorderRadius.circular(5)
        ),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: ()=>_controller.jumpToPage(2), 
                child: Text("SKIP")
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(),
                  onDotClicked: (index)=>_controller.animateToPage(
                    index, 
                    duration: Duration(milliseconds: 500), 
                    curve: Curves.easeInOut
                  ),
                ),
              ),
              TextButton(
                onPressed: ()=>_controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut
                ), 
                child: Text("NEXT")
              )
            ]
          ),
        ),
      ),
    );
    
  }
}