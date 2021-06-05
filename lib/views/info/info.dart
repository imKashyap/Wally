import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  String info =
      'I am currently a pre-final year student under Electrical Engineering in IEM, Kolkata. I have a no. of flutter apps on Github.';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('About'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(right: width * 0.05, left:  width * 0.05, top: 25.0),
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/icons/logo.png',
                      scale: 4.5,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wally',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text('1.0.0',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.grey)),
                      const SizedBox(height: 10.0),
                      _buildSocialButton('assets/icons/github.png')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      height: height * 0.4,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: height * 0.09,
                          ),
                          Text(
                            'Designed & Developed by',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 3.0),
                          Text(
                            'Rahul Kashyap',
                            style: Theme.of(context).textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              const SizedBox(
                                width: 95.0,
                              ),
                              _buildSocialButton('assets/icons/linkedin.png'),
                              const SizedBox(
                                width: 15.0,
                              ),
                              _buildSocialButton('assets/icons/github.png'),
                              const SizedBox(
                                width: 15.0,
                              ),
                              _buildSocialButton('assets/icons/gmail.png'),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Divider(
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            info,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.13,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/me.jpg'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Powered by pexels.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.grey[700], fontSize: 15.0),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildSocialButton(String path) {
    double scale = 30;
    if (path == 'assets/icons/linkedin.png')
      scale = 34;
    else if (path == 'assets/icons/gmail.png') scale = 27;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            path,
            scale: scale,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
