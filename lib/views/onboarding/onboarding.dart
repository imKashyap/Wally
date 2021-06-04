import 'package:flutter/material.dart';
import 'package:wally/models/onboard_slider.dart';
import 'package:wally/view_models/view_provider.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<SliderModel> mySLides = [];
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              controller.animateToPage(2,
                  duration: Duration(milliseconds: 400), curve: Curves.linear);
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              )
            ],
          ),
        ),
      ),
      bottomSheet: slideIndex != 2
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  slideIndex == 0
                      ? TextButton(
                          onPressed: null,
                          child: Text(''),
                        )
                      : TextButton(
                          onPressed: () {
                            controller.animateToPage(slideIndex - 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          child: Text(
                            "  PREVIOUS",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                  Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == slideIndex
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.animateToPage(slideIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>  ViewProvider()));
              },
              child: Container(
                height: 60,
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                child: Text(
                  "START READING",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(height: 350, child: Image.asset(imagePath)),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
        ],
      ),
    );
  }
}
