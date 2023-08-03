
import 'package:criccoin/Login.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {

  @override
  Widget build(BuildContext context) {
    final _pageViewController = PageController();
    final _currentPageNotifier = ValueNotifier<int>(0);

    final List<Widget> _pages = [
      const OnboardingPage(
        color: Colors.white,
        image: 'assets/Icons/onboarding1.png',
        title: 'Welcome to Criccoin',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tempus cursus et faucibus venenatis consectetur sed auctor.',
        buttonText: 'Continue',
      ),
      const OnboardingPage(
        color: Colors.white,
        image: 'assets/Icons/onboarding1.png',
        title: 'Welcome to Criccoin',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat tempus cursus et faucibus venenatis consectetur sed auctor.',
        buttonText: 'Continue',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: ListView(
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                child: Text("Skip",
                style: TextStyle(
                  color: const Color(0xff0BA4F6),
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  // fontFamily: GoogleFonts.poppins().fontFamily,
                )
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.87,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageViewController,
                      onPageChanged: (int page) {
                        _currentPageNotifier.value = page;
                      },
                      children: _pages,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}

class OnboardingPage extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String description;
  final String buttonText;

  const OnboardingPage({
    Key? key,
    required this.color,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            child: Image.asset(image, fit: BoxFit.fill),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              description,
              style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.30),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: const BoxDecoration(
                color: Color(0xff0BA4F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.01),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
