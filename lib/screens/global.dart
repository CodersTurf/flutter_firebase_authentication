import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Global extends StatefulWidget {
  @override
  _Global createState() => _Global();
}

class _Global extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar(context, 'Global Reach'),
        drawer: AppDrawer(),
        body:  Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/1ss.jpg"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'CCR’s Strategic Acquisition in Asia',
                            style: (TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 15,
                          ),  getImageBox('',
                              'assets/images/of.jpg'),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            """Through its partnership with Plus 3 and Quantum Global Solutions effective from 6 April 2020, CCR will bring additional products, services and resources to enhance the international geographical scope and delivery of our contractual and commercial services, maintaining our existing client relationships in Australia and New Zealand while establishing new client relationships around the world.""",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            """“We believe the merger is a meeting of collective spirits and minds, dedicated to enhancing each of our individual services to our local and global clients under one umbrella. Working in partnership with Quantum and CCR was a natural step to share knowledge, resources and skills among our respective regions to offer our clients a cost-effective, localised hub with our renowned customer-focused approach to your projects.’’
Mike McIver, CEO, Plus 3""",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            """“The merging of our three industry specialists into one company brings great value to all three organisations. Our clients will all capitalise on our respective specialisms and we all have the ability to deliver new services to enhance our client services.”
Tony Hilton, Director, CCR""",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            """“Over the past three decades, with offices in Malaysia and Hong Kong, Plus 3 has become renowned across Asia for their high level of professional consultancy services to the construction industry. The Quantum family is extremely proud to be part of the Plus 3 restructure and to be working with CCR who are already a major force in the Australian construction Sector.”
Peter Murphy, Managing Director,Quantum""",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child: Column(
                                children: [
                                  Text('Meet Our Teams'),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Wrap(children: [
                                    getImageBox('',
                                        'assets/images/1s.jpg'),
                                    getImageBox('',
                                        'assets/images/2d.jpg'),
                                    getImageBox('',
                                        'assets/images/3r.jpg'),
                                  ]),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Footer()
                  ],
                ))));
  }

  getImageBox(String name, String image) {
    return Column(children: [
      Image.asset(image),
      SizedBox(
        height: 5,
      ),
      Text(name)
    ]);
  }

  getColoredBox(String header, String text) {
    Color color;
    return Container(
        padding: EdgeInsets.all(18),
        color: color = Color.fromRGBO(240, 136, 46, 0.5),
        child: Column(children: [
          Row(
            children: [
              Text(header,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                  ))
            ],
          )
        ]));
  }
}
