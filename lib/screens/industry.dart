import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Industry extends StatefulWidget {
  @override
  _Industry createState() => _Industry();
}

class _Industry extends State<Industry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar(context, 'Industry'),
        drawer: AppDrawer(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home_bck.jpg"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'Industry Sectors',
                            style:
                            (TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Combined technical proficiency across multiple industries',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          getColoredBox('',"""CCR provides a comprehensive range of construction and engineering services managed by our highly qualified teams of engineers, quantity surveyors, project managers, commercial managers and legal advisors.
We are more than able to successfully manage and deliver on both domestic and international projects utilising our expertise in, contract and commercial advice, procurement, estimating, planning and scheduling, claims preparation, construction management, dispute resolution, and more."""),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              child:Column(children: [
                                Text('Industry sectors we cover are:'),
                                SizedBox(height: 10,),
                                Wrap(children: [
                                  getImageBox('','assets/images/1.jpg'),
                                  getImageBox('','assets/images/2.jpg'),
                                  getImageBox('','assets/images/3.jpg'),
                                  getImageBox('','assets/images/4.jpg'),
                                  getImageBox('','assets/images/5.jpg'),
                                  getImageBox('','assets/images/6.jpg'),
                                  getImageBox('','assets/images/7.jpg'),
                                  getImageBox('','assets/images/8.jpg'),
                                ]),
                              ],)
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
  getImageBox(String name,String image)
  {
    return Column(children: [
      Image.asset(image),
      SizedBox(height: 5,),
      Text(name)
    ]);
  }
  getColoredBox(String header, String text) {
    return Container(
        padding: EdgeInsets.all(18),
        color: AppColor.mainColor,
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
