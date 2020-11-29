import 'package:ccrwork_mobile/colors.dart';
import 'package:ccrwork_mobile/screens/looter.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'Welcome to CCR',
                    style:
                        (TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Transforming Infrastructure Projects into Commercial Success.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(

                    height:10,
                  ),
                  Looter(),
                  SizedBox(
                    height: 25,
                  ),



                  getColoredBox("Project Consultancy",
                      """CCR provides a comprehensive range of construction and engineering services managed by our highly qualified teams of engineers, quantity surveyors, project managers, commercial managers and legal advisors.
We are more than able to successfully manage and deliver on both domestic and international projects utilising our expertise in, contract and commercial advice, procurement, estimating, planning and scheduling, claims preparation, construction management, dispute resolution, and more.
            
            """),
                  SizedBox(
                    height: 15,
                  ),
                  getColoredBox("Project Resourcing",
                      """CCR’s industry-leading commercial resources efficiently provide maximum practical support, from start to finish, in order to guarantee the success of all your construction and engineering projects, and to ensure the future success of all our partnerships.

We’ve carefully built a pool of highly experienced and available talent that are all at your disposal, and we’re always ready to assign the right person to the right job.


            """),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Footer()
          ],
        )));
  }

  getColoredBox(String header, String text) {
    Color color;
    return Container(
        padding: EdgeInsets.all(18),
        color:color = Color.fromRGBO(240, 136, 46,0.5),
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
