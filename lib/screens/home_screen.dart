import 'package:airline/screens/ticket_view.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Statistique/ListStatistique.dart';
import '../utils/app_info_list.dart';
import '../utils/app_styles.dart';
import '../widgets/double_text_widget.dart';
import 'hotel_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Good Morning',
                        //   style: Styles.headLineStyle3,
                        // ),
                        const Gap(5),
                        Text(
                          'Vols-Hotels',
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/avion1.png'))),
                    ),
                  ],
                ),
                const Gap(25),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD)),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205)),
                      Text(
                        'Search',
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(
                  bigText: 'Vols à Venir',
                  smallText: 'Voir Tout',
                )
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
                children: ticketList
                    .map((singleTicket) => TicketView(ticket: singleTicket))
                    .toList()),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const AppDoubleTextWidget(
              bigText: 'Hotels',
              smallText: 'Voir Tout',
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
                children: hotelList
                    .map((singleHotel) => HotelScreen(hotel: singleHotel))
                    .toList()),
          ),
          Container(
            width: 400,
            height: 400,
            child: PieChart(
              PieChartData(
                // pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {}),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: ListStatistique().showingSections(),
              ),
            ),
          ),
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              color: Colors.red,
            ),
            title: Text('Vols'),
            subtitle: Text('en retard'),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Center(child: Text('Detaill Autre Document')),
            //         content: Container(
            //           height: 520,
            //           width: 600,
            //           child: Column(
            //             // mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(children: [
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Column(
            //                   children: [Text('Type')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('Nomber')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('%')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Medical'),
            //                     Icon(Icons.picture_as_pdf),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 80,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('EtatCivil'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/word.jpg'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Sport'),
            //                     Container(
            //                       height: 33,
            //                       width: 33,
            //                       child:
            //                           Image.asset('assets/images/Excel1.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Autre'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/auter.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Container(
            //                   height: 20,
            //                   color: Colors.cyan,
            //                 ),
            //                 Column(
            //                   children: [
            //                     Text('Total'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/total.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //             ],
            //           ),
            //         ),
            //         actions: <Widget>[
            //           Center(
            //             child: FloatingActionButton(
            //               child: Center(child: Text('OK')),
            //               backgroundColor: Colors.cyan,
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // },
          ),
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              color: Colors.green,
            ),
            title: Text('Vols'),
            subtitle: Text('sans retard'),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Center(child: Text('Detaill Autre Document')),
            //         content: Container(
            //           height: 520,
            //           width: 600,
            //           child: Column(
            //             // mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(children: [
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Column(
            //                   children: [Text('Type')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('Nomber')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('%')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Medical'),
            //                     Icon(Icons.picture_as_pdf),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 80,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('EtatCivil'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/word.jpg'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Sport'),
            //                     Container(
            //                       height: 33,
            //                       width: 33,
            //                       child:
            //                           Image.asset('assets/images/Excel1.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Autre'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/auter.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Container(
            //                   height: 20,
            //                   color: Colors.cyan,
            //                 ),
            //                 Column(
            //                   children: [
            //                     Text('Total'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/total.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //             ],
            //           ),
            //         ),
            //         actions: <Widget>[
            //           Center(
            //             child: FloatingActionButton(
            //               child: Center(child: Text('OK')),
            //               backgroundColor: Colors.cyan,
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // },
          ),
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              color: Colors.yellow,
            ),
            title: Text('Vols'),
            subtitle: Text('en cors..'),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Center(child: Text('Detaill Autre Document')),
            //         content: Container(
            //           height: 520,
            //           width: 600,
            //           child: Column(
            //             // mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(children: [
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Column(
            //                   children: [Text('Type')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('Nomber')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('%')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Medical'),
            //                     Icon(Icons.picture_as_pdf),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 80,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('EtatCivil'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/word.jpg'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Sport'),
            //                     Container(
            //                       height: 33,
            //                       width: 33,
            //                       child:
            //                           Image.asset('assets/images/Excel1.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Autre'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/auter.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Container(
            //                   height: 20,
            //                   color: Colors.cyan,
            //                 ),
            //                 Column(
            //                   children: [
            //                     Text('Total'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/total.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //             ],
            //           ),
            //         ),
            //         actions: <Widget>[
            //           Center(
            //             child: FloatingActionButton(
            //               child: Center(child: Text('OK')),
            //               backgroundColor: Colors.cyan,
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // },
          ),
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              color: Colors.blue,
            ),
            title: Text('Vols'),
            subtitle: Text('a venir'),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Center(child: Text('Detaill Autre Document')),
            //         content: Container(
            //           height: 520,
            //           width: 600,
            //           child: Column(
            //             // mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Row(children: [
            //                 SizedBox(
            //                   height: 50,
            //                 ),
            //                 Column(
            //                   children: [Text('Type')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('Nomber')],
            //                 ),
            //                 SizedBox(
            //                   width: 60,
            //                 ),
            //                 Column(
            //                   children: [Text('%')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Medical'),
            //                     Icon(Icons.picture_as_pdf),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 80,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('EtatCivil'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/word.jpg'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Sport'),
            //                     Container(
            //                       height: 33,
            //                       width: 33,
            //                       child:
            //                           Image.asset('assets/images/Excel1.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 70,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Column(
            //                   children: [
            //                     Text('Autre'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/auter.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(children: [
            //                 Container(
            //                   height: 20,
            //                   color: Colors.cyan,
            //                 ),
            //                 Column(
            //                   children: [
            //                     Text('Total'),
            //                     Container(
            //                       height: 20,
            //                       width: 20,
            //                       child: Image.asset('assets/images/total.png'),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(
            //                   width: 65,
            //                 ),
            //                 Column(
            //                   children: [Text('100')],
            //                 ),
            //                 SizedBox(
            //                   width: 68,
            //                 ),
            //                 Column(
            //                   children: [Text('100 %')],
            //                 )
            //               ]),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //             ],
            //           ),
            //         ),
            //         actions: <Widget>[
            //           Center(
            //             child: FloatingActionButton(
            //               child: Center(child: Text('OK')),
            //               backgroundColor: Colors.cyan,
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
